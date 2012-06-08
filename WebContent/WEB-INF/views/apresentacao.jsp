<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

	<head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="resources/css/jquery.css" rel="stylesheet">
		<script type="text/javascript" src="resources/js/jquery.js"></script>
		<script type="text/javascript" src="resources/js/jquery-ui.js"></script>
		
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
		
	<title>Fractal Tasks (it can work)</title> </head>

<body>

Aqui serah a tela de boas vindas, onde terah uma pequena apresentacao do <br/> 
projeto e apresentara aos usuarios os projetos ao qual ele faz parte ou eh admin <br/> 
para que ele opte por qual deseja acessar... lembrando que isso ainda nao foi <br/>
implementado, ou seja, atualmente soh existe um projeto pra uma empresa. <br/>

<br/> Voce esta logado como ${usuarioLogado.login}, <a href="Menu"> entrar </a>  ou 
<a href="logout">logout</a>.

<br/><br/><br/>
<c:forEach items="${projetos}" var="projeto">
<a href="Menu?id=${projeto.id}">${projeto.nome}</a> <br/>
</c:forEach>

<br/>

</body>

</html>