//add_companies javascript file

$(document).ready(function() {
					// load companies that are already registered
					$("#companies_progress").html("Please wait..");
					load_users();
					reset_page();

					$("#save").click(function() {
						$("#companies_progress").html("Creating User. Please wait..");
						// try login
						var $form = $("#regform"),
						// let's select and cache all the fields
						$inputs = $form.find("input, select, button, textarea"),
						// serialize the data in the form
						serializedData = $form.serialize();
						$inputs.attr("disabled", "disabled");
	
						// add or edit
						var addedit = $("#add_or_edit").val();
						//alert(addedit);
						if (addedit == 1) {
							var addUserURL = mainURL + "Users/add_company_user";
						} else if (addedit == 2) {
							var addUserURL  = mainURL + "Users/add_company_user";
						}
	
						// alert(addCompanyURL);
	
						$.ajax({
								type : "post",
								url : addUserURL,
								data : serializedData,
								success : function(data) {
									alert(data);	
									$("#companies_progress").html("User Added");
									$inputs.attr("disabled",false);
									load_users();
									reset_page();

								}// end success
							});// /end of ajax call

				});// end of add users button click
					
					$("#reset").click(function(){
						reset_page();
					});

				$(".edit").live(
						"click",
						function() {
							var firstname = $(this).attr("fname");
							var lastname = $(this).attr("lname");
							var username = $(this).attr("username");
							var email = $(this).attr("email");
							var phone = $(this).attr("phone");
							var idnum = $(this).attr("idnum");
							var user_group = $(this).attr("user_group");
							var user_id = $(this).attr("id");
							//alert()
							$("#firstname").attr("value", firstname);
							$("#lastname").attr("value", lastname);
							$("#idnum").attr("value", idnum);
							$("#email").attr("value", email);
							$("#username").attr("value", username);
							$("#phone").attr("value", phone);
							$("#user_group").attr("value", user_group);
							$("#user_id").attr("value", user_id);
							
							$("#save").attr("value", "Save");
							$("#add_or_edit").attr("value", "2");

					});

					$(".edit_permissions").live(
							"click",
							function() {
								// var buttonId = $(this).attr("loc");
								var fullname = $(this).attr("fullname");
								
								
								//alert(pref);
								
								$("#dialog_fullname").html("Edit Permissions for <b> "+fullname+"</b>");
								
								// alert(id);
								$("#permissions").attr("title",
										"Permissions").dialog({

									closeOnEscape : true,
									draggable : false,
									resizable : false,
									modal : true,
									width : 800,
									position: 'top'

								});
							});

					$("#reset_btn").click(function() {
						reset_page();
					});

					// save admin sttuf
					$("#dialog_save").click(
						function() {
							
							$("#dialog_info").html("Please Wait....");
							$("#dialog_info").css("color","blue");
							var $form = $("#permission_form"),
							// let's select and cache all the fields
							$inputs = $form.find("input, select, button, textarea"),
							// serialize the data in the form
							serializedData = $form.serialize();
							$inputs.attr("disabled", "disabled");

							var addUserURL = mainURL+"Users/edit_permissions/";
										
							//alert(addUserURL);
							$.ajax({
								type : "POST",
								url : addUserURL,
								data : serializedData,
								success : function(data) {
									//alert(data);
									$("#dialog_info").html("");
									$inputs.attr("disabled",false);
									
									var d = JSON.parse(data);
									
									if (d.status == 1){
										alert(d.message);
										$("#permissions").dialog("close");
										reset_page();
									}else{
										alert("Operation Not successful");
									}
									
									}// end success
								});// /end of ajax call

						//
					});

					$("#dialog_cancel").click(function() {
						$("#permissions").dialog("close");
					});

				});

// /other functions
function load_users() {
	// $("#companies_progress").html("Please Wait..");
	// $("#allcompanies").html("These are the companies");

	var allCompanyURL = mainURL + "Users/all_users";

	$
			.ajax({
				type : "post",
				url : allCompanyURL,
				data : "",
				success : function(data) {
					$("#companies_progress").html("");
					//alert(data);
					var d = JSON.parse(data);
					var table = "<table border = '1' width='100%'><tr bgcolor='#CCCCCC'>"
							+ "<td></td><td>Name</td><td>Username</td><td>Email</td><td>ID Number</td><td>User Group</td><td>Phone</td>"
							+ "<td>Action</td></tr>";
					var count = 1;
					$.each(d,function(key, value) {
										table = table + "<tr>";
										table = table + "<td>" + count
												+ "</td>";
										table = table + "<td>"
												+ value.firstname + " "+ value.lastname + "</td>";
										table = table + "<td>"
											+ value.username + "</td>";
										
										table = table + "<td>"
												+ value.email + "</td>";
										table = table + "<td>"
												+ value.id_num + "</td>";
										table = table + "<td>"
												+ value.user_group + "</td>";
										table = table + "<td>" + value.mobilenumber
												+ "</td>";
										table = table
												+ "<td><input type='button' value='Edit' class='edit'"
												+ "id='"
												+ value.id
												+ "' username='"
												+ value.username
												+ "'"
												+ "fname = '"
												+ value.firstname
												+ "' lname='"
												+ value.lastname
												+ "' email='"
												+ value.email
												+ "'"
												+ " idnum='"
												+ value.id_num
												+ "' user_group='"
												+ value.user_group
												+ "' phone='"
												+ value.mobilenumber
												+ "' />" +
														"<input type='button' value='Permissions' " +
														"class='edit_permissions' " +
														"fullname = '"+value.firstname+" "+value.lastname+"'>" + "<input type='button' value='Delete' id='" + value.id + "' class='delete' />"
																"</td>";
										table = table + "</tr>";

										count = count + 1;
									});
					table = table + "</table>";
					$("#allcompanies").html(table);
				}// end success
			});// /end of ajax call
}
$(".delete").live(
		
		"click",
		function(){
			var allCompanyURL = mainURL + "Users/delete_user";
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
function reset_page() {
	$("#firstname, #lastname, #idnum, #email, #username, #phone, #user_id").attr("value","");
	$("#add_or_edit").attr("value","1");
	$("#save").attr("value","Add User");
}