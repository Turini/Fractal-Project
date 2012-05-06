package br.com.fractal.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.ComentariosDAO;
import br.com.fractal.model.Comentario;

@Controller
public class ComentarioController {
	
	private EntityManager em;

	@RequestMapping("adicionaComentario")
	public String adiciona(@Valid Comentario comentario){
			new ComentariosDAO(em).adiciona(comentario);
			return "redirect:Menu";
	}
	
	@RequestMapping("mostraComentarios")
	public String mostra(Long id, Model model, HttpServletResponse response){
		
		ComentariosDAO dao = new ComentariosDAO(em);
		model.addAttribute("comentario", dao.buscaPorId(id));
		
		response.setStatus(200);
		return "comentarios-do-dialog";
	}

}