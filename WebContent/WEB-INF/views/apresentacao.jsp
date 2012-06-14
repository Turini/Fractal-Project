<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>

<html>

	<head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" href="resources/css/jquery.css" rel="stylesheet">
		<script type="text/javascript" src="resources/js/jquery.js"></script>
		<script type="text/javascript" src="resources/js/jquery-ui.js"></script>
		
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
		
	<title>Fractal Tasks (it can work)</title> 
	
		<link rel="stylesheet" href="/FractalProjec/resources/css/fractal/apresentacao.css" type="text/css" />  
		
	<script type="text/javascript">
	
	$(document).ready(function() {
	    $("button").button();
	  });

	$(document).ready(function() {
	  $("#dialog").dialog();
	});
		
		$(function() {
			$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
			var nome = $( "#nome" ),
			criador = $( "#criador" ), 
			dataCriacao = $("#dataCriacao"),
			allFields = $( [] ).add( nome ).add( criador ).add( dataCriacao );

		$( "#dialog-project" ).dialog({
			autoOpen: false,
			height: 250,
			width: 820,
			modal: true,
			buttons: {
				"Create Project": function() {
						$( "#addProject" ).submit();
						$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
			},
			Clear: function() {
				allFields.val( "" );
			}
		  }
		});
		
			$( "#create-project" ).click(function() {
				allFields.val( "" );
				$( "#dialog-project" ).dialog( "open" );
				$("#addProject").find(":input").attr("disabled", false);
			});
		});
		
		
	$("#trash").live('click', function(){
		var id = $(this).text();
			$.get("deleteProject", {id:id})
				.success(function(){
					$("#trash").closest("div").hide();
				}).error(function(){
					alert("some error message");
			});
	});
		
		
</script>

	</head>

<body>

<br/> Voce esta logado como ${usuarioLogado.login}, <a href="logout">logout</a>.

<br/> //TODO: incluir aqui as mensagens... e um grafico? do que?.


<br/><br/><br/>

<br/>

<div id="projectContainer">

	<div id="projectBox">
		<!-- Insert a if clause to verify if exist some project   -->
		<!-- If don't, just show the message: Create a new one =) -->
		<h3>These are your current projects:</h3>
		
		<c:forEach items="${projetos}" var="projeto">
			<div id="projects"> 
			${projeto.nome} - created by: ${projeto.criador} on: ${projeto.dataCriacao} 
			
			<a href="Menu?id=${projeto.id}">></a>

			<span class="ui-icon  ui-icon-play"></span>			
			
			<span id="trash" class="ui-icon ui-icon-trash">${projeto.id}</span>
			</div>
			
		</c:forEach>
		
		<span id="create-project">Add a new one...</span>
		
	</div>	
	
 	<div id="projectBox">
		<!-- Insert if clause to verify if usuarioLogado == Owner -->
		<!-- If don't, show the projects that he join -->
		<h3>These are the current projects that you join?:</h3>
	
	</div>
	
</div>

	
	<div id="dialog-project">
		
		<form action="addProject" id="addProject">
		
			<label for="nome">Project Name</label> 
			<input type="text" name="nome" id="nome" maxlength="20" 
			class="text ui-widget-content ui-corner-all"/>
		
			<label for="criador">Project Owner</label> 
			<input type="text" name="criador" id="criador" maxlength="20" 
			class="text ui-widget-content ui-corner-all"/>
		
			<label for="dataInicio">Starting date</label>
			<homework:campoData name="dataInicio" id="dataInicio" />

		</form>
		
	</div>
	
</body>

</html>