package br.com.fractal.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.ProjetoDAO;
import br.com.fractal.dao.TarefasDAO;
import br.com.fractal.dao.UsuariosDAO;
import br.com.fractal.model.Usuarios;

@Controller
public class LoginController {

	@RequestMapping("loginForm")
	public String loginForm(){
		return "formularioDeLogin";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuarios usuarios, HttpSession sess, HttpServletRequest request, Model model){
		
		EntityManager em = (EntityManager) request.getAttribute("em");
		
		UsuariosDAO usuariosDAO = new UsuariosDAO(em);
		Usuarios usuario = usuariosDAO.existeUsuario(usuarios);
		
		// if the user exist, they're redirect to menu interface.
		if(usuario!=null){
			sess.setAttribute("usuarioLogado", usuario);
			return dashboard(null, usuario, request, model);
		} else {
			model.addAttribute("errorMessage", "Invalid user and password, please try again.");
			return loginForm();
		}
	}
	
	@RequestMapping("dashboard/{id}")
	public String dashboard(@PathVariable Long id, Usuarios usuario, HttpServletRequest request, Model model) {
		EntityManager em = (EntityManager) request.getAttribute("em");
		model.addAttribute("projetos", new ProjetoDAO(em).listaProjetos());
		Long userId = usuario.getId() == null ? id : usuario.getId();
		model.addAttribute("projetosDoUsuario", new UsuariosDAO(em).listaProjetosDoUsuario(userId));
		model.addAttribute("countOfTasksByProject", new TarefasDAO(em).listCountOfTasksAndStatusByProject());
		model.addAttribute("team", new UsuariosDAO(em).listUsersByProject());
		return "apresentacao";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:loginForm";
	}
}
