<?php
class Url extends CI_Controller{
	private $PREFIX;

	private $url;
	private $function;
	private $auth = false;
	private $company_name;
	
	public function Url(){
		parent::__construct();
		
		$this->url = $this->uri->segment(1);
		$this->function = $this->uri->segment(2);
		
		
		$this->db->select("company_name");
		$this->db->where("db_prefix",$this->url);
		
		$res = $this->db->get("companies");
		
		if($res->num_rows() == 1){
			$this->auth = true;
			$this->PREFIX = $this->url;
			
			foreach ($res->result() as $r){
				$this->company_name = $r->company_name;
			}
			
			$newdata = array(
					'prefix'  => $this->PREFIX,
					'company_name' => $this->company_name
			);
			
			$this->session->set_userdata($newdata);	
		}
	}
	
	public function index(){
		if($this->auth == true){
			if(!empty($this->function)){
				redirect("Main/".$this->function);
			}else{
				redirect("Main");
			}
		}else{
			$this->my404();
		}
		
	}
	
	public function my404(){
		$data['user_level'] = "other";
		$this->load->view("view_header");
		$this->load->view("view_my_errorpage",$data);
	}
	
}

?>