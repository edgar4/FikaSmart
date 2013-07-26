$(document).ready(function(){
	//alert("Loaded");
	
	$("#show_route").click(function(){
		//alert("Show route");
		
		//start terminal 
		var t_from_lat = $('#terminal_from option:selected').attr('lat');
		var t_from_lng = $('#terminal_from option:selected').attr('lng');
		
		var t_to_lat = $('#terminal_to option:selected').attr('lat');
		var t_to_lng = $('#terminal_to option:selected').attr('lng');
		
		//alert(t_from_lat + " " + t_from_lng);
		//alert(t_to_lat+ " " + t_to_lng);
		
		var start = t_from_lat + ", " + t_from_lng;
		var end= t_to_lat+ ", " + t_to_lng;
		calcRoute(start,end);
		initialize();
	});
	
	$("#save_route").click(function(){
		var table = "<table>";
		$("#display_route_details").html("<h3>Route Information</h3>");
		var from = $('#terminal_from option:selected').html();
		var to = $('#terminal_to option:selected').html();
		var distance = $('#distance').val();
		var dutarion= $('#duration').val();
		
		table = table + "<tr><td>Start: </td><td>"+from+"</td></tr>";
		table = table + "<tr><td>End: </td><td>"+to+"</td></tr>";
		table = table + "<tr><td>Distance (Kms): </td><td>"+distance+"</td></tr>";
		table = table + "<tr><td>Duration (Hrs): </td><td>"+dutarion+"</td></tr>";
		
		table = table + "</table>";
		
		$("#display_route_details").append(table);
		
		$("#save_route_details").attr("title","Save Route").dialog({
			closeOnEscape : true,
			draggable : false,
			resizable : false,
			modal : true,
			width : 900,
			height: 600,
			position: 'top' 

		});//save routes dialogue end
	}); // save routes click end
	
	$("#proceed_save").click(function(){
		var from = $('#terminal_from option:selected').attr('id');
		var to = $('#terminal_to option:selected').attr('id');
		var distance = $('#distance').val();
		var dutarion= $('#duration').val();
		
		var name = $('#route_name').val();
		
		if(name != ""){
			$("#display_route_progress").html("Please wait.....");
			//var data = "from ="+ from + "&to=" + to + "&distance=" + distance + "&duration =" + dutarion + "&name=" + name;
			var data = {from:from,to:to,distance:distance,duration:dutarion,name:name};
			var URL = serverURL+"Company/Company_users/save_route";
			//alert(URL);
			
			$.ajax({
				url:URL,
				data:data,
				type:"post",
				success: function(data){
					//alert(data);
					$("#display_route_progress").html("");
					var d = JSON.parse(data);
					
					if(d.status == 1){
						alert("Route Saved!");
						$("#save_route_details").dialog("close");
					}else{
						alert("Error while saving Route!");
					}
				}
			});
		}else{
			alert("route Name Cannot be Empty");
		}
		
	});//end of proceed save
	
	$("#view_routes").click(function(){
		var URL = serverURL+"Company/Company_users/all_routes";
		
		$.ajax({
			url:URL,
			type:"post",
			data:"",
			success: function(data){
				
				//alert(data);
				
				var d = JSON.parse(data);
				
				var t_data = "<tr bgcolor='#CCCCCC'><td>Route Name</td>" +
						"<td>Terminal 1</td>" +
						"<td>Terminal 2</td>" +
						"<td>Distance</td>" +
						"<td>Duration</td></tr>";
				
				$.each(d,function(index,value){
					t_data = t_data + "<tr>";
						t_data = t_data + "<td>"+value.description+"</td>";
						t_data = t_data + "<td>"+value.terminal_start+"</td>";
						t_data = t_data + "<td>"+value.terminal_end+"</td>";
						t_data = t_data + "<td>"+ Math.round(value.distance) +" Kms</td>";
						t_data = t_data + "<td>"+ Math.round(value.duration) +" Hrs</td>";
					t_data = t_data + "</tr>";
				});
				
				$("#all_routes_display").html(t_data);
				
				$("#all_routes").attr("title","All Routes").dialog({
					closeOnEscape : true,
					draggable : false,
					resizable : false,
					modal : true,
					width : 900,
					height: 600,
					position: 'top' 

				});//save routes dialogue end
			}
		});
	});
	
});// end of document ready
