<?php
	if(!isset($page)){
		$page = "";
	}
	
	$items = $this->session->all_userdata();
	//echo $head;
	$this->mymenu->get_menu($items,$page);
	
?>