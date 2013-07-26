<?php

class Home extends CI_Controller{
	
	function Home(){
		parent::__construct();
	}
	
	public function index(){
		$data['head'] = "Home";
		
		//companies
		$data['terminal_start'] = $this->start_terminals();
		$data['terminal_end'] = $this->end_terminals();
		//check whether user is logged in
		
		$logged_in = $this->session->userdata("logged_in");

		$data['lastname'] = "Guest";
		
		if(empty($logged_in) || $logged_in != 1){
			$this->load->view("view_head");
		}else{
			$this->load->view("view_header");
		}
		
		//$this->load->view("view_menu", $data);
		$this->load->view("view_main_home",$data);
		$this->load->view("view_footer");
	}
	
	private function companies(){
		$this->db->select("company_name,db_prefix");
		$res = $this->db->get("companies");
		return $res;
	}
	
	private function start_terminals(){
		$this->db->select("db_prefix");
		$q1 = $this->db->get("companies");
		$arr[0] = "";
		foreach($q1->result() as $index=>$value){
			$this->db->select("terminal_start");
			$res = $this->db->get($value->db_prefix."_routes");
			
			foreach ($res->result() as $value2){
				$terminal = $this->terminal_name($value2->terminal_start, $value->db_prefix);
				$arr[$terminal] = $terminal;
			}
			echo "<br>";
			//$this->db->select("terminal_name");
			//$this->db->join($value->db_prefix.'_routes', $value->db_prefix.'_routes.terminal_start = '.$value->db_prefix.'_terminals.id');
			//$q = $this->db->get($value->db_prefix.'_terminals');
			
			//foreach($q->result() as $v){
				//$arr[$v->terminal_name]=$v->terminal_name;
			//}
			
			//
		}
		//print_r($arr);
		return $arr;
	}
	
	private function terminal_name($id,$prefix){
		$this->db->select("terminal_name");
		$this->db->where("id",$id);
		$res = $this->db->get($prefix."_terminals");
		
		foreach($res->result() as $val){
			return $val->terminal_name;
		}
	}
	private function end_terminals(){
		$this->db->select("db_prefix");
		$q1 = $this->db->get("companies");
		$arr[0] = "";
		foreach($q1->result() as $value){
			$this->db->select("terminal_name");
			$this->db->join($value->db_prefix.'_routes', $value->db_prefix.'_routes.terminal_end = '.$value->db_prefix.'_terminals.id');
			$q = $this->db->get($value->db_prefix.'_terminals');
				
			foreach($q->result() as $v){
				$arr[$v->terminal_name]=$v->terminal_name;
			}
			//print_r($arr);
			
		}
		return $arr;
	}
	
	private function terminals(){
		//get db prefixes
		$this->db->select("db_prefix");
		$q1 = $this->db->get("companies");
		
		$myquery = "";
		$c = 0;
		
		foreach ($q1->result() as $index=>$value){
			if($c != 0){
				$myquery .= " UNION ";
			}
			
			$myquery .= "select terminal_name from ".$value->db_prefix."_terminals ";
			
			$c++;
	
		}
		$myquery .= " order by terminal_name";
		
		$q2 = $this->db->query($myquery);
		
		return $q2;
	}
	
	public function get_teminal_two(){
		$data['terminal1'] = trim(xss_clean($_POST['terminal1']));
		
		//select db prefixes
		$this->db->select("db_prefix");
		$q = $this->db->get("companies");
		
		foreach ($q->result() as $value){
			$this->db->select("id");
			$this->db->where("terminal_name",$data['terminal1']);
			$res = $this->db->get($value->db_prefix."_terminals");
			
			foreach ($res->result() as $value2){
				//get destination terminal
			}
		}
	}
	
}

?>