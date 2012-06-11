<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="cs">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="David Kohout & Tom&Atilde;&iexcl;&Aring;&iexcl; Lach - www.tomaslach.cz">
<link rel="shortcut icon" href="/favicon.ico">
<link rel="stylesheet" href="css/main.css" media="screen,projection">

<title>Login</title>
<!-- this name can be much better... -->

<style type="text/css"> 
 		body { font-size: 100.0%; font: menu; }
/*  		label, input { display:block; }  */
/*   		input.text { margin-bottom:12px; width:95%; padding: .4em; } */
 		fieldset { padding:0; border:0; margin-top:25px; } 
 		h1 { font-size: 1.2em; margin: .6em 0; } 
/*  		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }  */
 	
 	#img {
 		width: 75%;
 	}
 	
 	#pageContent{
	 	background-color: darkGray;
		height: 95px;
		width: 265px;
		margin-top: 5%;
		float: right;
 	}
 	
 	#password{
 		display: none;
 	}
 	
 	input{
	 	padding: 6%;
		border-radius: 10px;
 	}
 	
 	label{
 		display: table-caption;
		margin-left: 5%;
 	}
 	
</style>

</head>

<body>

<img id="img" alt="img" src="/FractalProjec/resources/img/imagemFractal.png">

	<div id="pageContent" style="border-radius: 7%">


<script type="text/javascript">

	
	
	function changeInput(){
		$("#user").hide();
		$("#password").show();
	}
	
</script>

		<form action="efetuaLogin" method="post" style="margin-top: 5%;">
		
            <label id="user" for="login">User:  
            <input type="text" name="login" onchange="changeInput()" class="text ui-widget-content ui-corner-all" />
			</label>

            <label id="password" for="senha">Password: 
            <input type="password" name="senha" class="text ui-widget-content ui-corner-all"/>
			</label>
			
			<button type="submit" style="display: none">></button>
			
		</form>

<span style="float: right; margin-right: 5%; margin-top: 2%;">Can't access your account?</span>
		</div>

      <div style="margin-right: 2%; margin-top: 6%;" align="right"><span class="versionTag">Version 0.1</span></div>
<%-- 	<c:import url="rodape.jsp" />	 Precisa excluir ou redimensionar essa pagina--%>

</body>

</html>