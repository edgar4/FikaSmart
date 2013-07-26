<?php
class Model_booking extends CI_Model{
	public function Model_booking(){
		parent::__construct();
	}
	
	public function destination_terminal($data){
		$from = $data['terminal'];
		
		$this->db->select("route_id");
		$this->db->where("start_terminal",$from);
		
		$res1 = $this->db->get();
		
	}
	
	function get_company_name($prefix){
		$this->db->select("company_name");
		$this->db->where("db_prefix",$prefix);
		$res = $this->db->get("companies");
	
		return $res;
	}
	
	function get_bus_code($id,$prefix){
		$this->db->select("bus_code");
		$this->db->where("id",$id);
		$res = $this->db->get($prefix."_buses");
		return $res;
	}
	
	function register_trip($data){
		$date = $data['date'];
		$time = $data['time'];
		$bus = $data['bus'];
		$route = $data['route'];
		$prefix = $data['prefix'];
		
		$date_array = explode("/",$date);
		$time_array = explode(":",$time);
		
		$d = $date_array[1];
		$m = $date_array[0];
		$y = $date_array[2];
		$h = $time_array[0];
		$min = $time_array[1];
		$s = $time_array[2];
		
		$timestamp = mktime($h,$min,$s,$m,$d,$y);
		
		//return $timestamp.", ".$prefix.", ".$bus.", ".$route;
		
		$data = array(
				'trip_date_time' => $timestamp ,
				'bus_id' => $bus,
				'route_id' => $route
		);
		
		$this->db->insert($prefix.'_trip', $data);
		
		return $this->db->insert_id();
	}
}
?>