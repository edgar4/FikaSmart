<?php

class Reports extends CI_Controller{
	public function Reports(){
		parent::__construct();
	}
	
	function index(){
		$prefix = $this->session->userdata("prefix");
		echo $prefix;
	}
}

?>