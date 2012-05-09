<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	
<!-- 	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/> -->
<!--   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script> -->
<!--   	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> -->
	
	<title>Administraçao de Usuarios</title> </head>
	
 	<style> 
 		body { font-size: 62.5%; }
/*  		label, input { display:block; }  */
  		input.text { margin-bottom:12px; width:95%; padding: .4em; }
 		fieldset { padding:0; border:0; margin-top:25px; } 
 		h1 { font-size: 1.2em; margin: .6em 0; } 
 		div#users-contain { width: 350px; margin: 20px 0; } 
 		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; } 
 		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
 		.ui-dialog .ui-state-error { padding: .3em; }
 		.validateTips { border: 1px solid transparent; padding: 0.3em; }
 	</style>

	<body>

	<c:import url="../cabecalho.jsp"></c:import>

	<script>
 	$(function() {
 		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
		var login = $( "#login" ),
 			email = $( "#email" ), 
			senha = $( "#senha" ),
			tipo = $( "#tipo" ),
			telefone = $("#telefone"),
 			allFields = $( [] ).add( login ).add( email ).add( senha ).add( tipo ).add ( telefone ),
			tips = $( ".validateTips" );

		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

		function checkLength( o, n, min, max ) {
			if ( o.val().length > max || o.val().length < min ) {
				o.addClass( "ui-state-error" );
				updateTips( "Length of " + n + " must be between " +
					min + " and " + max + "." );
				return false;
			} else {
				return true;
			}
		}

		function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
		}
		
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 500,
			width: 350,
			modal: true,
			buttons: {
				"Criar usuario": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					bValid = bValid && checkLength( login, "login", 3, 16 );
 					bValid = bValid && checkLength( email, "email", 6, 80 );
					bValid = bValid && checkLength( senha, "senha", 5, 16 );

					bValid = bValid && checkRegexp( login, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
					bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
					bValid = bValid && checkRegexp( senha, /^([0-9a-zA-Z])+$/, "senha field only allow : a-z 0-9" );

					if ( bValid ) {
// 						$( "#users tbody" ).append( "<tr>" +
// 							"<td>" + login.val() + "</td>" + 
//  							"<td>" + email.val() + "</td>" + 
// 							"<td>" + senha.val() + "</td>" +
// 							"<td>" +  tipo.val() + "</td>" +
// 							"<td>" +  telefone.val() + "</td>" +							
// 						"</tr>" ); 
						$( "#adicionaUsuario" ).submit(); 						
						$( this ).dialog( "close" );
					}
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});

		$( "#create-user" )
			.button()
			.click(function() {
				$( "#dialog-form" ).dialog( "open" );
			});
	});
	</script>



<div class="demo">

<div id="dialog-form" title="Create new user">
	<p class="validateTips">All form fields are required.</p>

	<form id="adicionaUsuario" action="adicionaUsuario" method="get">
	<fieldset>
		<label for="login">Name</label>
		<input type="text" name="login" id="login" class="text ui-widget-content ui-corner-all" />
		<label for="email">Email</label>
		<input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" />
		<label for="senha">Senha</label>
		<input type="password" name="senha" id="senha" value="" class="text ui-widget-content ui-corner-all" />
		<label for="tipo">Tipo</label>
		<input type="text" name="tipo" id="tipo" value="" class="text ui-widget-content ui-corner-all"/>
		<label for="telefone">Telefone</label>
		<input type="text" name="telefone" id="telefone" value="" class="text ui-widget-content ui-corner-all"/>
	</fieldset>
	</form>
</div>


<div id="users-contain" class="ui-widget">
	<h1>Existing Users:</h1>
	<table id="users" class="ui-widget ui-widget-content">
		<thead>
			<tr class="ui-widget-header ">
				<th>Id</th>
				<th>Login</th>
				<th>Email</th>
				<th>Senha</th>
				<th>Tipo</th>
				<th>Telefone</th>				
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${usuarios}" var="usuarios">
		
			<tr>
				<td>${usuarios.id}</td>
				<td>${usuarios.login}</td>
				<td>${usuarios.email}</td>
				<td>${usuarios.senha}</td>
				<td>${usuarios.tipo} </td>
				<td>${usuarios.telefone} </td>
				<td><a href="removeUsuario?id=${usuarios.id}">x</a></td>
			</tr>

		</c:forEach>
		</tbody>
		
	</table>
</div>
<button id="create-user">Create new user</button>

</div>
<!-- End demo -->

	</body>

</html>