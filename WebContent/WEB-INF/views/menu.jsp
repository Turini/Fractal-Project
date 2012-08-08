<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>

<html>

	<head> <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" href="<c:url value="/resources/css/jquery.css"/>" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.js"/>"></script>

	<script type="text/javascript" src='<c:url value="/resources/js/fractal/menu.js"></c:url>'> </script>
	<script type="text/javascript"> $(function() { $("button").button(); $("#dialog").dialog(); });</script>
	
<!-- 	TODO: exclude this imports... but let it working. -->
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	
	<title>Fractal | ${currentProject.nome}</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/menu.css"/>" type="text/css" /> </head>

<body> 


	<div id="project-div">
	<header>
		<h3>${currentProject.nome}</h3>
	</header>
	
		
		<section>
			<span class="ui-icon  ui-icon-carat-1-e"></span>
		</section>
		
		<c:forEach items="${estados}" var="status">
		<div class="sortable">
			<h3> ${status} </h3>
			<div class="divisor">
				<ul class='droptrue' id="${status}">
					<li id="x" status="${status}"></li>
					<c:forEach items="${tarefas}" var="task">
						<c:if test="${task.estado eq status}">
							<li class="lis-tasks" id="${task.id}" status="${status}"><span>${task.nome}</span></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="create-task">
				<a>Create a new task</a>
			</div>
		</div>
		</c:forEach>
		
	</div>

			
	<div id="detalhes-tarefa" title="Detalhes da tarefa selecionada"> </div>

	<div id="dialog-task">
		<form id="adicionaTarefa" action="adicionaTarefa" method="get">
			<fieldset>
				<label for="nome">Task Name</label> 
					<input type="text" name="nome" id="nome" maxlength="49" class="text ui-widget-content ui-corner-all" size="57px" /> 
					
				<label for="estado">Status</label> 
					<select name="estado" class="text ui-widget-content ui-corner-all">
						<c:forEach items="${estados}" var="status">
							<option value="${status}">${status}</option>
						</c:forEach>
					</select>
				<hr>
				
				<label for="descricao">Description</label> 
					<input type="text" name="descricao" maxlength="99" id="descricao" value="" class="text ui-widget-content ui-corner-all" size="76px" /> <br />
				<hr>
				
				<label for="dataInicio">Starting date</label>
					<homework:campoData name="dataInicio" id="dataInicio" />
					
				<label for="dataTermino">Finish date</label>
					<homework:campoData name="dataTermino" id="dataTermino" />
					
				<label for="destinario">Addressed</label> 
					<input type="text" name="destinario" id="destinario" maxlength="29" value="" class="text ui-widget-content ui-corner-all" size="31px" /> <br />
				
				<input type="hidden" name="projeto_id" value="${currentProject.id}"/>
				
			</fieldset>
		</form>
	</div>

</body>
</html>
