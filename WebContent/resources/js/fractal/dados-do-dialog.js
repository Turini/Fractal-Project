

$('#show-element').click(function(){
	$('textarea[name=descricao]').show();
});


$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$('#novo-comentario').dialog({
		autoOpen: false,
		modal: true,
		width: 690
	});
	
});

$('#comment-icon').click(function(){
	$('#novo-comentario').dialog('open');
});