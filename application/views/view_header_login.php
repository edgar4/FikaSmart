<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	
	<?php 
	//get the base URL and pass it in a Javascript Variable
		echo "<script type=\"text/javascript\">";
		echo "var serverURL = '".base_url()."'";
		echo "</script>";
	?>
	
	<link rel="stylesheet" href="<?php echo base_url();?>Styles/general.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<?php echo base_url(); ?>Styles/media-queries.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<?php echo base_url();?>css/smoothness/jquery-ui-1.9.1.custom.css" type="text/css">
    <script type="text/javascript" src="<?php echo base_url()?>JS/jquery.js"></script>
    
     
     <script type="text/javascript" src="<?php echo base_url()?>JS/seats.js"></script>
    
    <!-- Auto Finish -->

	<!-- End Auto Finish -->
	
	

    
	<title>Travel IQ</title>
	
	
	
</head>
<body>
	<form action="" method="post" id="login_form" name="login_form">
		
	<?php
	 	
		echo anchor("Users/password_recovery","Forgot Password?")
	?>
	<input type="text" name="email" id="email" placeholder="Email" class= "bahati_login" style="float: right; margin-left: 10px;" />
		
	
	<input type="password"  name="password" id="password" placeholder="Password" class= "bahati_login" style="float: right; margin-left: 10px;" />
	<input type="button" class="button_login" id="button_login" value="Login" style="float: right; margin-left: 10px;" />
		
	
	</form>
<div id="container">