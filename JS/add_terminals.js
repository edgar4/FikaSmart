$(document).ready(function(){
	//disable latitude and longitude inputs
	//$("#lat").attr("disabled",true);
	//$("#lng").attr("disabled",true);
	$("#save").click(function(){
		//alert("Save");
		
		var URL = mainURL+"Company/Company_users/save_terminal/";
		
		var $form = $("#terminal_location"),
		// let's select and cache all the fields
		$inputs = $form.find("input, select, button, textarea"),
		// serialize the data in the form
		serializedData = $form.serialize();
		
		$.ajax({
			type:"post",
			url:URL,
			data:serializedData,
			success:function(data){
				var d = JSON.parse(data);
				
				if(d.status == 1){
					$("#info").html("Terminal Saved");
					//alert("Terminal Saved");
				}else{
					$("#info").html("Terminal Not Saved");
					//alert("Terminal Not saved");
				}
			}
		});
	});//end save terminal click function
	
	//view terminals
	
	$("#view_terminals").click(function(){
		var URL = mainURL+"Company/Company_users/all_terminals/";
		$.ajax({
			type:"post",
			data:"",
			url:URL,
			success: function(data){
				//alert(data);
				var d = JSON.parse(data);
				
				var table = "<table width = '100%' border='1'><tr><th></th>" +
						"<th>Terminal Name</th><th>Description</th><th>Longitude</th>" +
						"<th>Latitude</th><th>Code</th><th>Action</th>";
				var count = 1;
				
				$.each(d,function(index, value){
					table = table + "<tr>";
						table = table + "<td>"+ count + "</td>";
						table = table + "<td>"+ value.terminal_name + "</td>";
						table = table + "<td>"+ value.terminal_desc + "</td>";
						table = table + "<td>"+ value.longitude + "</td>";
						table = table + "<td>"+ value.latitude + "</td>";
						table = table + "<td>"+ value.terminal_code + "</td>";
						table = table + "<td><input type='button' class='delete' value='Delete' id='" +value.id+ "' /></td>";
					table = table + "</tr>";
				});
				
				table = table + "</table>";
				$("#all_terminals").html(table);
				
			}
		});
		
		$("#all_terminals").attr("title","All Terminals").dialog({
			closeOnEscape : true,
			draggable : false,
			resizable : false,
			modal : true,
			width : 900,
			position: 'top',
			buttons: { "Ok": function() { $(this).dialog("close"); } } 

		});
	});//end view terminals click
	
	$("#view_terminal_maps").click(function(){
		
		window.location.replace(mainURL+"Company/company_users/maps");

	});
	
	$(".delete").live(
		"click",
		function(){
			var id = $(this).attr("id");
			var URL = mainURL+"Company/Company_users/delete_terminal/";
			$.ajax({
				url: URL,
				data: {id:id},
				type:"post",
				success: function(data){
					alert(data);

				}
				
			});
			
		}
	
	);
});

