 
 <script>
  $(document).ready(function() {
    $("#radio").buttonset();
  });
  
  function mensagemLogout() {
	  alert('Obrigado por usar nossa aplicação');
  }
 </script>
  

<div id="header"> <br>

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
