package br.com.fractal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AtualizadorInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		String uri = request.getRequestURI();
		
		if(uri.endsWith("loginForm") || uri.endsWith("efetuaLogin")){
			return true;
		}
		
		if(request.getSession().getAttribute("usuarioLogado")!=null){
			return true;
		}
		
		response.sendRedirect("loginForm");
		return false;
	}

}
