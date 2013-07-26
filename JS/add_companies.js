//add_companies javascript file

$(document)
		.ready(
				function() {
					// load companies that are already registered
					$("#companies_progress").html("Please wait..");
					load_companies();
					reset_page();

					$("#add_company_btn")
							.click(
									function() {
										$("#companies_progress")
												.html(
														"Saving Company Information. Please wait..");
										// try login
										var $form = $("#add_company_form"),
										// let's select and cache all the fields
										$inputs = $form
												.find("input, select, button, textarea"),
										// serialize the data in the form
										serializedData = $form.serialize();
										$inputs.attr("disabled", "disabled");

										// add or edit
										var addedit = $("#add_or_edit").val();
										// alert(addedit);
										if (addedit == 1) {
											var addCompanyURL = mainURL
													+ "Admin/add_company";
										} else if (addedit == 2) {
											var addCompanyURL = mainURL
													+ "Admin/edit_company";
										}

										// alert(addCompanyURL);

										$
												.ajax({
													type : "post",
													url : addCompanyURL,
													data : serializedData,
													success : function(data) {
														// alert(data);
														$inputs.attr(
																"disabled",
																false);

														var d = JSON
																.parse(data);

														// if status = 1

														if (d.status == 1) {
															if (d.progress == 1) {
																$(
																		"#companies_progress")
																		.html(
																				"Creating company Resources and loading company list. Please wait..");
																load_companies();

																var URL = mainURL
																		+ "Admin/add_db_stuff/"
																		+ d.pref;
																$
																		.ajax({
																			type : "post",
																			url : URL,
																			data : "",
																			success : function(
																					data) {
																				// $("#companies_progress").html("Resources
																				// created");
																				reset_page();

																			}// end
																		// success
																		});
															} else if (d.progress == 99) {
																$(
																		"#companies_progress")
																		.html(
																				"Company Updated");
																reset_page();
																load_companies();
															}
														} else {
															alert("response denied");
														}

													}// end success
												});// /end of ajax call

									});// end of add companies button click

					$(".edit").live(
							"click",
							function() {
								var company_name = $(this).attr("c");
								var company_loc = $(this).attr("loc");
								var company_ad = $(this).attr("ad");
								var company_email = $(this).attr("e");
								var company_tel = $(this).attr("tel");
								var company_id = $(this).attr("id");

								$("#company_name").attr("value", company_name);
								$("#company_loc").attr("value", company_loc);
								$("#company_addr").attr("value", company_ad);
								$("#email_add").attr("value", company_email);
								$("#tel_number").attr("value", company_tel);
								$("#company_id").attr("value", company_id);
								$("#db_prefix").attr("disabled", true);
								$("#db_prefix").attr("placeholder",
										"Field Cannot be edited");
								$("#db_prefix").hide();
								$("#p").hide();
								$("#add_company_btn").attr("value", "Save");
								$("#add_or_edit").attr("value", "2");

							});

					$(".add_admin").live(
							"click",
							function() {
								// var buttonId = $(this).attr("loc");
								var c_name = $(this).attr("c");
								var id = $(this).attr("id");
								var pref = $(this).attr("pref");
								//alert(c_name);
								$("#dialog_company_name").html(c_name);
								//alert(pref);
								
								$("#admin_select_company").attr("value", id);
								$("#admin_user_level").attr("value", 2);
								$("#admin_prefix").attr("value",pref);
								// alert(id);
								$("#company_admin").attr("title",
										"Company Admin").dialog({

									closeOnEscape : true,
									draggable : false,
									resizable : false,
									modal : true,
									width : 600,

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
							var $form = $("#admin_form"),
							// let's select and cache all the fields
							$inputs = $form.find("input, select, button, textarea"),
							// serialize the data in the form
							serializedData = $form.serialize();
							$inputs.attr("disabled", "disabled");
							//alert(serializedData);
							var addUserURL = mainURL+"Users/add_user/";
										
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
										$("#company_admin").dialog("close");
										reset_page();
									}else{
										alert("Operation Not successful");
									}
									
									}// end success
								});// /end of ajax call

						//
					});

					$("#dialog_cancel").click(function() {
						$("#company_admin").dialog("close");
					});

				});

// /other functions
function load_companies() {
	// $("#companies_progress").html("Please Wait..");
	// $("#allcompanies").html("These are the companies");

	var allCompanyURL = mainURL + "Admin/all_company";

	$
			.ajax({
				type : "post",
				url : allCompanyURL,
				data : "",
				success : function(data) {
					$("#companies_progress").html("");

					var d = JSON.parse(data);
					var table = "<table width='100%'><tr bgcolor='#CCCCCC'>"
							+ "<td></td><td>Name</td><td>Location</td><td>Email</td><td>Postal</td><td>Phone</td>"
							+ "<td>Action</td></tr>";
					var count = 1;
					$
							.each(
									d,
									function(key, value) {
										table = table + "<tr>";
										table = table + "<td>" + count
												+ "</td>";
										table = table + "<td>"
												+ value.company_name + "</td>";
										table = table + "<td>"
												+ value.company_loc + "</td>";
										table = table + "<td>"
												+ value.email_add + "</td>";
										table = table + "<td>"
												+ value.postal_adress + "</td>";
										table = table + "<td>" + value.tel
												+ "</td>";
										table = table
												+ "<td><input type='button' value='Edit' class='edit'"
												+ "id='"
												+ value.id
												+ "'"
												+ "c = '"
												+ value.company_name
												+ "' loc='"
												+ value.company_loc
												+ "' e='"
												+ value.email_add
												+ "'"
												+ " ad='"
												+ value.postal_adress
												+ "' tel='"
												+ value.tel
												+ "'><input type='button' "
												+ "id='"
												+ value.id
												+ "' pref='"
												+ value.db_prefix
												+ "' c='"
												+ value.company_name
												+ "' value='Add Admin' class='add_admin'></td>";
										table = table + "</tr>";

										count = count + 1;
									});
					table = table + "</table>";
					$("#allcompanies").html(table);
				}// end success
			});// /end of ajax call
}

function reset_page() {
	$("#company_name").attr("value", "");
	$("#company_name").attr("placeholder", "Company Name");

	$("#company_loc").attr("value", "");
	$("#company_loc").attr("placeholder", "Company Location");

	$("#company_addr").attr("value", "");
	$("#company_addr").attr("placeholder", "Company Address");

	$("#email_add").attr("value", "");
	$("#email_add").attr("placeholder", "Email Address");

	$("#tel_number").attr("value", "");
	$("#tel_number").attr("placeholder", "Telephone Number");

	$("#company_id").attr("value", "");
	$("#db_prefix").attr("disabled", false);
	$("#db_prefix").attr("placeholder", "Prefix");
	$("#db_prefix").attr("value", "");
	$("#add_company_btn").attr("value", "Add Company");
	$("#add_or_edit").attr("value", "1");
	
	$('#admin_firstname').attr("value", "");
	$('#admin_lastname').attr("value", "");
	$('#admin_idnum').attr("value", "");
	$('#admin_email').attr("value", "");
	$('#admin_username').attr("value", "");
	$('#admin_phone').attr("value", "");
	$('#admin_select_company').attr("value", "");
	$('#admin_user_level').attr("value", "");
	$('#admin_prefix').attr("value", "");
	
	$("#db_prefix, #p").fadeIn(200);

}