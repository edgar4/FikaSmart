//login javascript file

var mainURL = serverURL; //from the calling page

$(document).ready(function(){
	
	$("#info").css("color","black");
	$("#button_login").click(function(){
		
		var username = $("#email").val();
		var password = $("#password").val();
		
		if(username != "" && password != "")
		{
			$("#info").css("color","black");
			$("#info").html("Please Wait..");
			
			
			//try login
			var $form = $("#login_form"),
	        // let's select and cache all the fields
	        $inputs = $form.find("input, select, button, textarea"),
	        // serialize the data in the form
	        serializedData = $form.serialize();
			
		
			$inputs.attr("disabled",true);
			var loginURL = mainURL + "Login/auth";
			//alert(loginURL);
			$.ajax({
				type:"post",
				url:loginURL,
				data:serializedData,
				success: function(data){
					//alert(data);
					$inputs.attr("disabled", false);
					var res = JSON.parse(data);
					 if(res.status === "1")
					{
					 	//$("#info").css("color","blue");
						//$("#info").html("Loggin Successful"); 
						window.location.replace(mainURL+"Login_handler");
					}
					 else
					 {
						$("#info").css("color","red");
						$("#info").html("Username and Password Error, Please Try again"); 
					 }
				}
			});
		}
		else
		{
			$("#info").html("Email or Password cannot be empty");
			$("#info").css("color","red");
		}
		
	});//end of login click

});//end of document ready
