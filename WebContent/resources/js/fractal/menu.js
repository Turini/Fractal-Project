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

	$('#show-dates').click(function(){
		if( $('#show-dates input').attr('checked') ) $('#fieldset-dates').show();
		else $('#fieldset-dates').hide();
	});
	
	
$( "#dialog-task" ).dialog({
	autoOpen: false,
	width: 660,
	modal: true,
	buttons: {
		"Create task": function() {
			$( "#addTask" ).submit();
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

	$( ".create-task" ).click(function() {
		allFields.val('');
		$('#dialog-task').dialog('open');
		var status = $(this).parent().find('ul').attr('id');
		$('#addTask input[name=estado]').val(status);
		$("#addTask").find(":input").attr("disabled", false);
	});
});
  
$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$( "#detalhes-tarefa" ).dialog({
		autoOpen: false,
		width: 650,
		modal: true,
	});
});

function exibirComentarios(id) {
	$.get("showComments", {id: id}, function(resposta) {
		$("#novo-comentario").html(resposta);
	});
}
	
function excluirTarefa(id) {
	$.get("removeTask", {id : id})
		.success(function(){
			$('li[id='+id+']').hide();
			$('#detalhes-tarefa').dialog('close');
		});
	}

function salvarEdicaoTarefa(id) {
	$( "#changeTask" ).submit();
	var status = $(this).parent().find('ul').attr('id');
	$('#changeTask input[name=estado]').val(status);
	$.get("removeTask", {id : id});
}

function habilitarEdicaoTarefa() {
	$("#changeTask").find(":input").attr("disabled", false);
	$("#salvar").show();
}

function adiconaComentario() {
	var conteudo = $("#conteudo").val();
	var id = $('input[name=id]').val();
	$.post("addComment", {id:id, conteudo:conteudo})
		.success(function(){
			var content = $("#novo-comentario ul").html();
			$("#novo-comentario ul").html(content + '<li>'+conteudo+'</li>');
			$("#conteudo").val('');
		}).error(function(){
			alert('Sorry, but something wrong just happend');
		});
}

	$(function() { 
		$( "ul.droptrue" ).sortable({ 
			connectWith: "ul", 
 			dropOnEmpty: true
		}); 

		// TODO: ever change, need be requested !!!
		
		$("ul.droptrue").droppable({
			drop: function (event, ui) {
				status = $(this).attr('id');
				taskId = $(ui.draggable).attr('id');
				if ($(ui.draggable).attr('status') != status){
					console.log('changing status ...');
					$.get('changeStatus', {status : status , taskId : taskId});
				}
			}
		});

		$( ".sortable" ).disableSelection(); 
	}); 
	
	$('.lis-tasks').live('click', function(){
		var id = $(this).attr('id');
		$.get("showTask", {id: id}, function(resposta) {
			$("#detalhes-tarefa").html(resposta);
			$('#detalhes-tarefa').dialog('open');
//		    $(".ui-dialog").addClass("customclass");
			exibirComentarios(id);
		});
	});
