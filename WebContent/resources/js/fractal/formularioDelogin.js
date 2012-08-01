$(function(){
	$('#newUser').hide();
});

$($("input[name=login]")[0]).bind('change', function(){
	$($("label[for=login]")[0]).hide();
	$($("label[for=senha]")[0]).show();
});

$('#sigup').bind('click', function(){
	$('#newUser').show('slide');
});

$("#efetuaLogin").submit(function(){
	var passwordField = $($("input[type=password]")[0]);
	if (passwordField.val().trim() == '') return false;
	else $("efetuaLogin").submit();
});