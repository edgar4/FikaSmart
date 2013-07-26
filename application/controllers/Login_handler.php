<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_handler extends CI_Controller{
	
	//private $level;//for selecting database to log in
	private $source;//to evaluate whether the source is web or not
	
	private $logged_in;
	private $user_level;
	private $user_id;
	private $lastname;
	private $change_pass;
	
	public function Login_handler(){
		parent::__construct();
		
		//@$this->level = xss_clean($_POST['level']);
		@$this->source = xss_clean($_POST['source']);
		
		
		$this->logged_in = $this->session->userdata('logged_in');
		$this->user_level = $this->session->userdata('user_level');
		$this->user_id = $this->session->userdata('user_id');
		$this->lastname = $this->session->userdata('lastname');
		$this->change_pass = $this->session->userdata('change_pass');
		
		if($this->logged_in == "" or $this->logged_in == 0){
			if($this->source == ""){
				if($this->user_level == 1){
					redirect("Admin");
				}else{
					echo "Redirect not possible at this time";
				}
				
			}else{
				$response['logged_in'] = "0";
				$response['message'] = "You are not logged in";
				
				echo json_encode($response);
			}
		}else{
			if($this->change_pass != 0){
				if($this->user_level == 1){
					redirect("Admin");
				}else if($this->user_level == 2){
					redirect("Company/Company_users");
				}else if($this->user_level == 3){
					redirect("Company/Company_users");
				}else if($this->user_level == 4){
					redirect("Company/Company_users");
				}else if($this->user_level == 5){
					redirect("Company/Company_users");
				}else if($this->user_level == 6){
					redirect("Company/Company_users");
				}else if($this->user_level == 7){
					redirect("Company/Company_users");
				}
				else if($this->user_level == 8){
					redirect("Company/Company_users");
				}else{
					echo "Redirect not possible at this time. Please contact your admin";
				}
			}else{
				$data['head'] = "";
				$this->load->view("view_header");
				$data['new']= "New";
				$this->load->view("view_menu", $data);
				$this->load->view("view_change_pass", $data);
			}
			
		}
		
	}
	function index(){
	}
}
?>