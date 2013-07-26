$(document).ready(function(){
	//alert(serverURL);
	$("#info").html("");
	$("#change_pass").attr("disabled",true);
	
	$("#change_pass").click(function(){
		
		var op = $("#op").val()
		var np = $("#np").val()
		var cnp = $("#cnp").val()
		
		if((op == "") || (np = "") || (cnp = "")){
			$("#info").html("All fields should be filled").css("color","red");
		}else{
			var URL = serverURL + "users/change_pass";
			var data = {op:op,np:np,cnp:cnp};
			
			$.ajax({
				url:URL,
				type:"post",
				data:data,
				success: function(data){
					alert(data);
				}
			});
		}
	});
	
	$("#cnp, #np").focusin(function(){
		$("#change_pass").attr("disabled",true);
	});
	
	$("#cnp").focusout(function(){
		var np = $("#np").val();
		var cnp = $(this).val();
		if(cnp != ""){
			if(np==cnp){
				$("#info").html("Password Confirmed").css("color","blue");
				$("#change_pass").attr("disabled",false);
				$("#change_pass").focus();
			}else{
				$("#info").html("Password Confirmed Failed").css("color","red");
			}
		}
		
	});
});