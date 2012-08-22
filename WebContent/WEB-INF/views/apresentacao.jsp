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
	
	<script>
	$(function() {
		$( "#accordion" ).accordion();
	});
	</script>
	
	<title>Fractal Tasks</title> 
	
	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/header.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/apresentacao.css"/>" type="text/css" />	
	<script type="text/javascript" src="<c:url value="/resources/js/fractal/apresentacao.js"/>"> </script>
	<script type="text/javascript"> $(function() { $("button").button(); $("#dialog").dialog();}); </script> </head>

	<body>
	
	<c:import url="header.jsp"/>
	
	<div id="accordion">

	    <h3><a href="#">DashBoard?</a></h3>
	    <div></div>
		
	    <h3><a href="#">Your projects</a></h3>
	    <div>
		    <c:forEach items="${projetosDoUsuario}" var="projetosDoUsuario">
		    	<div id="project" class="draggable">
					<span id="trash" class="ui-icon ui-icon-trash">${projetosDoUsuario.id}</span>
					<span id="play" class="ui-icon  ui-icon-play" project-id="${projetosDoUsuario.id}"></span> 
					<span id="wrench" class="ui-icon  ui-icon-wrench" project-id="${projetosDoUsuario.id}"></span> 					
					<span> ${projetosDoUsuario.nome}</span> 
		    	</div>
			</c:forEach>
			
			<div id="editProjectDiv" style="display: none">
				<form action="editProject">
					<input type="text" name="nome" >
					<input type="text" name="id">					
					<input type="submit" value="edit">
				</form>
			</div>
						
			<span id="create-project">Create a new project...</span>
	    </div>
	    <h3><a href="#">Add user to project</a></h3>
	    <div id="addUserToProject">
			<form action="associaEmProjeto">
				<input type="text" name="usuarioId" />		
				<input type="text" name="projetoId" />		
				<input type="submit" value="adicionar usuario em Projeto"/> 
			</form>
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
	
	
	<div class="droppable">
		<p>aaaaa</p>
	</div>
		
	</body>

</html>