 
 <script>
  $(function() {
    $("#radio").buttonset();
  });
 </script>
  

<header> 

	<span id="showUser">
		<a id="icon" class="ui-icon ui-icon-person"></a>
		${usuarioLogado.login} (${usuarioLogado.email}) 
	</span>
	
	<div id="radio">
		
		<input type="radio" name="radio"/>
				<a href="Menu">Home</a> 
		
		<input type="radio" name="radio"/>
			<a href="x">Brainstorm?</a> 
			
		<input type="radio" name="radio"/>
			<a href="telaUsuarios">Users</a> 
			
		<input type="radio" name="radio"/>
			<a href="${pageContext.request.contextPath}/logout">Logout</a>
			
	</div>

</header>
