package br.com.fractal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.fractal.dao.ProjetoDAO;
import br.com.fractal.model.Projeto;
import br.com.fractal.util.ProjectIds;


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
	
	@RequestMapping("editProject")
	public String edit(Projeto projeto, HttpServletRequest request) {
		EntityManager em = (EntityManager) request.getAttribute("em");
		ProjetoDAO projetoDAO = new ProjetoDAO(em);
		Projeto loadedProject = projetoDAO.buscaPorId(projeto.getId());
		loadedProject.setNome(projeto.getNome());
		projetoDAO.altera(loadedProject);
		return "redirect:apresentacao";
	}
	
	@RequestMapping(value = "listAllProjects", method = RequestMethod.GET, headers="Accept=*/*")
	public @ResponseBody Map<String, List<ProjectIds>> listAllProjects(HttpServletRequest request, @RequestParam String name) {
		EntityManager em = (EntityManager) request.getAttribute("em");
		
		List<ProjectIds> projectList = new ArrayList<ProjectIds>();
		List<Projeto> allProjectObjects = new ProjetoDAO(em).listByName(name);
				
		for (Projeto projeto : allProjectObjects) {
			projectList.add(new ProjectIds(projeto.getId(), projeto.getNome()));
		}
		Map<String, List<ProjectIds>> projectMap = new HashMap<String, List<ProjectIds>>();
		
		projectMap.put("projectList", projectList);
		return projectMap;
	}

	
}
