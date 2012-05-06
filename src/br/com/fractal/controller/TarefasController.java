package br.com.fractal.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.TarefasDAO;
import br.com.fractal.infra.JPAUtil;
import br.com.fractal.model.Tarefas;


@Controller
public class TarefasController {

//	private EntityManager em;

//	ServletRequest request;
//	EntityManager em = (EntityManager) request.getAttribute("em");
	
	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefas/formulario";
	}
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefas tarefas, BindingResult result, HttpServletResponse response){
		if (!result.hasFieldErrors("descricao")) {
			
			EntityManager em = new JPAUtil().getEntityManager();
			em.getTransaction().begin();
			
			new TarefasDAO(em).adiciona(tarefas);

			em.getTransaction().commit();
			em.close();
			
			return "redirect:Menu";
			
		} else return "redirect:Menu";
	}

	@RequestMapping("listaTarefas")
	public String lista(Model model){

		EntityManager em = new JPAUtil().getEntityManager();
		em.getTransaction().begin();

		TarefasDAO dao = new TarefasDAO(em);
		
		model.addAttribute("tarefas", dao.lista());
		
		em.getTransaction().commit();
		em.close();
		
		return "tarefas/lista";
	}

	@RequestMapping("removeTarefa")
	public String remove(Tarefas tarefas) {

		EntityManager em = new JPAUtil().getEntityManager();
		em.getTransaction().begin();

		TarefasDAO dao = new TarefasDAO(em);
		dao.remove(tarefas);
		
		em.getTransaction().commit();
		em.close();
		
//		response.setStatus(200);
		return "redirect:Menu";
	}

	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model, HttpServletResponse response){

		EntityManager em = new JPAUtil().getEntityManager();
		em.getTransaction().begin();

		TarefasDAO dao = new TarefasDAO(em);
		model.addAttribute("tarefa", dao.buscaPorId(id));
		
		em.getTransaction().commit();
		em.close();
		
		response.setStatus(200);
		return "dados-do-dialog";
	}
	
	@RequestMapping("alteraTarefa")
	public String altera(Tarefas tarefas){

		EntityManager em = new JPAUtil().getEntityManager();
		em.getTransaction().begin();

		TarefasDAO dao = new TarefasDAO(em);
		dao.altera(tarefas);

		em.getTransaction().commit();
		em.close();

		return "redirect:Menu";
	}
	
	@RequestMapping("Menu")
	public String menu(Model model){

		EntityManager em = new JPAUtil().getEntityManager();
		em.getTransaction().begin();

		TarefasDAO dao = new TarefasDAO(em);
		model.addAttribute("tarefas", dao.lista());
		
		em.getTransaction().commit();
		em.close();
		
		return "menu";
	}
}
