<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<form action='<c:url value="addComment"/>' id="addComment" method="post">
		Comment <input type="text" id="conteudo" name="conteudo" size="48px" />
		<button onclick="adiconaComentario(); return false;">Add</button>
	</form>
	
<ul>
	<c:forEach items="${comentario}" var="comentario">
		<li> <strong>${usuarioLogado.login}</strong> : ${comentario.conteudo} </li>	
	</c:forEach>
</ul>