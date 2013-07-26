

<div id="body">
<?php 
	if(isset($new)){
		echo "<p>The System has discovered You Have not changed your default password. Please do so now<br>You can change later if thats your wish</p>";
	}
?>


<hr>
<span id="info"></span><br>
<form name="" id="">
	<label for="op">Old Password</label>	
	<input type="password" name="op" id="op" />
	<br>
	<label for="np">New Password</label>	
	<input type="password" name="np" id="np" />
	<br>
	<label for="cnp">Confirm New Password</label>	
	<input type="password" name="cnp" id="cnp" />
	<br>
	<input type="button" id="change_pass" value="Change Password">	
	
</form>
</div>

<script type="text/javascript" src="<?php echo base_url()."JS/jqueryui.js"?>"></script>
<script type="text/javascript" src="<?php echo base_url()?>JS/change_pass.js"></script>

</body>
</html>