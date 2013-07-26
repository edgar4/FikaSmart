$(document).ready(function(){
	init();
	$('.seats').click(function(){
		var id = $(this).attr('id');
		var bus_id = $("#bus_id").val();
		
		$.ajax({
			url:serverURL+"Test/save_seats",
			data: {bus_id:bus_id, id:id},
			type:"post",
			success: function(data){
				//alert(data);
				

				if(d.status == "1"){
					$("#"+id).css("background","red");
				}else{
					$("#"+id).attr("disabled","disabled");
				}
			}
			
		});
		
		
	});//end .seats
	
	var auto_refresh = setInterval(
	function()
	{
		init();
	
		
	}, 5000);

	
});

function init(){
	
	var bus_id = $("#bus_id").val();
	
	$.ajax({
		url:serverURL+"Test/booked_seats",
		data: {bus_id:bus_id},
		type:"post",
		success: function(data){
			//alert(data);
			var d = JSON.parse(data);
			
			$.each(d,function(index,value){
				if(value.status == 1){
					$("#"+value.seat_id).css("background","red");
				}else if(value.status == 2)
					$("#"+value.seat_id).css("background","green").attr("disabled",true);
			});
		}
			
		});
}
