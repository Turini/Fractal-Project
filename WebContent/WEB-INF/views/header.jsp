 
 <script>
  $(document).ready(function() {
    $("#radio").buttonset();
  });
  
  function mensagemLogout() {
	  alert('Obrigado por usar nossa aplica��o');
  }
 </script>
  

<div id="header"> 

<span id="showUser">
			<a id="icon" class="ui-icon ui-icon-person"></a>
			${usuarioLogado.login} (${usuarioLogado.email}) 
</span>

<br>

	<div id="radio">
		
		<input type="radio" name="radio"/>
				<a href="Menu">Home</a> 
		
		<input type="radio" name="radio"/>
			<a href="x">Brainstorm?</a> 
			
		<input type="radio" name="radio"/>
			<a href="telaUsuarios">Users</a> 
			
		<input type="radio" name="radio"/>
			<a href="logout" onclick="mensagemLogout()">Logout</a>
			
	</div>

</div>
