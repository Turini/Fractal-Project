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
/*  		div#users-contain { width: 350px; margin: 20px 0; }  */
/*  		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }  */
/*  		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; } */
/*  		.ui-dialog .ui-state-error { padding: .3em; } */
/*  		.validateTips { border: 1px solid transparent; padding: 0.3em; } */
 	</style>

</head>

<body style="background-color: #E8E8E8;">

<img alt="img" src="/FractalProjec/resources/img/imagemFractal.png">

	<div class="panel" align="center" style="background-color: gray; height: 200px; 
			 width: 1000px; margin-left: auto; margin-right: auto; margin-top: 200px; border-color: white; border-width: 1cm;">

	<div id="pageContent">

      <h1 style="margin-left: 2%; font-size:200%;  color: #363636;" align="left" id="header">Fractal Tasks Project</h1>

		<form action="efetuaLogin" method="post" style="margin-top: 5%;">
            <label for="login">User:</label>  
            <input type="text" name="login" class="text ui-widget-content ui-corner-all" />
            <label for="senha">Password:</label> 
            <input type="password" name="senha" class="text ui-widget-content ui-corner-all" />

			<button type="submit">Login </button>
		</form>

      <div style="margin-right: 2%; margin-top: 6%;" align="right"><span class="versionTag">Version 0.1</span></div>



		</div>
	</div>

<%-- 	<c:import url="rodape.jsp" />	 Precisa excluir ou redimensionar essa pagina--%>

</body>

</html>