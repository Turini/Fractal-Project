<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" href="<c:url value="/resources/css/jquery.css"/>" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.js"/>"></script>

	<title>Fractal Tasks Project</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/formularioDeLogin.css"/>" type="text/css" /></head>

	<body>
	
		<img id="img" alt="img" src="/FractalProjec/resources/img/FractalLogo.png">
		

		<div id="pageContent">
			<span style="float: right; margin-right: 5%; margin-top: 2%; font-size: smaller;">New here? <b id="sigup">Sign Up</b></span>
		
			<form id="efetuaLogin" action="efetuaLogin" method="post" style="margin-top: 5%;">
			
	            <label id="user" for="login">User: 
	            <input type="text" name="login" class="text ui-widget-content ui-corner-all"/> </label>
	            
	            <label id="password" for="senha">Password: 
	            <input type="password" name="senha" class="text ui-widget-content ui-corner-all" onblur="submit()"/> </label>
	            
			<span style="float: right; margin-right: 5%; margin-top: -1px; font-size: smaller;">Can't access your account?</span>
			</form>
				

			<div id="newUser">
				<form id="addUser" action="adicionaUsuario" method="post">
				
					<label for="login">Login</label>
					<input type="text" name="login" class="text ui-widget-content ui-corner-all" />
					<label for="email">Email</label>
					<input type="text" name="email" class="text ui-widget-content ui-corner-all" />
					<label for="senha">Pass</label>
					<input type="password" name="senha" class="text ui-widget-content ui-corner-all" />
			
					<button type="submit">Add</button>
				</form>			
			</div>
				
		</div>
	
		<div id="footer">
			<span>@FractalTasks-2012 - Version 0.1</span>
		</div>
	   
	</body>

	<script type="text/javascript" src="<c:url value="/resources/js/fractal/formularioDelogin.js"/>"></script>
	
</html>