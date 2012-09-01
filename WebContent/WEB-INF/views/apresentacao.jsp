<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="homework"%>

  
<html>

	<head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" href="<c:url value="/resources/css/jquery.css"/>" rel="stylesheet">
	<link type="text/css" href="<c:url value="/resources/css/jquery-ui-1.8.21.custom.css"/>" rel="stylesheet">	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	
	<script>
	$(function() {
		$( "#accordion" ).accordion();
		
		var data = new google.visualization.DataTable();
		
		  data.addColumn('string', 'Status');
		  data.addColumn('number', 'Tasks');
		  data.addRows(document.getElementsByClassName('allProjectsInfo').length);
		  
		  if (document.getElementsByClassName('allProjectsInfo')[0]){		  
		  data.setValue(0, 0, document.getElementsByClassName('allProjectsInfo')[0].id.split('_')[0]);					
		  data.setValue(0, 1, parseInt(document.getElementsByClassName('allProjectsInfo')[0].value));
		  }
		  
		  if (document.getElementsByClassName('allProjectsInfo')[1]){		  
		  data.setValue(1, 0, document.getElementsByClassName('allProjectsInfo')[1].id.split('_')[0]);					
		  data.setValue(1, 1, parseInt(document.getElementsByClassName('allProjectsInfo')[1].value));
		  }
		  if (document.getElementsByClassName('allProjectsInfo')[2]){		  		  
		  	data.setValue(2, 0, document.getElementsByClassName('allProjectsInfo')[2].id.split('_')[0]);					
		  	data.setValue(2, 1, parseInt(document.getElementsByClassName('allProjectsInfo')[2].value));
		  }
		  if (document.getElementsByClassName('allProjectsInfo')[3]){		  
		  	data.setValue(3, 0, document.getElementsByClassName('allProjectsInfo')[3].id.split('_')[0]);					
		  	data.setValue(3, 1, parseInt(document.getElementsByClassName('allProjectsInfo')[3].value));
		  }
		  if (document.getElementsByClassName('allProjectsInfo')[4]){
			  data.setValue(4, 0, document.getElementsByClassName('allProjectsInfo')[4].id.split('_')[0]);					
			  data.setValue(4, 1, parseInt(document.getElementsByClassName('allProjectsInfo')[4].value));
		  }
		  
		  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
		  
		  chart.draw(data, {width: 600, height: 340, title: 'Count of tasks by status of all projects', titleTextStyle: {color: '#504F4F'}, colors: ['#504F4F']});
		
	});
	
	</script>
	
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	
	<title>Fractal Tasks</title> 
	
	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/header.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/fractal/apresentacao.css"/>" type="text/css" />	
	<script type="text/javascript" src="<c:url value="/resources/js/fractal/apresentacao.js"/>"> </script>
	<script type="text/javascript"> $(function() { $("button").button(); $("#dialog").dialog();}); </script> </head>

	<body>
	<input type="hidden" id="blabla" value="20"/>
	<c:import url="header.jsp"/>
	
	<c:forEach items="${countOfTasksOfAllProjects}" var="count">
		<input type="hidden" class="allProjectsInfo" id="${count[0]}" value="${count[1]}"/>
	</c:forEach>
	
	<div id="accordion">

	    <h3><a href="#">DashBoard?</a></h3>
	    <div></div>
		
	    <h3><a href="#">Your projects</a></h3>
	    <div class="sort">
		    <c:forEach items="${projetosDoUsuario}" var="projetosDoUsuario">
		    	<div id="project" class="draw-graphic" project_id="${projetosDoUsuario.id}">
					<span id="trash" class="ui-icon ui-icon-trash">${projetosDoUsuario.id}</span>
					<span id="play" class="ui-icon  ui-icon-play" project-id="${projetosDoUsuario.id}"></span> 
					<span id="wrench" class="ui-icon  ui-icon-wrench" project-id="${projetosDoUsuario.id}"></span> 					
					<span> ${projetosDoUsuario.nome}</span> 
		    	</div>
			</c:forEach>
			
			<div id="editProjectDiv" style="display: none">
				<form action="editProject">
					<input type="text" name="nome" >
					<input type="text" name="id">					
					<input type="submit" value="edit">
				</form>
			</div>
						
			<span id="create-project">Create a new project...</span>
	    </div>
	    <h3><a href="#">Add user to project</a></h3>
	    <div id="addUserToProject">
			<input id="allUsers" type="text" name="usuarioId" />		
			<input id="allProjects" type="text" name="projetoId" />		
			<input id="addToProject" type="submit" value="add"/> 
		</div>
	</div>
	
	<div id="dialog-project">
		
		<form action="addProject" id="addProject">
		
			<label for="nome">Project Name</label> 
			<input type="text" name="nome" id="nome" maxlength="20" class="text ui-widget-content ui-corner-all"/>
		
			<label for="criador">Project Owner</label> 
			<input type="text" name="criador" id="criador" maxlength="20" class="text ui-widget-content ui-corner-all"/>
		
			<label for="dataInicio">Starting date</label> <homework:campoData name="dataInicio" id="dataInicio"/>
			
		</form>
		
	</div>

<!-- 	<button id="getGraphInfo">aaaaa</button> -->

	<div class="config-project">
	
		<span id="current-project"></span>
		<span id="users">users</span>	
	
		<table id="geral_user_table" class="hidden">
			<thead>
			  <tr>
			    <th>ID</th>
			    <th>E-mail</th>
			    <th>Login</th>
			    <th></th>
			  </tr>
			</thead>
			<c:forEach items="${team}" var="user">
			<tbody>
			  <tr class="project_${user[3]}">
			    <td>${user[0]}</td>
			    <td>${user[1]}</td>
			    <td>${user[2]}</td>				    
			    <td><span id="remover_${user[0]}">remover</span></td>
			  </tr>
			</c:forEach>
			</tbody>
		</table>
		
  		<div id="chart_div"></div>
  		
	</div>

	</body>

</html>