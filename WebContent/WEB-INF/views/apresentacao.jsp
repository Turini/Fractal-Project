<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>

<html>

	<head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" href="<c:url value="/resources/css/jquery.css"/>" rel="stylesheet">
	<link type="text/css" href="<c:url value="/resources/css/jquery-ui-1.8.21.custom.css"/>" rel="stylesheet">	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	
	<title>Fractal Tasks (it can work)</title> 
	
	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/header.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/apresentacao.css"/>" type="text/css" />	
	<script type="text/javascript" src="<c:url value="/resources/js/fractal/apresentacao.js"/>"> </script>
	<script type="text/javascript"> $(function() { $("button").button(); $("#dialog").dialog();}); </script> </head>

	<body>
	
	<c:import url="header.jsp"/>
	
		<span id="showUser">
			<a id="icon" class="ui-icon ui-icon-person"></a>
			${usuarioLogado.login} (${usuarioLogado.email}) 
		</span>
	
	<div id="addUserToProject">
		<form action="associaEmProjeto">
			<input type="text" name="usuarioId" />		
			<input type="text" name="projetoId" />		
			<input type="submit" value="adicionar usuario em Projeto"/> 
		</form>
	</div>
		
		<div id="projectContainer">
		
			<div id="projectBox">
				<!-- Insert a if clause to verify if exist some project   -->
				<!-- If don't, just show the message: Create a new one =) -->
				<h3>These all current projects:</h3>
				
				<c:forEach items="${projetos}" var="projeto">
					<div id="projects"> ${projeto.nome} - created by: ${projeto.criador} on: ${projeto.dataCriacao}
					<span id="play" class="ui-icon  ui-icon-play" project-id="${projeto.id}"></span> <span id="trash" class="ui-icon ui-icon-trash">${projeto.id}</span> </div>
				</c:forEach>
				
				<span id="create-project">Add a new one...</span>
			</div>	
			
		 	<div id="projectBox">
				<!-- Insert if clause to verify if usuarioLogado == Owner -->
				<!-- If don't, show the projects that he join -->
				<h3>These are your current projects:</h3>
				
				<c:forEach items="${projetosDoUsuario}" var="projetosDoUsuario">
					<div id="projects"> ${projetosDoUsuario.nome} - created by: ${projetosDoUsuario.criador} on: ${projetosDoUsuario.dataCriacao}
					<span id="play" class="ui-icon  ui-icon-play" project-id="${projetosDoUsuario.id}"></span>	<span id="trash" class="ui-icon ui-icon-trash">${projetosDoUsuario.id}</span> </div>
				</c:forEach>
			</div>
			
		</div>
			
		<div id="dialog-project">
			
			<form action="addProject" id="addProject">
			
				<label for="nome">Project Name</label> 
				<input type="text" name="nome" id="nome" maxlength="20" class="text ui-widget-content ui-corner-all"/>
			
				<label for="criador">Project Owner</label> 
				<input type="text" name="criador" id="criador" maxlength="20" class="text ui-widget-content ui-corner-all"/>
			
				<label for="dataInicio">Starting date</label> <homework:campoData name="dataInicio" id="dataInicio"/>
				
			</form>
			
		</div>
		
	</body>

</html>