<?php
class Main extends CI_Controller{
	
	private $PREFIX;
	private $USER_LEVEL;
	private $user_level;
	private $logged_in;
	private $lastname;
	
	private $sys_access = false;
	
	//source
	private $source;
	
	public function Main(){
		parent::__construct();
		
		$this->logged_in = $this->session->userdata('logged_in');
		$this->user_level = $this->session->userdata('user_level');
		$this->user_id = $this->session->userdata('user_id');
		$this->lastname = $this->session->userdata('lastname');
		$this->PREFIX = $this->session->userdata('prefix');
		
		if($this->logged_in != 0 and $this->user_level != 1){
			$this->sys_access = true;
		}
		
		
	}
	
	public function index(){
		if(empty($this->PREFIX)){
			redirect("Home");
		}else{
			$data['head'] = "Home";
			$data['company'] = $this->session->userdata('company_name');
			$data['show_admin'] = true;
			$data['lastname'] = "Guest";
			
			$this->load->model("Model_companies");
			$data['prefix'] = $this->session->userdata('prefix');
			$data['user_level'] = $this->USER_LEVEL;
			

			$data['terminals'] = $this->Model_companies->all_terminals($data);
			
			//print_r($data['terminals']->result());
			
			$this->load->view("view_header");
			$this->load->view("view_menu", $data);
			$this->load->view("view_company_home", $data);
		}
		
	}
	
	public function admin(){
		if ($this->sys_access == true){
			$this->dashboard();
		}else{
			$this->login();
		}
	}
	
	public function dashboard(){
		$data['head'] = "Dashboard";
		$data['admin_home'] = true;
		$data['user_level'] = $this->user_level;
		$data['lastname'] = $this->lastname;
		$this->load->view("view_header", $data);
		$this->load->view("view_menu", $data);
		$this->load->view("view_admin");
	}
	
	public function login(){
		$data['user_level'] = "other";
		$data['company'] = $this->session->userdata('company_name');
		$this->load->view("view_header");
		$this->load->view("view_login",$data);
	}
	
	
}
?>