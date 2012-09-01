$(function() {
			$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
			var nome = $( "#nome" ),
			criador = $( "#criador" ), 
			dataCriacao = $("#dataCriacao"),
			allFields = $( [] ).add( nome ).add( criador ).add( dataCriacao );

		$( "#dialog-project" ).dialog({
			autoOpen: false,
			height: 250,
			width: 820,
			modal: true,
			buttons: {
				"Create Project": function() {
						$( "#addProject" ).submit();
						$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
			},
			Clear: function() {
				allFields.val( "" );
			}
		  }
		});
		
			$( "#create-project" ).click(function() {
				allFields.val( "" );
				$( "#dialog-project" ).dialog( "open" );
				$("#addProject").find(":input").attr("disabled", false);
			});
		});
		
		
	$('#trash').live('click', function(){
		var id = $(this).text();
			$.get("deleteProject", {id:id})
				.success(function(){
					$("#trash").closest("div").hide();
				}).error(function(){
					alert("some error message");
			});
	});

	$('#play').live('click', function(){
		window.open("/FractalProjec/project/"+$(this).attr('project-id'), '_self');
	});

//	FIXME
	$('#wrench').live('click', function(){
//		$('#editProjectDiv').show();
//		var projectId = $(this).attr('project-id');
//		var projectNome = $(this).closest('span');
//		$('input[name=nome]').val(projectId);
	});
	
	$('#editProjectDiv input[type=submit]').live('click', function(){
		$.get('editProject', {id: id});
	});
	
	
//	$(function(){
//		$( ".sort" ).sortable({
//			connectWith: "div",
//			helper: "clone"
//		});
//	});
	
//	$(function(){
//		$( ".draggable" ).draggable({
//			helper: 'clone'
//		});
//		$( ".droppable" ).droppable({drop: function(event, ui){
//	        if (ui.draggable.hasClass('originalclass')) {
//	            $(this).append(ui.draggable); ui.draggable.css('top', ui.position.top);
//	                ui.draggable.css('left', ui.position.left);
//	                ui.draggable.css('position', 'absolute');
//	                ui.draggable.draggable('destroy').draggable(); /* need to reset the draggability */    
//	                }
//	    }});
//			drop: function( event, ui ) {
//				$( this )
//					.addClass( "ui-state-highlight" )
//					.find( "p" )
//						.html( "Dropped!" );
//			}
//		});
//	});
	
//	$('#getGraphInfo').live('click', function(e){
//		var id = 2;
//		$.get("project/countTasksByStatus", {id:id}, function(countOfTasks){
//			console.log(jQuery.parseJSON( countOfTasks ));
//		});
//		e.preventDefault();
//	});
	
//	$('.draw-graphic').live('click', function(){
//		var projectId = $(this).attr('project_id');
//		$('#current-project').val(projectId);
//		drawGraphicOfThisProject(projectId);
//		$('#geral_user_table').hide();
//		$('#chart_div').show();
//	});
	
//	google.load('visualization', '1', {'packages':['corechart']});
	
	$('.draw-graphic').live('click', function(request, response){
		var projectId = $(this).attr('project_id');
		$('#current-project').val(projectId);
		
		$.ajax({
        	
        	url: "project/getGraphicInformation",
        	dataType: "json",
        	data: { projectId: projectId },
        	
        	success: function (data) {
        		drawGraphicOfThisProject(data);
        		
//        	var data = new google.visualization.DataTable();
        		
//      		  data.addColumn('string', 'Status');
//      		  data.addColumn('number', 'Tasks');
//      		  data.addRows(8);
      		  
//        		for (var i = 0; i < data.length; i ++) {
//  				  data.setValue(i, 0, data[i][0]);					
//				  data.setValue(i, 1, data[i][1]);
//        		}        		
        		
//        		var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
      		  
//      		    chart.draw(data, {width: 600, height: 340, title: 'Count of tasks by statuses', titleTextStyle: {color: 'grey'}, colors: ['lightgrey']});
    		}
        });
		
		
		
		
//		drawGraphicOfThisProject(projectId);
		$('#geral_user_table').hide();
		$('#chart_div').show();
	});
	
	$('#users').live('click', function(){
		var projectId = $('#current-project').val();
		$('#geral_user_table tr').hide();
		$('#chart_div').hide();
		$('#geral_user_table').show();
		$('#geral_user_table thead tr').show();
		$('#geral_user_table tr.project_'+projectId).show();
	});

	
	google.load('visualization', '1', {'packages':['corechart']});
	
//		google.setOnLoadCallback(drawGraphicOfThisProject);
	
	function drawGraphicOfThisProject(info) {
	
		var data = new google.visualization.DataTable();
		
		  data.addColumn('string', 'Status');
		  data.addColumn('number', 'Tasks');
		  data.addRows(info.length);
		   
		  for ( var i = 0; i < info.length; i++) {
			  data.setValue(i, 0, info[i][0].split('_')[0]);					
			  data.setValue(i, 1, parseInt(info[i][1]));
		  }
		  
		  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
		  chart.draw(data, {width: 600, height: 340, title: 'Count of tasks by status', titleTextStyle: {color: '#504F4F'}, colors: ['#504F4F']});
	}
	
//	$('#users').live('click', function(){
//		
//	});
	
	$('span[id^=remover_]').live('click', function(){
		
		var self = $(this);
		var id = $(this).attr('id').split('_')[1];
		var pid = $(this).closest('tr').attr('class').split('_')[1];
		
		$.get('removeFromProject', {id : id, pid : pid})
			.success(function(){
				$(self).closest('tr').remove();
			})
			.error(function(){
				alert("Something really wrong just happen.");
			});
	});

	$(function() {
		$( "#allUsers" ).autocomplete({
			source: function (request, response) {
	            $.ajax({
	            	
	            	url: "listAllUsers",
	            	dataType: "json",
	            	data: { login: request.term },
	            	
	            	success: function (data) {
	            		response( $.map( data.userList, function( item ) {
	            			return {
	            				label: item.id + ", " +item.name,
	            				value: item.id
	            			}
	            		}));
	            	},
	            	minLength: 1
	            });
			}
		});
	
	$( "#allProjects" ).autocomplete({
		source: function (request, response) {
            $.ajax({
            	
            	url: "listAllProjects",
            	dataType: "json",
            	data: { name: request.term },
            	
            	success: function (data) {
            		response( $.map( data.projectList, function( item ) {
            			return {
            				label: item.id + ", " +item.name,
            				value: item.id
            			}
            		}));
            	},
            	minLength: 1
            });
			}
		});
	});

	$('#addToProject').live('click', function(){
		var userId = $(this).parent().find('input')[0];
		var projectId = $(this).parent().find('input')[1];
//		$.get('associaEmProjeto', {userId:userId, projectId:projectId});
	});
	