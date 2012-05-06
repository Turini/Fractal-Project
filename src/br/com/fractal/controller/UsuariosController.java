package br.com.fractal.controller;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.UsuariosDAO;
import br.com.fractal.model.Usuarios;

@Controller
public class UsuariosController {
	
	private EntityManager em;

	@RequestMapping("telaUsuarios")
	public String lista(Model model){
		UsuariosDAO dao = new UsuariosDAO(em);
		model.addAttribute("usuarios", dao.lista());
		return "usuarios/usuarios";
	}
	
	@RequestMapping("adicionaUsuario")
	public String adiciona(Usuarios usuario){
		new UsuariosDAO(em).adiciona(usuario);
		return "redirect:telaUsuarios";
	}
	
	@RequestMapping("removeUsuario")
	public String remove(Usuarios usuarios){
		
		UsuariosDAO dao = new UsuariosDAO(em);
		dao.remove(usuarios);
		return "redirect:telaUsuarios";
	}

	
	
}
