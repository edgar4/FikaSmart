<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<?php 
	//get the base URL and pass it in a Javascript Variable
		echo "<script type=\"text/javascript\">";
		echo "var serverURL = '".base_url()."index.php/'";
		echo "</script>";
	?>
	<link rel="stylesheet" href="<?php echo base_url();?>Styles/general.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<?php echo base_url();?>Styles/table.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<?php echo base_url();?>css/smoothness/jquery-ui-1.9.1.custom.css" type="text/css">
	
    <script type="text/javascript" src="<?php echo base_url(); ?>JS/jquery.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>JS/login.js"></script>
	<title>Travel IQ </title>
</head>
<body>

<div class="topper">
<?php
	 	
		echo anchor("Home/index","Log Out");
		echo anchor("","|");
		echo anchor("","Company");
		echo anchor("","|");
		echo anchor("Home/index","Home")
	?> 
</div>


<div id="container">