<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>


 <script>
  $(document).ready(function() {
    $("#radio").buttonset();
  });
  
  function mensagemLogout() {
	  alert('Obrigado por usar nossa aplicação');
  }
 </script>
  
	<title>Insert title here</title>
	</head>


		<body style="font-size:70.5%;">

<div style="background-color: gray; height: 140px;"> <br>

	<div id="radio" style="text-align: right; margin-right: 1%;">
	<input type="radio" id="radio1" name="radio" /><label for="radio1"><a href="Menu">Menu</a> </label>
	<input type="radio" id="radio2" name="radio" /><label for="radio2"><a href="x">Brainstorm?</a> </label>
	<input type="radio" id="radio4" name="radio" /><label for="radio4"><a href="telaUsuarios">Usuarios</a> </label>
	<input type="radio" id="radio5" name="radio" /><label for="radio5"><a href="logout" onclick="mensagemLogout()"><span class="ui-icon ui-icon-power" style="float:left; margin:0 5px 4px 0;"></span> Logout</a></label>
	</div>

</div>

		
		</body>

</html>