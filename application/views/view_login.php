	<?php 
	if(!isset($company)){
		$company = "Travel IQ";
	}
	?>
	<h1><?php echo $company; ?></h1>

	
	<div id="login">
		<div id="info">Please fill in your login details here</div>
			<form id="login_form" name ="login_form">
			<fieldset class="brown">
			<legend>Login</legend>
				<input type="hidden" name="user_level" id="user_level" value="<?php echo $user_level; ?>" />
				
				<label for="username">Username</label>
				<input type="text" name="username" id="username" placeholder="Username" />
				
				<label for="password">Password</label>
				<input type="password"  name="password" id="password" placeholder="Password" />
				
				<input type = "button" class="button" value = "Login" id="login_btn" />
			</fieldset>
			</form>
			
			
		</div>

</div>

</body>
</html>