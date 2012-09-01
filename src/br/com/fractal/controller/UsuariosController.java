package br.com.fractal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.fractal.dao.UsuariosDAO;
import br.com.fractal.model.Usuarios;
import br.com.fractal.util.UserIds;

@Controller
public class UsuariosController {
	
//	private EntityManager em;

	@RequestMapping("telaUsuarios")
	public String lista(Model model, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		UsuariosDAO dao = new UsuariosDAO(em);
		model.addAttribute("usuarios", dao.lista());
		return "usuarios/usuarios";
	}
	
	@RequestMapping("adicionaUsuario")
	public String adiciona(Usuarios usuario, HttpServletRequest request, Model model){
		EntityManager em = (EntityManager) request.getAttribute("em");
		
		UsuariosDAO dao = new UsuariosDAO(em);
		Usuarios userVerify = dao.existeUsuario(usuario);
		
		if (userVerify != null) { 
			model.addAttribute("userAddError", "The user already exist, try another login");
		} else {
			dao.adiciona(usuario);
			model.addAttribute("userAddSuccess", "User successfully registered");
		}
		
		return "formularioDeLogin";
	}
	
	@RequestMapping("removeUsuario")
	public String remove(Usuarios usuarios, HttpServletRequest request){
		EntityManager em = (EntityManager) request.getAttribute("em");
		UsuariosDAO dao = new UsuariosDAO(em);
		dao.remove(usuarios);
		return "redirect:telaUsuarios";
	}

	@RequestMapping("associaEmProjeto")
	public void associaEmProjeto(Long usuarioId, Long projetoId, HttpServletRequest request, HttpServletResponse response) {
		EntityManager em = (EntityManager) request.getAttribute("em");
		new UsuariosDAO(em).associaUsuarioEmProjeto(usuarioId, projetoId);
		response.setStatus(200);
	}
	
	@RequestMapping("removeFromProject")
	public void removeFromProject(HttpServletRequest request, long id, HttpServletResponse response, long pid) {
		EntityManager em = (EntityManager) request.getAttribute("em");
		new UsuariosDAO(em).removeFromProject(id, pid);
		response.setStatus(200);
	}
	
	@RequestMapping(value = "listAllUsers", method = RequestMethod.GET, headers="Accept=*/*")
	public @ResponseBody Map<String, List<UserIds>> listAllUsers(HttpServletRequest request, @RequestParam String login) {
		EntityManager em = (EntityManager) request.getAttribute("em");
		
		List<UserIds> userList = new ArrayList<UserIds>();
//		List<Usuarios> allUserObjects = new UsuariosDAO(em).lista();
		List<Usuarios> allUserObjects = new UsuariosDAO(em).listByLogin(login);
		
				
		for (Usuarios usuario : allUserObjects) {
			userList.add(new UserIds(usuario.getId(), usuario.getLogin()));
		}
		
		Map<String, List<UserIds>> userMap = new HashMap<String, List<UserIds>>();
		
		userMap.put("userList", userList);
		return userMap;

	}
	
}
