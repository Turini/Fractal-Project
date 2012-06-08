<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:useBean id="agora" class="java.util.Date"/>

<br />

<form action="alteraTarefa" id="alteraTarefa" method="post">
	<input type="hidden" name="id" value="${tarefa.id}" /> <label
		for="nome">Task Name</label> <input type="text" name="nome"
		maxlength="49" class="text ui-widget-content ui-corner-all"
		disabled="disabled" size="53px" value="${tarefa.nome}" />
	<hr noshade>

	<label for="descricao">Description</label> <input type="text"
		name="descricao" maxlength="99"
		class="text ui-widget-content ui-corner-all" disabled="disabled"
		size="53px" value="${tarefa.descricao}" /> <br />
	<hr noshade>

	<label for="dataInicio">Created</label>
	<homework:campoData name="dataInicio" id="dataInicio"
		value="${tarefa.dataInicio}" />

	<label for="dataTermino">Expected Finish</label>
	<homework:campoData name="dataTermino" id="dataTermino"
		value="${tarefa.dataTermino}" />

	<label for="estado">Status</label> <select name="estado"
		class="text ui-widget-content ui-corner-all">
		<option value="${tarefa.estado}" selected="selected">${tarefa.estado}</option>
		<option value="Designada">Designada</option>
		<option value="Tratativa">Tratativa</option>
		<option value="Congelada">Congelada</option>
		<option value="Finalizada">Finalizada</option>
	</select>
	<br/>
	<label for="projeto_id">Projeto ID</label>
	<input type="text" name="projeto_id" class="text ui-widget-content ui-corner-all"/>
				
</form>
<hr noshade>

<form action="adicionaComentario" id="adicionaComentario" method="post">
Comment
<input type="text" id="conteudo" name="conteudo" class="text ui-widget-content ui-corner-all" size="48px" />

<%-- <input type="hidden" id="tarefas" name="tarefas" value="${tarefa.id}"/> --%>

<button onclick="adiconaComentario(${tarefa.id}); return false;">Add</button>
</form>
<br />
<br />

<div id="novo-comentario"> </div>

<br />
<hr noshade>

<button onclick="excluirTarefa(${tarefa.id})">
	<span class="ui-icon ui-icon-trash"
		style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button>
<button onclick="habilitarEdicaoTarefa()">
	<span class="ui-icon ui-icon-wrench"
		style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button>
<button id="salvar" hidden="true" onclick="salvarEdicaoTarefa(${tarefa.id})">
	<span class="ui-icon ui-icon-disk"
		style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button>
<br>