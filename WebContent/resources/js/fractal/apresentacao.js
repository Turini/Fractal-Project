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
		window.open("/FractalProjec/Menu?id="+$(this).attr('project-id'), '_self');
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