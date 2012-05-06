package br.com.fractal.controller;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.fractal.dao.UsuariosDAO;
import br.com.fractal.model.Usuarios;



@Controller
public class LoginController {

	//TODO can it work? Verify if it's the better solution.
	private EntityManager em;

	@RequestMapping("loginForm")
	public String loginForm(){
		return "formularioDeLogin";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuarios user, HttpSession sess){
		
		// if the user exist, they're redirect to menu interface.
		if(new UsuariosDAO(em).existeUsuario(user)){
			sess.setAttribute("usuarioLogado", user);
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
