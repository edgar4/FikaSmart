<div class="company" >
	<div id="companies_progress"></div>
	<div id="allcompanies"></div>
</div>

<div id="permissions" style="display: none; ">
	<div id="dialog_info"></div>
	
	<p id = "dialog_fullname"></p>
	<form name = "permission_form" id="permission_form">

	</form>
	<hr>	
	<input type="button" value="Save" id="dialog_save"/>
	
	<button id="dialog_cancel">Cancel</button>
	</form>

</div>

<div class="admin">

		<form name = "regform" id="regform">
		<table>
		<label for="firstname">First Name</label><br>
		<input type = "text" id = "firstname" name = "firstname" placeholder="First Name" class="bahati"/>
		
		<br><label for="lastname">Last Name</label><br>
		<input type = "text" id = "lastname" name = "lastname" placeholder="Last Name"  class="bahati"/ />
		
		<br><label for="idnum">ID Number</label><br>
		<input type = "text" id = "idnum" name = "idnum" placeholder="ID Number" class="bahati" />
		
		<br><label for="email">Email</label><br>
		<input type = "text" id = "email" name = "email" placeholder="Firstname" class="bahati" />
		
		<br><label for="username">Username</label><br>
		<input type = "text" id = "username"  name = "username" placeholder="Username" class="bahati" />
		
		<br><label for="user_group">User Group</label><br>
		<select name="user_group" id="user_group">
			<option value="2">Company Admin</option>
			<option value="3">Terminal Manager</option>
			<option value="4">Cashier</option>
			<option value="5">Conductor</option>
			<option value="6">Loader</option>
			<option value="7">Driver</option>
		</select>
		
		<br><label for="phone">Phone number</label><br>
		<br><input type = "text" id = "phone" name = "phone" placeholder="Phone Number" class="bahati" /><br>
		
		
		<input type = "hidden" id = "add_or_edit" name = "add_or_edit" value="1" />
		<input type = "hidden" id = "user_id" name = "user_id" value="" />
		<input type = "hidden" id = "prefix" name = "prefix" value="<?php echo $prefix; ?>" />
		<input type = "hidden" id = "company" name = "company" value="<?php echo $company; ?>" />
		
		<input type="button" value="Add User" id="save" class="button_1"/>
		<input type="button" value="Reset" id="reset" class="button_1"/>
	</form>

</div>
<div id="modal"></div>


</div>
<script type="text/javascript"
	src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script type="text/javascript"
	src="<?php echo base_url()."JS/add_users.js"?>"></script>

<!--

//-->



</body>
</html>