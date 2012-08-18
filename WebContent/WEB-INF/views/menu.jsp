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
			<nav> 
				<a href="${pageContext.request.contextPath}/dashboard/${usuarioLogado.id}"> Dashboard </a>
				<a href="${pageContext.request.contextPath}/logout"> Logout </a>
			</nav>
		</header>
		
		
		<section id="activity">
			<span class="ui-icon ui-icon-carat-1-e"></span>
		</section>
		
		<section class="workspace"> 
		<c:forEach items="${estados}" var="status">
		<div class="sortable">
			<h3> ${status} </h3>
			<div class="divisor">
				<ul class='droptrue' id="${status}">
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
		</section>
		
	</div>

			
	<div id="detalhes-tarefa" title="Detalhes da tarefa selecionada"> </div>

	<div id="dialog-task">
		<form id="addTask" action='<c:url value="addTask"/>' method="get">
			<fieldset>
			
				<span>Trabalhar com prazo</span>
				<input type="checkbox" value="false"/>
			
				<label for="nome">Task Name
					<input type="text" name="nome" id="nome" maxlength="49" size="57px" /> 
				</label> 

				<input type="hidden" name="estado"/>

				<label for="descricao">Description
					<input type="text" name="descricao" maxlength="99" id="descricao" value="" size="76px" />
				</label> 
				
				
<!-- 				TODO: this fieldset need to be hidden, end only display when checked -->
				
				<fieldset>
					<label for="dataInicio">Starting date
						<homework:campoData name="dataInicio" id="dataInicio" />
					</label>
						
					<label for="dataTermino">Finish date
						<homework:campoData name="dataTermino" id="dataTermino" />
					</label>
				</fieldset>
					
				<label for="destinario">Addressed
					<input type="text" name="destinario" id="destinario" maxlength="29" value="" size="31px" />
				</label> 
				
				<input type="hidden" name="projeto_id" value="${currentProject.id}" />
				
			</fieldset>
		</form>
	</div>

</body>
</html>
