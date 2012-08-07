package br.com.fractal.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.ProjetoDAO;
import br.com.fractal.dao.TarefasDAO;
import br.com.fractal.model.Tarefas;
import br.com.fractal.model.enums.Estado;


@Controller
public class TarefasController {

	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefas tarefas, BindingResult result, HttpServletResponse response, HttpServletRequest request){
		
		if (!result.hasFieldErrors("descricao")) {

			EntityManager em = (EntityManager) request.getAttribute("em");
			
			new TarefasDAO(em).adiciona(tarefas);

			return "redirect:Menu";
			
		} else return "redirect:Menu";
	}

	@RequestMapping("listaTarefas")
	public String lista(Model model, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		TarefasDAO dao = new TarefasDAO(em);
		model.addAttribute("tarefas", dao.lista());
		return "tarefas/lista";
	}

	@RequestMapping("removeTarefa")
	public String remove(Long id, Tarefas tarefas, HttpServletRequest request) {

		EntityManager em = (EntityManager) request.getAttribute("em");

		TarefasDAO dao = new TarefasDAO(em);
		Tarefas buscaPorId = dao.buscaPorId(id);
		dao.remove(buscaPorId);
		
//		response.setStatus(200);
		return "redirect:Menu";
	}

	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model, HttpServletResponse response, HttpServletRequest request){

		EntityManager em = (EntityManager) request.getAttribute("em");
		
		TarefasDAO dao = new TarefasDAO(em);
		
		Tarefas tarefa = dao.buscaPorId(id);
		
		model.addAttribute("tarefa", tarefa);
		model.addAttribute("projeto", tarefa.getProjeto_id());
		
		response.setStatus(200);
		return "dados-do-dialog";
	}
	
	@RequestMapping("alteraTarefa")
	public String altera(Tarefas tarefas, HttpServletRequest request){

		EntityManager em = (EntityManager) request.getAttribute("em");

		TarefasDAO dao = new TarefasDAO(em);
		dao.altera(tarefas);

		return "redirect:Menu";
	}
	
	@RequestMapping("Menu")
	public String menu(Long id, Model model, HttpServletRequest request){

		EntityManager em = (EntityManager) request.getAttribute("em");

		TarefasDAO dao = new TarefasDAO(em);
//		model.addAttribute("tarefas", dao.lista());
		model.addAttribute("tarefas", dao.listaPorProjeto(id));
		model.addAttribute("projetoId", id);
		model.addAttribute("estados", Estado.values());
		model.addAttribute("allProjects", new ProjetoDAO(em).listaProjetos());
		return "menu";
	}
	
	@RequestMapping("mostraComentariosDaTarefa")
	public String mostra(Long id, Model model, HttpServletResponse response, HttpServletRequest request, Tarefas tarefa){
		
		EntityManager em = (EntityManager) request.getAttribute("em");
//		ComentariosDAO dao = new ComentariosDAO(em);
		TarefasDAO dao = new TarefasDAO(em);
		Tarefas buscaPorId = dao.buscaPorId(id);
		model.addAttribute("comentario", dao.buscaComentarioPorTarefa(buscaPorId));
		
		response.setStatus(200);
		return "comentarios-do-dialog";
	}
	
}
