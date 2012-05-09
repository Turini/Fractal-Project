<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach items="${comentario}" var="comentario">
Comentario = ${comentario.conteudo}
</c:forEach>