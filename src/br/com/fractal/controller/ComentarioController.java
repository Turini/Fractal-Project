package br.com.fractal.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.ComentariosDAO;
import br.com.fractal.dao.TarefasDAO;
import br.com.fractal.model.Comentario;
import br.com.fractal.model.Tarefas;

@Controller
@RequestMapping("project")
public class ComentarioController {
	
	@RequestMapping("addComment")
	public String addComment(Long id, Comentario comentario, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		Tarefas tarefa = new TarefasDAO(em).buscaPorId(id);
		comentario.setTarefas(tarefa);
		new ComentariosDAO(em).altera(comentario);
		return "redirect:" + comentario.getTarefas().getProjeto_id();
	}
	
	@RequestMapping("showComments")
	public String showComments(Long id, Model model, HttpServletResponse response, HttpServletRequest request, Tarefas tarefa){
		EntityManager em = (EntityManager) request.getAttribute("em");
		TarefasDAO dao = new TarefasDAO(em);
		Tarefas buscaPorId = dao.buscaPorId(id);
		model.addAttribute("comentario", dao.buscaComentarioPorTarefa(buscaPorId));
		response.setStatus(200);
		return "comentarios-do-dialog";
	}

//	TODO: we'll really use that to list all on history?
	
	@RequestMapping("listaComentarios")
	public String lista(Model model, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		ComentariosDAO dao = new ComentariosDAO(em);
		model.addAttribute("comentario", dao.lista());
		return "comentarios-do-dialog";
	}
	
}