<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<!-- TODO: I need change this jquery's externals resources to a local one, like this:  -->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" href="<c:url value="/resources/css/jquery.css"/>" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui.js"/>"></script>

<!-- TODO: Import all the js code from page to a new menu.js file... and delete which one is unused-->

<script type="text/javascript" src='<c:url value="/resources/js/fractal/menu.js"></c:url>'></script>

<script type="text/javascript">

$(document).ready(function() {
    $("button").button();
  });
  
  $(document).ready(function() {
    $("#dialog").dialog();
  });
	
</script>


<title>Fractal Task Project</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/menu.css"/>" type="text/css" />  

</head>

<body>
	<c:import url="cabecalho.jsp" />

	<div id="master" style="background-color: #E8E8E8; height: 980px">
		<br>

		<div id="menu-lateral" style="background-color: gray; float: left; height: 100%; width: 19%;" > <br />
		
		<button id="create-task">Create new task</button>
		
		</div>
		
		<div id="project-div" style="background-color: gray; float: right; height: 100%; width:80%;">
		
		<div class="sortables-console"
			style="margin-top: 3%; margin-left: 1%; height: 85%; width:97%; background-color: #B5B5B5; float: right;">
			<br />

			<ul id="sortable1" class='droptrue' style="margin-left: 9px">

				<!-- TODO: I can define the style characteristics into the style block? It's probably necessary to make it better  -->
				<li class="ui-state-default"
					style="text-align: center; background-color: transparent;"><b
					style="font-size: large;">To do</b></li>

				<c:forEach items="${tarefas}" var="tarefa">
<%-- 				<c:forEach items="${comentarios }" var="comentario"> --%>
					<c:if test="${tarefa.estado eq 'Designada'}">
						<li id="tarefa-${tarefa.id}" class="ui-state-default"
							style="text-align: left;" onclick="exibirTarefa(${tarefa.id})">${tarefa.nome}</li>
					</c:if>
<%-- 				</c:forEach> --%>
				</c:forEach>
			</ul>

			<ul id="sortable2" class='droptrue'>

				<li class="ui-state-default"
					style="text-align: center; background-color: transparent;"><b
					style="font-size: large;">Doing</b></li>

				<c:forEach items="${tarefas}" var="tarefa">
					<c:if test="${tarefa.estado eq 'Tratativa'}">
						<li id="tarefa-${tarefa.id}" class="ui-state-default"
							style="text-align: left;" onclick="exibirTarefa(${tarefa.id})">${tarefa.nome}</li>
					</c:if>
				</c:forEach>
			</ul>

			<ul id="sortable3" class='droptrue'>

				<li class="ui-state-default"
					style="text-align: center; background-color: transparent;"><b
					style="font-size: large;">Ice box</b></li>

				<c:forEach items="${tarefas}" var="tarefa">
					<c:if test="${tarefa.estado eq 'Congelada'}">
						<li id="tarefa-${tarefa.id}" class="ui-state-default"
							style="text-align: left;" onclick="exibirTarefa(${tarefa.id})">${tarefa.nome}</li>
					</c:if>
				</c:forEach>
			</ul>

			<ul id="sortable4" class='droptrue'>

				<li class="ui-state-default"
					style="text-align: center; background-color: transparent;"><b
					style="font-size: large;">Done</b></li>

				<c:forEach items="${tarefas}" var="tarefa">
					<c:if test="${tarefa.estado eq 'Finalizada'}">
						<li id="tarefa-${tarefa.id}" class="ui-state-default"
							style="text-align: left;" onclick="exibirTarefa(${tarefa.id})">${tarefa.nome}</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		</div>

		<div id="detalhes-tarefa" title="Detalhes da tarefa selecionada">
		</div>

		<%-- <c:import url="rodape.jsp"></c:import> --%>
		<!--TODO: delete or fix the "rodape" form  -->
		
	</div>

	<div id="dialog-task" title="Create new task">
		<form id="adicionaTarefa" action="adicionaTarefa" method="get">
			<fieldset>
				<label for="nome">Task Name</label> <input type="text" name="nome"
					id="nome" maxlength="49"
					class="text ui-widget-content ui-corner-all" size="57px" /> <label
					for="estado">State</label> <select name="estado"
					class="text ui-widget-content ui-corner-all">
					<option value="Designada" selected="selected">Designada</option>
					<option value="Tratativa">Tratativa</option>
					<option value="Congelada">Congelada</option>
					<option value="Finalizada">Finalizada</option>
				</select>
				<hr>
				<label for="descricao">Description</label> <input type="text"
					name="descricao" maxlength="99" id="descricao" value=""
					class="text ui-widget-content ui-corner-all" size="76px" /> <br />
				<hr>
				<label for="dataInicio">Starting date</label>
				<homework:campoData name="dataInicio" id="dataInicio" />
				<label for="dataTermino">Finish date</label>
				<homework:campoData name="dataTermino" id="dataTermino" />
				<label for="destinario">Addressed</label> <input type="text"
					name="destinario" id="destinario" maxlength="29" value=""
					class="text ui-widget-content ui-corner-all" size="31px" /> <br />
				
				<input type="hidden" name="projeto_id" value="${projetoId}"/>
				
				
			</fieldset>
		</form>
	</div>

</body>
</html>
