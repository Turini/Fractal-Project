package br.com.fractal.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.ProjetoDAO;
import br.com.fractal.dao.UsuariosDAO;
import br.com.fractal.model.Usuarios;

@Controller
public class LoginController {

	@RequestMapping("loginForm")
	public String loginForm(){
		return "formularioDeLogin";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuarios user, HttpSession sess, HttpServletRequest request, Model model){
		
		EntityManager em = (EntityManager) request.getAttribute("em");

		// if the user exist, they're redirect to menu interface.
		if(new UsuariosDAO(em).existeUsuario(user)){
			sess.setAttribute("usuarioLogado", user);
			ProjetoDAO dao = new ProjetoDAO(em);
			model.addAttribute("projetos", dao.listaProjetos());
			return "apresentacao";
		}
		// else, they're redirect to loginForm to try access again.
		
		
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:loginForm";
	}
}
