$(function(){
	$('#newUser').hide();
});

$('input[name=login]').bind('change', function(){
	$("#user").hide();
	$("#password").show();
});

function submit(){
	$("efetuaLogin").submit();
}

$('#sigup').bind('click', function(){
	$('#newUser').show('explode');
});