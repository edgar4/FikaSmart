<div class="company">
	<div id="companies_progress"></div>
	<div id="allcompanies"></div>
</div>

<div id="company_admin" style="display: none">
	<div id="dialog_info"></div>
	<hr>
	<div id="dialog_company_name"></div>
	<hr>
	<form name = "admin_form" id="admin_form">
	<ul>
		<li><label for="admin_firstname">First Name</label></li>
		<li><input type = "text" id = "admin_firstname" name = "admin_firstname" placeholder="First Name" class="bahati" /></li>
		
		<li><label for="admin_lastname">Last Name</label></li>
		<li><input type = "text" id = "admin_lastname" name = "admin_lastname" placeholder="Last Name" class="bahati" /></li>
		
		<li><label for="admin_idnum">ID Number</label></li>
		<li><input type = "text" id = "admin_idnum" name = "admin_idnum" placeholder="ID Number" class="bahati" /></li>
		
		<li><label for="admin_email">Email</label></li>
		<li><input type = "text" id = "admin_email" name = "admin_email" placeholder="Firstname" class="bahati" /></li>
		
		<li><label for="admin_username">Username</label></li>
		<li><input type = "text" id = "admin_username"  name = "admin_username" placeholder="Username" class="bahati" /></li>
		
		<li><label for="admin_phone">Phone number</label></li>
		<li><input type = "text" id = "admin_phone" name = "admin_phone" placeholder="Phone Number" class="bahati" /></li>
		
		
		<input type = "hidden" id = "admin_select_company" name = "admin_select_company" value="" />
		<input type = "hidden" id = "admin_user_level" name = "admin_user_level" value="" />
		<input type = "hidden" id = "admin_prefix" name = "admin_prefix" value="" />
		
		<li><input type="button" value="Save" id="dialog_save"/>
		
		<button id="dialog_cancel">Cancel</button></li>
		
		</ul>
	</form>

</div>

<div class="admin">

	<form action="#" id="add_company_form" name="add_company_form">
<ul>
		<li>Company Name</li>
		<li> <input type="text" name="company_name" id="company_name" class="bahati" /></li>

		<li>Company Location</li>
		 <li><input type="text" name="company_loc"id="company_loc" class="bahati" /> </li>
		<li> Address </li>
		 <li><input type="text" name="company_addr" id="company_addr" class="bahati" /> </li>
			<li>Telephone Number</li>
			 <input type="text" name="tel_number" id="tel_number" class="bahati" />
			  <li>Email </li>
			 <li> <input type="text" name="email_add" id="email_add" class="bahati" /> </li>
			 <li><span id="p">Prefix</span></li>
			  <li><input type="text" name="db_prefix" id="db_prefix" class="bahati"  /></li>
			  <input type="hidden" name="source" id="source" value="page" />
			   <input type="hidden" name="add_or_edit" id="add_or_edit" value="1" />
			  <input type="hidden" name="company_id" id="company_id" value="" />
			  <input type="button" class="button_1" id="add_company_btn" value="Add Company" /> 
			  <input type="button" class="button_1" id="reset_btn" value="Reset" />
	</form>
</ul>
</div>
<div id="modal"></div>


</div>
<script type="text/javascript"
	src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script type="text/javascript"
	src="<?php echo base_url()."JS/add_companies.js"?>"></script>

<!--

//-->



</body>
</html>