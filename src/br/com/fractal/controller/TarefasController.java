package br.com.fractal.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.fractal.dao.ComentariosDAO;
import br.com.fractal.dao.ProjetoDAO;
import br.com.fractal.dao.TarefasDAO;
import br.com.fractal.model.Tarefas;
import br.com.fractal.model.enums.Estado;

@Controller
@RequestMapping("project")
public class TarefasController {

	@RequestMapping("addTask")
	public String addTask(Tarefas tarefas, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		new TarefasDAO(em).adiciona(tarefas);
		return "redirect:"+tarefas.getProjeto_id();
	}

	@RequestMapping("removeTask")
	public String remove(Long id, Tarefas tarefas, HttpServletRequest request) {
		EntityManager em = (EntityManager) request.getAttribute("em");
		TarefasDAO dao = new TarefasDAO(em);
		Tarefas taskLoaded = dao.buscaPorId(id);
		new ComentariosDAO(em).removeComentariosDaTarefa(taskLoaded);
		dao.remove(taskLoaded);
		return "redirect:"+taskLoaded.getProjeto_id();
	}

	@RequestMapping("showTask")
	public String showTask(Long id, Model model, HttpServletResponse response, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		TarefasDAO tarefasDAO = new TarefasDAO(em);
		Tarefas tarefa = tarefasDAO.buscaPorId(id);
		model.addAttribute("tarefa", tarefa);
		model.addAttribute("projeto", tarefa.getProjeto_id());
		model.addAttribute("estados", Estado.values());
		model.addAttribute("comentario", tarefasDAO.buscaComentarioPorTarefa(tarefa));
	
		response.setStatus(200);
		return "dados-do-dialog";
	}
	
	@RequestMapping("changeTask")
	public String changeTask(Tarefas tarefas, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		new TarefasDAO(em).altera(tarefas);
		return "redirect:"+tarefas.getProjeto_id();
	}
	
	@RequestMapping("{id}")
	public String projectAccess(@PathVariable Long id, Model model, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		model.addAttribute("estados", Estado.values());
		
		if(id != null) {
			model.addAttribute("tarefas", new TarefasDAO(em).listaPorProjeto(id));
			model.addAttribute("currentProject", new ProjetoDAO(em).buscaPorId(id));
		}
		return "menu";
	}
	
	@RequestMapping("changeStatus")
	public void changeStatus(HttpServletRequest resquest, HttpServletResponse response, Estado status, Long taskId) {
		EntityManager em = (EntityManager) resquest.getAttribute("em");
		TarefasDAO dao = new TarefasDAO(em);
		Tarefas tarefaLoaded = dao.buscaPorId(taskId);
		tarefaLoaded.setEstado(status);
		dao.altera(tarefaLoaded);
		response.setStatus(200);
	}
	
//	@RequestMapping(value="countTasksByStatus", method=RequestMethod.GET)
//	public @ResponseBody List<Object> countTasksByStatus(@RequestParam long id, HttpServletRequest resquest, Model model, HttpServletResponse response) {
//		EntityManager em = (EntityManager) resquest.getAttribute("em");
//		model.addAttribute("countOfTasks", new TarefasDAO(em).listCountOfTasksByStatus(id));
//		response.setStatus(200);
//		return new TarefasDAO(em).listCountOfTasksByStatus(id);
//	}
	
}
