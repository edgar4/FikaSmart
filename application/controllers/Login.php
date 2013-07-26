<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller{
	public function Login(){
		parent::__construct();
		
		$this->load->model("Model_login");
	}
	
	public function auth(){
		//sleep(5);
		$login_data['username'] = xss_clean($_POST['email']);
		
		$password = xss_clean($_POST["password"]);
		
		$login_data['password'] = do_hash($password);// create sha1
		
		
		$res = $this->Model_login->auth($login_data);
		
		
		if($res->num_rows() == 1){
			
			foreach ($res->result() as $data){
				$newdata = array(
						'user_level'  => $data->user_group,
						'user_id'     => $data->id,
						'lastname'     => $data->lastname,
						'company_id'     => $data->company,
						'change_pass'     => $data->pass_change,
						'logged_in' => TRUE
				);
				
				
				
				if($data->company != 0 and  $data->company != ""){
					$newdata['company_prefix'] = $this->get_company_prefix($data->company);
					$newdata['prefix'] = $newdata['company_prefix'];
					
					$newdata['company_name'] = $this->get_company_name($data->company);
				}else{
					$newdata['company_prefix'] = "Dummy prefix";
					$newdata['company_name'] = "";
				}
	
			}
			$this->session->set_userdata($newdata);
			
			$ans['status'] = "1";
			$ans['message'] = "Logged in";
			
			echo json_encode($ans);
		}else{
			$ans['status'] = "0";
			$ans['message'] = "Logged Out";
				
			echo json_encode($ans);
		}
		
	}
	public function logout(){
		$this->session->sess_destroy();
		redirect('Home');
	}
	

	//testing controllers functionality
	public function test(){
		$newdata = array(
				'user_level'  => 'johndoe',
				'user_id'     => 'johndoe@some-site.com',
				'logged_in' => FALSE
		);
		
		$this->session->set_userdata($newdata);
		//redirect("Admin");
		
	}
	
	private function get_company_prefix($id){
		$this->db->select("db_prefix,company_name");
		$this->db->where("id",$id);
		$res = $this->db->get("companies");
		
		foreach($res->result() as $r){
			return $r->db_prefix;
		}
	}
	private function get_company_name($id){
		$this->db->select("company_name");
		$this->db->where("id",$id);
		$res = $this->db->get("companies");
	
		foreach($res->result() as $r){
			return $r->company_name;
		}
	}
}