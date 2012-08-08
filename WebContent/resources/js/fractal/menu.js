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

	$( ".create-task" )
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
	$.get("removeTarefa?id="+id)
		.success(function(){
			$('li[id='+id+']').hide();
			$('#detalhes-tarefa').dialog('close');
		});
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
			connectWith: "ul", 
 			dropOnEmpty: true 
 			
		}); 

		$( "ul.dropfalse" ).sortable({ 
			connectWith: "ul" 
// 			dropOnEmpty: false 
		}); 

//		$( ".sortable" ).disableSelection(); 
	}); 
	
// Mexer nessa funcao depois... entender e reverter o efeito

// 	$(function() {
// 		$( ".ui-sortable" ).droppable({
// 			drop: function( event, ui ) {
// 				var lis = $(this).find('li');
// 				console.log('lis -->'+lis);
// 				for (var aux=0; aux <= lis.length; aux++){
// 					console.log($(lis[aux]).attr('status'));
// 					if ($(lis[aux]).attr('class') != null) {
 						
// 						setTimeout(alteraEstado(this, $(this).attr('id')), 10000);
 						
// 						if ($(lis[aux]).attr('class').indexOf("placeholder") != -1){
// 							console.log($(this).find('li[status!=DONE]'));
 							
 							
// 							console.log('===>' + $($(this).find('li[status!=DONE][id!=x]')[0]).attr('id'));
// 							console.log('=> '+ $(lis[aux]).attr('id'));
// 							var status = $(this).attr('id');
// 							var taskId = $(this).find('li[status!='+status+'][id!=x]').attr('id');
// 							$.get('alteraEstado',{taskId: taskId , status: status});
// 							console.log('agora sim seu fdp !!!'+ $(lis[aux]).attr('class'));
// 						}
// 					}
 					
// 				}
// 				$( this ).addClass( "ui-state-highlight" );
// 			}
// 		});
// 		$('.lis-tasks').draggable(
// 			function() {
// 				console.log(this);
// 			}
// 		);
// 	});
 	
// 	function alteraEstado(ul, id){
// 		console.log($(ul).find('li'));
// 		console.log('id: '+id);
// 		console.log($('ul[id='+id+']').find('li'));
// 	}
	
	$('.lis-tasks').live('click', function(){
		var id = $(this).attr('id');
		$.get("mostraTarefa", {id: id}, function(resposta) {
			$("#detalhes-tarefa").html(resposta);
			$('#detalhes-tarefa').dialog('open');
			$(".ui-dialog-titlebar").hide();
//			TODO: here
//		    $(".ui-dialog").addClass("customclass");
			exibirComentarios(id);
		});
	});

	
//(function(){
//	
//	var uls = $('ul');
//	
//		for (var u = 0; u <= uls.length; u++) {
//			if ($($('ul')[u]).find('li').size() == 0) {
//				$($('ul')[u])
//			}
//					
//					console.log($('ul')[u]);
////			$('ul li#x').size() == 0
//		}
//		
//});
