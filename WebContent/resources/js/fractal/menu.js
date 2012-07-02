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

function exibirComentarios(id) {
	$.get("mostraComentariosDaTarefa", {id: id}, function(resposta) {
		$("#novo-comentario").html(resposta);
	});
}
	
function excluirTarefa(id) {
	$.get("removeTarefa?id="+id);
// 	$.post("removeTarefa", {id: id} , function (){
		$(id).hide();
		$('#detalhes-tarefa').dialog('close');
// 	});
}

function salvarEdicaoTarefa(id) {
	$( "#alteraTarefa" ).submit();
	$.get("removeTarefa?id="+id);
}

function habilitarEdicaoTarefa() {
	$("#alteraTarefa").find(":input").attr("disabled", false);
	$("#salvar").show();
}

function adiconaComentario(id) {
	var conteudo = $("#conteudo").val();
	$.post("adicionaComentario", {id:id, conteudo:conteudo});
	
//     $("#adicionaComentario").submit();	
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
	
// Mexer nessa funÃ§Ã£o depois... entender e reverter o efeito

// 	$(function() {
// 		$( ".ui-state-default" ).droppable({
// 			drop: function( event, ui ) {
// 				$( this )
// 					.addClass( "ui-state-highlight" );
// 			}
// 		});
// 	});
	
	$('.lis-tasks').live('click', function(){
		var id = $(this).attr('id');
		$.get("mostraTarefa", {id: id}, function(resposta) {
			$("#detalhes-tarefa").html(resposta);
			$('#detalhes-tarefa').dialog('open');
			exibirComentarios(id);
		});
	});
