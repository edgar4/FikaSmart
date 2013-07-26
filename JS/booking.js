$(document).ready(function(){
	//remove seats from the database that have not been paid for by the current user
	//remove_my_selected_seats();
	
	$("#travel_date").datepicker({
		dateFormat:"mm/dd/yy"
	});
	
	$("#search").click(function(){
		var data = $("#book").serialize();
		var URL = serverURL + "booking/search/";
		
		$.ajax({
			url:URL,
			data:data,
			type:"post",
			success:function(data){
				alert(data);
				if(data != "null"){
					$("#pic").fadeOut(100);
					var d = JSON.parse(data);
					$("#bc").slideDown();
					$("#bc1").css("color","");
					$("#bc2").addClass("bcsubby");
					var table = "<tr><th>Company</td>" +
							"<td>Route </td><td>Depature</td><td>Fare</td><td></td></tr>";
					$.each(d,function(i,v){
						table = table + "<tr>";
						table = table + "<td>"+v.company+"</td>";
						table = table + "<td>"+v.desc+"</td>";
						table = table + "<td>"+v.time+"</td>";
						//table = table + "<td>"+v.bus+"</td>";
						table = table + "<td>"+v.fare+"</td>";
						table = table + "<td><input type='button' class='book_btn' value='Book' " +
								"company='"+v.company+"' bus= '"+v.bus+"' time='"+v.time+"' " +
										"  trip='"+v.trip+"'  date='"+v.date+"'" +
												" route='"+v.route_id+"'" +
														" fare='"+v.fare+"'/></td>";
						table = table + "</tr>";
					});
					
					$("#search_results").html(table);
				}else{
					alert("No data found");
					$("#search_results").html("");
				}
				
			}
		});//end ajax
	}); //end search click
	
	$(".book_btn").live("click",function(){
		var company = $(this).attr("company");
		var bus = $(this).attr("bus");
		var time = $(this).attr("time");
		var trip = $(this).attr("trip");
		var date = $(this).attr("date");
		var route = $(this).attr("route");
		var fare = $(this).attr("fare");
		
		$("#fare").attr("value",fare);
		$("#prefix").attr("value",company);
		
		start_booking(company,bus,time,trip,date,route);
		
		
		$(".search").fadeOut(300).html("Please wait..").fadeIn(300);
		var data = {company:company,bus:bus,trip:trip};
		$.ajax({
			url:serverURL+"utilities/seat_layout/",
			type:"post",
			data:data,
			success:function(mydata){
				//alert(data);
				if(trip == "new"){
					//alert("new");
				}else{
					check_status(data);
				}
				$("#bc2").css("color","");
				$("#bc3").addClass("bcsubby");
				$(".search").html("<p>Select seat(s)</p>");
				$(".search").append(mydata);
			}
		});
		
		
		
	});
	
	$('.seats').live("click",function(){
		//alert("clicked");
		var id = $(this).attr('id');
		var bus_id = $("#bus_id").val();
		var company = $("#company").val();
		var trip_id = $("#trip_id").val();
		var selected_seats = $("#selected_seats").val();
		//alert(selected_seats);
		
		var n = parseFloat(selected_seats) + 1;
		//alert(n);
		$("#selected_seats").attr("value",n);
		
		var data = {bus_id:bus_id, id:id,company:company,trip:trip_id};
		$.ajax({
			url:serverURL+"Utilities/save_seats",
			data: data,
			type:"post",
			success: function(data){
				//alert(data);
				var d = JSON.parse(data);
				if(d.status == "1"){
					$("#"+id).addClass("booked_seats_pic");
					
				}else{
					$("#"+id).attr("disabled","disabled");
					
				}
			}
			
		});	
	});//end seats click

	$("#next").live("click", function(){
		var prefix = $("#prefix").val();
		var fare = $("#fare").val();
		var num_seats = $("#selected_seats").val();
		var total = fare * num_seats;
		$(".company2").append("<br>Seats selected: "+num_seats);
		$(".company2").append("<br>Total Cost: "+total);
		var form = "";
		form = form + "<input type='text' placeholder = 'First Name' id='fname' class='bahati' />";
		form = form + "<br><input type='text' placeholder = 'Last Name' class='bahati' id='lname' />";
		form = form + "<br><input type='text' placeholder = 'Email' class='bahati' id='emailadd' />";
		form = form + "<br><input type='text' placeholder = 'ID Number' class='bahati' id='idnum' />";
		form = form + "<br><input type='text' placeholder = 'Mobile Number' class='bahati' id='mobile' />";
		form = form + "<br><input type='button' value = 'Next' id='next2' class='button2'/>";
		
		$(".search").html("<p>Please Fill the form below</p>");
		$(".search").append(form);
		
		$("#bc3").css("background-color","");
		$("#bc4").addClass("bcsubby");
		//$(".search").append(mydata);
	});
	
	$("#next2").live("click", function(){

		var prefix = $("#prefix").val();
		var fare = $("#fare").val();
		var num_seats = $("#selected_seats").val();
		var total = fare * num_seats;
		
		var fname = $("#fname").val();
		var lname = $("#lname").val();
		var email = $("#emailadd").val();
		var idnum = $("#idnum").val();
		var mobile = $("#mobile").val();
		
		var data1 = {fname:fname,lname:lname,email:email,idnum:idnum,prefix:prefix,mobile:mobile};
		
		$.ajax({
			url:serverURL + "booking/check_cust_exist",
			type:"post",
			data:data1,
			success:function(data){
				
				$("#bc4").css("background-color","");
				$("#bc5").addClass("bcsubby");
				
				//alert(data);
				var d = JSON.parse(data);
				var fname = d.fname;
				var lname = d.lname;
				var idnum = d.idnum;
				var pass = d.passenger_id;
				
				
				var html = "Name " +fname+ " "+ lname;
				html = html + "<br>Id Number: "+idnum;
				
				html = html + "<hr>";
				
				html = html + "<select name='payment_type' id='payment_type'>";
				html = html + "<option value='0'>Payment Type</option>";
				html = html + "<option value='1'>Mpesa</option>";
				html = html + "<option value='2'>Credit Card</option>";
				html = html + "</select>";
				html = html + "<hr>";
				html = html + "Total Amount:<br>";
				html = html + "<input type = 'text' class='bahati' id='payment_amount' name='payment_amount' value='"+total+"' disabled='disabled'/>";
				html = html + "<hr>";
				html = html + "<input type='button' class='button2' id='complete_booking' value='Complete Booking' />";
				$(".search").html(html);
				$("#passenger_id").attr("value",pass);
				
				
			}
		});
		//$(".search").append(mydata);
	});
	
	$("#complete_booking").live("click", function(){
		$("#bc5").css("background-color","");
		$("#bc6").addClass("bcsubby");
		var trip = $("#trip_id").val();
		var payment_type = $("#payment_type").val();
		var payment_amount = $("#payment_amount").val();
		var required_amount = $("#total_cost").val();
		var passenger = $("#passenger_id").val();
		var prefix = $("#prefix").val();
		var bus_no = $("#bus_no").val();
		
		
		if(payment_type != 0){
			if(payment_amount >= required_amount){
				var data = {bus_no:bus_no,prefix:prefix,trip:trip,payment_type:payment_type,payment_amount:payment_amount,required_amount:required_amount,passenger:passenger};
				$.ajax({
					url:serverURL + "booking/complete_booking",
					type:"post",
					data:data,
					success: function(data){
					
						alert(data);
						var d = JSON.parse(data);
						var html = "<table>";
						html = html + "<tr bgcolor='#CCCCCC'><th>Date</th><th>"+d.date_now+"</th></tr>";
						html = html + "<tr bgcolor='#CCCCCC'><th>Receipt Number</th><th>"+d.receipt+"</th></tr>";
						
						html = html + "<tr><td>Travel Date and Time</td><td>"+d.travel_date+"</td></tr>";
						html = html + "<tr><td>Bus No</td><td>"+d.bus_no+"</td></tr>";
						html = html + "<tr><td>Number of Seats</td><td>"+d.num_seats+"</td></tr>";
						html = html + "<tr><td>Cost</td><td>"+d.payment_amount+"</td></tr>";
						html = html + "<tr><td>Name</td><td>"+d.firstname+" "+d.lastname+"</td></tr>";
						html = html + "<tr><td>Route</td><td>"+d.route+"</td></tr>";
						html = html + "</table>";
						html = html + "<p>NOTE: You are required to show up thirty minutes before the depature time<br>Thanks</p>";
						html = html + "<input type='button' class='button2' id='finish' value='Finish' />";
						$(".search").html(html);
					}
				});
				
			}else{
				alert("Hahahaha You think am stupid huh");
			}
		}else{
			alert("Please select payment type")
		}
	});
	
	$(".seats").live("mouseenter",function(){
		$(this).addClass("seatshov");
	});
	$(".seats").live("mouseleave",function(){
		$(this).removeClass("seatshov");
	});
	
	$("#finish").live("click",function(){
		alert("Trip successfully booked");
		window.location.replace(mainURL);
	});
	/*
	$('.seats').mouseenter(function(){
		var seat_no = $(this).attr('id');
		alert(seat_no);
		$("#"+seat_no).attr("class","seatshov");
	});
	$('.seats').mouseleave(function(){
		var seat_no = $(this).attr('id');
		$("#"+seat_no).attr("class","seats");
	});
	*/
});//end document ready

function start_booking(company,bus,time,trip,date,route){
	$(".company2").html("please wait...");
	
	var URL = serverURL + "booking/start_booking/";
	var data = {company:company,bus:bus,time:time,trip:trip,date:date,route:route};
	
	$.ajax({
		url:URL,
		data:data,
		type:"post",
		success: function(data){
			//alert(data);
			
			var d = JSON.parse(data);
			var fare = $("#fare").val();
			//alert(fare);
			var html = "Company: "+d.company_name+"<br>";
			html = html + "Bus Number: "+d.bus+"<br>";
			html = html + "Date: "+date+"<br>";
			html = html + "Depature Time: "+time+"<br>";
			html = html + "Trip ID: "+d.trip+"<br>";
			html = html + "Fare/Head: "+fare+"<br>";
			
			$("#trip_id").attr("value",d.trip);
			$("#bus_no").attr("value",d.bus);
			$(".company2").html(html);
		}
		
	});
}

/*
var auto_refresh = setInterval(
function()
{
	init();

	
}, 5000);
*/
function check_status(data){
	
	var bus_id = $("#bus_id").val();
	
	$.ajax({
		url:serverURL+"Utilities/booked_seats",
		data: data,
		type:"post",
		success: function(data){
			//alert(data);
			var d = JSON.parse(data);
			
			$.each(d,function(index,value){
				//alert(value.seat_id);
				if(value.status == 1){
					$("#"+value.seat_id).addClass("booked_seats_pic");
					
				}else if(value.status == 2)
					$("#"+value.seat_id).css("background","green").attr("disabled",true);
			});
		}
			
		});
}