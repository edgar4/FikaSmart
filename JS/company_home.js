$(document).ready(function(){
	
	$("#terminal_from").change(function(){
		var terminal = $(this).val();
		var URL = serverURL+"booking/destination_terminal";
		var data = {terminal:terminal};
		alert(URL);
		
		$.ajax({
			url:URL,
			type:"post",
			data:data,
			success:function(data){
				alert(data);
			}
		});
	});
});