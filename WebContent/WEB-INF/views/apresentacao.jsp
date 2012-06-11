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
		
	<title>Fractal Tasks (it can work)</title> 
	
	<style type="text/css">
	
	#projectBox{
		background-color: darkGray;
		width: 500px;
		height: 200px;
		float: right;
		border-radius: 20px;
		font: menu;
	}
	
	#projects{
		background-color: lightGrey;
		margin-left: 1%;
		font: menu;
		width: 98%;
	}
	
	#space{
		background-color: darkGray;
		margin-left: 1%;
		width: 98%;
		height: 2%;
	}
		
	</style>
	
	</head>

<body>

<br/> Voce esta logado como ${usuarioLogado.login}, <a href="logout">logout</a>.

<br/><br/><br/>

<br/>

	<div id="projectBox">
		<!-- Insert a if clause to verify if exist some project   -->
		<!-- If don't, just show the message: Create a new one =) -->
		<h3 style="margin-left: 3%;">These are your current projects:</h3>
		
		<c:forEach items="${projetos}" var="projeto">
			<div id="projects"> 
			${projeto.nome} - created by: (user name) on: (date of creation) 
			<a href="Menu?id=${projeto.id}">>></a>
			</div>
			
			<div id="space"></div>
		</c:forEach>
	</div>

</body>

</html>