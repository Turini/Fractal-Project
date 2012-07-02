package br.com.fractal.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.ProjetoDAO;
import br.com.fractal.model.Projeto;


@Controller
public class ProjetoController {

	@RequestMapping("addProject")
	public String adiciona(Projeto projeto, HttpServletRequest request) {
		EntityManager em = (EntityManager) request.getAttribute("em");
		new ProjetoDAO(em).adiciona(projeto);
		return "redirect:apresentacao";	
	}
	
	@RequestMapping("deleteProject")
	public void remove(Long id, HttpServletRequest request, HttpServletResponse response) {
		
		EntityManager em = (EntityManager) request.getAttribute("em");
		
		ProjetoDAO dao = new ProjetoDAO(em);
		
		Projeto projeto = dao.buscaPorId(id);
		dao.remove(projeto);
		
		response.setStatus(200);
	}
	
}
