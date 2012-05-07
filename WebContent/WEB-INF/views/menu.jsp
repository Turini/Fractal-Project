<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<!-- TODO: I need change this jquery's externals resources to a local one, like this:  -->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="resources/css/jquery.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.js"></script>

<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<!-- TODO: Import all the js code from page to a new menu.js file... and delete which one is unused-->

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
	descricao = $( "#descricao" ), 
	estado = $( "#estado" ),
	destinario = $( "#destinario" ),
	dataInicio = $("#dataInicio"),
	dataTermino = $("#dataTermino"),
	prazo = $("#prazo"),
		allFields = $( [] ).add( nome ).add( descricao ).add( estado ).add( destinario ).add ( dataInicio ).add ( dataTermino ).add ( prazo );

	
$( "#dialog-task" ).dialog({
	autoOpen: false,
	height: 250,
	width: 820,
	modal: true,
	buttons: {
		"Create task": function() {
				$( "#adicionaTarefa" ).submit(); 						
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

	$( "#create-task" )
	.button()
	.click(function() {
		allFields.val( "" );
		$( "#dialog-task" ).dialog( "open" );
		$("#adicionaTarefa").find(":input").attr("disabled", false);
	});
});
  
$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$( "#detalhes-tarefa" ).dialog({
		autoOpen: false,
		height:285,
		width: 610,
		modal: true,
// 		buttons: {
// 			"Delete all items": function() {
// 				$( this ).dialog( "close" );
// 			},
// 			Cancel: function() {
// 				$( this ).dialog( "close" );
// 			}
// 		}
	});
});

function exibirTarefa(id) {
	$.get("mostraTarefa", {id: id}, function(resposta) {
		$("#detalhes-tarefa").html(resposta);
		$('#detalhes-tarefa').dialog('open');
// 		exibirComentarios(id);
	});
}

function exibirComentarios(id) {
	$.get("mostraComentarios", {id: id}, function(resposta) {
		$("#novo-comentario").html(resposta);
	});
}
	
function excluirTarefa(id) {
	$.post("removeTarefa", {id: id} , function (){
		$("#tarefa-"+id).hide();
		$('#detalhes-tarefa').dialog('close');
	});
}

function salvarEdicaoTarefa(id) {
	$( "#alteraTarefa" ).submit();
}

function habilitarEdicaoTarefa() {
	$("#alteraTarefa").find(":input").attr("disabled", false);
	$("#salvar").show();
}

function adiconaComentario() {
    $("#adicionaComentario").submit();	
}

	$(function() { 
		$( "ul.droptrue" ).sortable({ 
			connectWith: "ul" 
		}); 

		$( "ul.dropfalse" ).sortable({ 
			connectWith: "ul" 
// 			dropOnEmpty: false 
		}); 

		$( "#sortable1, #sortable2, #sortable3, #sortable4" ).disableSelection(); 
	}); 
	
// Mexer nessa função depois... entender e reverter o efeito

// 	$(function() {
// 		$( ".ui-state-default" ).droppable({
// 			drop: function( event, ui ) {
// 				$( this )
// 					.addClass( "ui-state-highlight" );
// 			}
// 		});
// 	});
	
</script>


<title>Fractal Task Project</title>

<!-- TODO: organize and delete all the unnecessary style inserted here  -->

<style type="text/css">
body {
	font-size: 100.0%;
	font: menu;
}
/*  		label, input { display:block; }  */
/*   		input.text { margin-bottom:12px; width:95%; padding: .4em; } */
fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}
/*  		div#users-contain { width: 350px; margin: 20px 0; }  */
/*  		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }  */
/*  		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; } */
/*  		.ui-dialog .ui-state-error { padding: .3em; } */
/*  		.validateTips { border: 1px solid transparent; padding: 0.3em; } */
#sortable1,#sortable2,#sortable3,#sortable4 {
	list-style-type: none;
	margin: 0;
	padding: 0;
	float: left;
	margin-right: 10px;
	background: grey;
	padding: 5px;
	width: 22%;
}

#sortable1 li,#sortable2 li,#sortable3 li,#sortable4 li {
	margin: 5px;
	padding: 15px;
	font-size: 100%;
	width: 89%;
	background: buttonface;
}

/* #sortable1, #sortable2, #sortable3, #sortable4 { list-style-type: none; float: left; margin-left: 0.8%; background: grey; padding: 0.2%;} */
/* #sortable1 li, #sortable2 li, #sortable3 li, #sortable4 li { margin: 1%; padding: 4%; font-size: 100%; width: 89%; background: buttonface; }  */
</style>

</head>

<body>
	<c:import url="cabecalho.jsp" />

	<div id="master" style="background-color: #E8E8E8; height: 980px">
		<br>

		<div id="menu-lateral" style="background-color: gray; float: left; height: 100%; width: 19%;" > <br />
		
		<button id="create-task" style="margin-left: 5%;">Create new task</button>
		
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
			</fieldset>
		</form>
	</div>

</body>
</html>
