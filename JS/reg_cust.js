$(document).ready(function(){	

$('#reg_cust_btn').click(function(){
		
	
		var use = $("#username").val();
		var pass = $("#pass").val();
		var firstname = $("#firstname").val();
		var lastname = $("#lastname").val();
		var email = $("#email").val();
		var mobilenumber = $("#mobilenumber").val();
		var id_num = $("#id_num").val();
	
		if(
			use != ""
				)
		{
			
			//try login
			var $form = $("#cust_reg_form"),
	        // let's select and cache all the fields
	        $inputs = $form.find("input, select, button, textarea"),
	        // serialize the data in the form
	        serializedData = $form.serialize();
			
			var loginURL = serverURL + "Users/add_company_user/";
			//alert(loginURL);
			 $(".reg_error").html("Please wait....").css("color","black");
			$.ajax({
				type:"post",
				url:loginURL,
				data:serializedData,
				success: function(data){
					alert(data);
					var res = JSON.parse(data);
					 if(res.status === "1")
					{
					 	alert("Account has been created. Login Details have been sent to your emal. Thanks!")
						window.location.replace(serverURL+"Home");
					}
					 else
					 {	
						 $(".reg_error").html("Account Registration Failure!");
						$(".reg_error").css("color","#FF4500");
					 }
				}
			});
		}
		else
		{
			$(".reg_error").html("Missing Important Information");
			$(".reg_error").css("color","#FF4500");
		}
	});


$('#pass_rec_btn').click(function(){
	
	
	var $form = $("#pass_rec_form"),
    // let's select and cache all the fields
    $inputs = $form.find("input, select, button, textarea"),
    // serialize the data in the form
    serializedData = $form.serialize();

	var loginURL = mainURL + "Test/pass_recovery";
	//alert(loginURL);
	$.ajax({
		type:"post",
		url:loginURL,
		data:serializedData,
		success: function(data){
			alert(data);
			var res = JSON.parse(data);
			 if(res.STATUS === "1")
			{
			 	
			}
			 else
			 {	
				 
				
			 }
		}
	});
	
});
		
	

});