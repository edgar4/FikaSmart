$(document).ready(function(){
	//load buses
	load_buses();
	
	//add bus
	
	$("#add_bus").click(function(){
		var data = $("#buses_form").serialize();
		
		var URL = mainURL+"Company/Company_users/add_bus";
		
		$.ajax({
			url:URL,
			type:"post",
			data:data,
			success: function(data){
				alert(data);
				var d = JSON.parse(data);
				
				if(d.status == 1){
					load_buses();
					reset();
				}else{
					alert("Bus not Saved!");
				}
				
			}
			
		});//end ajax call
	});//end add bus
	
	//edit cutton click
	$(".edit").live("click",function(){
		var id = $(this).attr("id");
		var reg_num = $(this).attr("reg_num");
		var seats = $(this).attr("seats");
		var seat_config = $(this).attr("seat_config");
		var category = $(this).attr("category");
		var bus_code = $(this).attr("bus_code");
		
		
		$("#reg_num").attr("value",reg_num);
		$("#bus_code").attr("value",bus_code);
		$("#num_seats").attr("value",seats);
		$("#seat_config").attr("value",seat_config);
		$("#category").attr("value",category);
		$("#add_or_edit").attr("value",2);
		$("#bus_id").attr("value",id);
		$("#add_bus").attr("value","Save");

	});
	
	$("#edit_bus_categories").click(function(){
		alert("Link Clicked");
	});
	
});// end of document ready
///////////////////////////////////////////////////////////

function reset(){
	$("#reg_num, #bus_code, #num_seats, #seat_config, #category").attr("value","");
	$("#add_or_edit").attr("value",1);
	$("#add_bus").attr("value","Add Bus");
}

function load_buses(){
	var URL = mainURL+"Company/Company_users/all_buses";

	$.ajax({
		url:URL,
		type:"post",
		data:"",
		success: function(data){
			var d = JSON.parse(data);
			var table = "<tr bgcolor='#CCCCCC'><th></th>" +
					"<td>Registration Number</td>" +
					"<td>Bus Code</td>" +
					"<td>No. of Seats</td>" +
					"<td>Seat config</td><td>Category</td><td></td></tr>";
			var count = 1;
			$.each(d,function(index,value){
				table = table + "<tr>";
					table = table + "<td>"+count+"</td>";
					table = table + "<td>"+value.registration_num+"</td>";
					
					table = table + "<td>"+value.bus_code+"</td>";
					table = table + "<td>"+value.seats+"</td>";
					table = table + "<td>"+value.seat_config_id+"</td>";
					table = table + "<td>"+value.category_id+"</td>";
					table = table + "<td><input type='button' value='Edit' class='edit'" +
							" reg_num = '"+value.registration_num+"'" +
							" seats = '"+value.seats+"'" +
							" seat_config = '"+value.seat_config_id+"'" +
							" category='"+value.category_id+"'" +
							" id='"+value.id+"'" +
							" bus_code='"+value.bus_code+"'>" +
									"<input type='button' class= 'delete' value ='Delete' id='" + value.id + "' /></td>";
				table = table + "</tr>";
				
				count++;
			});
			$("#all_buses_display").html(table);
		}
	});
}

$(".delete").live(
		
		"click",
		function(){
			var allCompanyURL = mainURL + "Company/Company_users/delete_bus";
			var id = this.id;
			
			$.ajax({
				url: allCompanyURL,
				data: {id:id},
				type:"post",
				success: function(data){
					alert(data);
					
					
				}
				
			});
		});