$(function(){
	$('#newUser').hide();
});

$('#swap').bind('change', function(){
	$("#user").hide();
	$("#password").show();
});

function submit(){
	$("efetuaLogin").submit();
}

$('#sigup').bind('click', function(){
	$('#newUser').show('slide');
});