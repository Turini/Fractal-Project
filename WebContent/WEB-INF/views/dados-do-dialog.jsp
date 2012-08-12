<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="agora" class="java.util.Date"/> <br/>

<form action="changeTask" id="changeTask" method="post">
	
	<input type="checkbox" />

	<input type="hidden" name="id" value="${tarefa.id}"/> 
	
	<label for="nome">Task Name</label> 
		<input type="text" name="nome" maxlength="49" class="text ui-widget-content ui-corner-all" disabled="disabled" size="45px" value="${tarefa.nome}"/>
	<hr noshade>

	<label for="descricao">Description</label> 
<%-- 		<textarea type="text" name="descricao" maxlength="99" class="text ui-widget-content ui-corner-all" disabled="disabled" size="45px" value="${tarefa.descricao}"/> <br /> --%>
		<textarea rows="2" cols="52" class="text ui-widget-content ui-corner-all"></textarea>
		
	<hr noshade>

	<label for="dataInicio">Created</label>
		<homework:campoData name="dataInicio" id="dataInicio" value="${tarefa.dataInicio}"/>

	<label for="dataTermino">Expected Finish</label>
		<homework:campoData name="dataTermino" id="dataTermino" value="${tarefa.dataTermino}"/>

	<label for="estado">Status</label> 
		<select name="estado" class="text ui-widget-content ui-corner-all">
			<c:forEach items="${estados}" var="status">
				<option value="${status}">${status}</option>
			</c:forEach>
		</select>
	
	<br/> <input type="hidden" name="projeto_id" value="${projeto}"/>
				
</form> <hr noshade>

<form action='<c:url value="addComment"/>' id="addComment" method="post">
	Comment <input type="text" id="conteudo" name="conteudo" class="text ui-widget-content ui-corner-all" size="48px" />
	<button onclick="adiconaComentario(${tarefa.id}); return false;">Add</button>
</form>

<br/><br/> <div id="novo-comentario"> </div> <br/> <hr noshade>

<button onclick="excluirTarefa(${tarefa.id})">
	<span class="ui-icon ui-icon-trash" style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button>
<button onclick="habilitarEdicaoTarefa()">
	<span class="ui-icon ui-icon-wrench" style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button>
<button id="salvar" hidden="true" onclick="salvarEdicaoTarefa(${tarefa.id})">
	<span class="ui-icon ui-icon-disk" style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button> <br/>
