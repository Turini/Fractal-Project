<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul>
<c:forEach items="${comentario}" var="comentario">
	<li>
		<strong>${usuarioLogado.login}</strong> : ${comentario.conteudo}
	</li>	
</c:forEach>
</ul>