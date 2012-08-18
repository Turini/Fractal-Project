<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="agora" class="java.util.Date"/> <br/>

<div>
	<form action="changeTask" id="changeTask" method="post">
		
		<input type="hidden" name="id" value="${tarefa.id}"/> 
			<span>Task Name</span>		
			<input type="text" name="nome" maxlength="49" disabled="disabled" value="${tarefa.nome}"/>
			<span>Description</span> (there is no description defined, you can add one now.)			
			<textarea name="descricao" rows="2" cols="52" disabled="disabled">${tarefa.descricao}</textarea>
			<span>Created</span>
			<homework:campoData name="dataInicio" id="dataInicio" value="${tarefa.dataInicio}"/>
			<span>Expected Finish</span>	
			<homework:campoData name="dataTermino" id="dataTermino" value="${tarefa.dataTermino}"/>
			<input type="hidden" name="estado" value="${tarefa.estado}"/>
		<input type="hidden" name="projeto_id" value="${projeto}"/>
					
	</form> 
	
	<hr noshade>
	
	<form action='<c:url value="addComment"/>' id="addComment" method="post">
		Comment <input type="text" id="conteudo" name="conteudo" size="48px" />
		<button onclick="adiconaComentario(${tarefa.id}); return false;">Add</button>
	</form>
</div>

<div id="novo-comentario"> </div> 
<hr noshade>

<button onclick="excluirTarefa(${tarefa.id})">
	<span class="ui-icon ui-icon-trash" style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button>
<button onclick="habilitarEdicaoTarefa()">
	<span class="ui-icon ui-icon-wrench" style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button>
<button id="salvar" hidden="true" onclick="salvarEdicaoTarefa(${tarefa.id})">
	<span class="ui-icon ui-icon-disk" style="float: right; margin: 0 1px 6px 0; text-align: right;"></span>
</button> <br/>
