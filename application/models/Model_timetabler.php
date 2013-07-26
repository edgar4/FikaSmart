<?php

class Model_timetabler extends CI_Model{
	
	function Model_timetabler(){
		parent::__construct();
	}
	
	function get_specific_routes($data){
		$prefix = $data['prefix'];
		$terminal = $data['terminal'];
		
		$this->db->where("terminal_start",$terminal);
		$res = $this->db->get($prefix."_routes");
		
		foreach ($res->result() as $d){
			$m = $this->get_terminal_name($prefix, $d->terminal_start);
		}
	}
	
	private function get_terminal_name($prefix,$id){
		$this->db->select('terminal_name');
		 
		$this->db->where('id',$id);
		 
		$ts_res = $this->db->get($prefix."_terminals");
		 
		foreach ($ts_res->result() as $value){
			return $value->terminal_name;
		}
	}
	
	function save_timetable($data){
		
		$this->db->set('bus_id', $data['bus']);
		$this->db->set('route_id', $data['route']);
		$this->db->set('start_time', $data['start_time'] );
		$this->db->set('fare', $data['fare']);
		$this->db->set('start_terminal', $data['start_terminal']);
		$this->db->set('day_desc', $data['day']);
		$this->db->set('conductor', $data['conductor']);
		$this->db->set('driver', $data['driver']);
		
		$prefix = $data['prefix'];

		
		
		
		$res = $this->db->insert($prefix.'_timetable');
		return $res;
	}
	
}

?>