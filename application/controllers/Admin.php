<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller{
	
	//private $level;//for selecting database to log in
	private $source;//to evaluate whether the source is web or not
	
	private $logged_in;
	private $user_level;
	private $user_id;
	private $lastname;
	private $sys_access = false;
	
	public function Admin(){
		parent::__construct();
		
		//@$this->level = xss_clean($_POST['level']);
		@$this->source = xss_clean($_POST['source']);
		
		
		$this->logged_in = $this->session->userdata('logged_in');
		$this->user_level = $this->session->userdata('user_level');
		$this->user_id = $this->session->userdata('user_id');
		$this->lastname = $this->session->userdata('lastname');
		
		if($this->logged_in == "" or $this->logged_in == 0){
			if($this->source == ""){
				redirect("Home");
				
			}else{
				
				$response['status'] = "0";
				$response['logged_in'] = "0";
				$response['message'] = "You are not logged in";
				
				echo json_encode($response);
			}
		}else{
			//set access to true
			$this->sys_access = true;
		}
		
	}
	
	function index(){
		if($this->logged_in == true){
			$this->dashboard();
		}
		
		
	}
	
	public function dashboard(){
		$data['head'] = "Dashboard";
		$data['page'] = "Dashboard";
		$data['admin_home'] = true;
		$data['user_level'] = 1;
		$data['lastname'] = $this->lastname;
		$this->load->view("view_header", $data);
		$this->load->view("view_menu", $data);
		$this->load->view("view_admin");
		$this->load->view("view_footer");
	}
	
	//home page for create company
	public function create_comp()
	{
		if($this->logged_in == true){
			$data['head'] = "Create Company";
			$data['page'] = "Company";
			$this->load->view("view_header");
			$this->load->view("view_menu", $data);
			$this->load->view("view_create_company");
			$this->load->view("view_footer");
		}
		
	}
	
	//insert company into the db
	public function add_company(){
		
		if($this->sys_access == true){
			
			$this->load->model("Model_companies");
			
			$data_res['status'] = "1";
			
			//$data[''] = xss_clean($_POST['']);
			
			$data['company_name'] = xss_clean($_POST['company_name']);
			$data['company_loc'] = xss_clean($_POST['company_loc']);
			$data['company_addr'] = xss_clean($_POST['company_addr']);
			$data['tel_number'] = xss_clean($_POST['tel_number']);
			$data['email_add'] = xss_clean($_POST['email_add']);
			$data['db_prefix'] = xss_clean($_POST['db_prefix']);
			$data['created_by'] = $this->session->userdata("user_id");
			
			$res = $this->Model_companies->add_company($data);
			if($res == 1){
				$data_res['progress'] = "1";
				$data_res['pref'] = $data['db_prefix'];
			}
			//echo $res;
			echo json_encode($data_res);
		}
		
	}//end add company
	
	public function edit_company(){
	
		if($this->sys_access == true){
				
			$this->load->model("Model_companies");
				
			$data_res['status'] = "1";
				
			//$data[''] = xss_clean($_POST['']);
				
			$data['company_name'] = xss_clean($_POST['company_name']);
			$data['company_loc'] = xss_clean($_POST['company_loc']);
			$data['company_addr'] = xss_clean($_POST['company_addr']);
			$data['tel_number'] = xss_clean($_POST['tel_number']);
			$data['email_add'] = xss_clean($_POST['email_add']);
			$data['company_id'] = xss_clean($_POST['company_id']);
			$data['created_by'] = $this->session->userdata("user_id");
				
			$res = $this->Model_companies->edit_company($data);
			if($res == 1){
				$data_res['progress'] = "99";
			}
			//echo $res;
			echo json_encode($data_res);
		}
	
	}
	
	public function add_db_stuff($pref){
		// duplicate tables adding prefix
		$this->load->model("Model_dbforge");
		$db_prefix = xss_clean($pref);
		
		$ans = $this->Model_dbforge->duplicate($db_prefix);
		
		echo $ans;
	}
	
	public function all_company(){
		$this->load->model("Model_companies");
		//sleep(3);
		$res = $this->Model_companies->all_companies();
		
		echo json_encode($res->result());
	}
		
}
?>