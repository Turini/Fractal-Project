$('input[name=login]').live('change', function(){
	$("#user").hide();
	$("#password").show();
});

function submit(){
	$("efetuaLogin").submit();
}
