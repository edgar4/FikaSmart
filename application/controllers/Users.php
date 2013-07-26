<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends CI_Controller{
	
	public function Users(){
		parent::__construct();
	
	}
	
	public function add_user(){
		$this->load->model("Model_users");
		//$form_array = $_POST['admin_form'];
		$form_data['admin_firstname'] = xss_clean($_POST['admin_firstname']);
		$form_data['admin_lastname'] = xss_clean($_POST['admin_lastname']);
		$form_data['admin_idnum'] = xss_clean($_POST['admin_idnum']);
		$form_data['admin_email'] = xss_clean($_POST['admin_email']);
		$form_data['admin_username'] = xss_clean($_POST['admin_username']);
		$form_data['admin_phone'] = xss_clean($_POST['admin_phone']);
		$form_data['admin_select_company'] = xss_clean($_POST['admin_select_company']);
		$form_data['admin_user_level'] = xss_clean($_POST['admin_user_level']);
		$form_data['admin_prefix'] = xss_clean($_POST['admin_prefix']);
		
		$form_data['password'] = $this->rand_string(10);
		
		$add_user = $this->Model_users->add_user($form_data);
		
		if($add_user == 1){
			$status['status'] = "1";
			$status['message']= "Admin Added Successfully";
			
			$status['email'] = $this->send_email($form_data);
		}else{
			$status['status'] = "0";
			$status['message']= "User Adding failed";
		}
		echo json_encode($status);
	}
	
	public function send_email($form_data){
		
		$config = Array(
				'protocol' => 'smtp',
				'smtp_host' => 'ssl://smtp.googlemail.com',
				'smtp_port' => 465,
				'smtp_user' => 'phinkoholism@gmail.com',
				'smtp_pass' => 'phineaskobia45409950',
				'mailtype'  => 'html',
				'charset'   => 'iso-8859-1'
		);
		
		$this->load->library('email', $config);
		
		$this->email->set_newline("\r\n");
	
		$this->email->from('phinkoholism@gmail.com', 'Travel IQ');
		$this->email->to($form_data['admin_email']);
		$this->email->subject('New Account');
		$message = "<p>Hi ".$form_data['admin_lastname'].",<br/>";
		$message .= "Your account has been created.</p>";
		$message .= "<p>username: ".$form_data['admin_username']."<br/>";
		$message .= "password: ".$form_data['password']."</p>";
		$this->email->message($message);
		$result = $this->email->send();
		return $result;
		//echo $this->email->print_debugger();
	}
	
	function password_recovery(){
		$this->load->view("view_header");
		$this->load->view('password_recovery');
		$this->load->view("view_footer");
	}
	function rand_string( $length ) {
		$chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	
		$size = strlen( $chars );
		for( $i = 0; $i < $length; $i++ ) {
			@$str .= $chars[ rand( 0, $size - 1 ) ];
		}
	
		return $str;
	}
	
	public function all_users(){
			$prefix = $this->session->userdata('prefix');	
			$data['prefix'] = $prefix;
			$this->load->model("Model_users");
			$users = $this->Model_users->all_users($data);
			echo json_encode($users->result());
	}
	
	public function add_company_user(){
		
		$this->load->model("Model_users");
		$data['user_id'] = xss_clean(trim($_POST['user_id']));
		$data['admin_firstname'] = xss_clean(trim($_POST['firstname']));
		$data['admin_lastname'] = xss_clean(trim($_POST['lastname']));
		$data['admin_id_num'] = xss_clean(trim($_POST['id_num']));
		$data['admin_email'] = xss_clean(trim($_POST['email']));
		$data['admin_username'] = xss_clean(trim($_POST['username']));
		$data['admin_user_level'] = xss_clean(trim($_POST['user_group']));
		$data['admin_mobilenumber'] = xss_clean(trim($_POST['mobilenumber']));
		$add_or_edit = xss_clean(trim($_POST['add_or_edit']));
		$data['admin_prefix'] = $this->session->userdata('prefix');
		$data['admin_select_company'] = xss_clean($_POST['company']);
		$data['password'] = $this->rand_string(10);
		echo json_encode($data);
		if($add_or_edit==1){
			$add_user = $this->Model_users->add_user($data);
		}else if($add_or_edit==2){
			$add_user = $this->Model_users->edit_user($data);
		}
		
		
		
		if($add_user == 1){
			$status['status'] = "1";
			$status['message']= "Success";
			$status['email'] = $this->send_email($data);
		}else{
			$status['status'] = "0";
			$status['message']= "User Adding failed";
		}
		echo json_encode($status);
	}
	
	public function edit_permissions(){
		sleep(1);
		$status['status'] = "1";
		$status['message']= "Permissions Saved Successfully";
		
		echo json_encode($status);
	}
	
	function change_pass(){
		$op = trim(xss_clean($_POST['op']));
		$np = trim(xss_clean($_POST['np']));
		$id = $this->session->userdata("user_id");
		
		$np = do_hash($np);
		$op = do_hash($op);
		
		$update_data = array(
				'pass' => $np,
				'pass_change' => 1,
		);
		 
		$this->db->where('id', $id);
		$this->db->where('pass', $op);
		
		$res = $this->db->update('all_users', $update_data);
		
		if($res){
			$json['status']="1";
			$json['message'] = "password changed";
		}else{
			$json['status']="0";
			$json['message'] = "password not changed";
		}
		
		echo json_encode($json);
	}
	
	public function account_registration(){
		$data['head'] = "Customer Registration";
		$this->load->view("view_header_login");
		$this->load->view("view_menu", $data);
		$this->load->view("view_reg_cust");
	}
	public function delete_user(){
		$data['id'] = $_POST['id'];
		$this->load->model("Model_users");
		$this->Model_users->delete_user($data);
	}
}
?>