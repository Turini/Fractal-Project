

$('#show-element').click(function(){
	$('textarea[name=descricao]').show();
});


$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$('#novo-comentario').dialog({
		autoOpen: false,
		modal: true,
		height:685,
		width: 690
	});
	
});