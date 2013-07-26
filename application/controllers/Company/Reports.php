<?php

class Reports extends CI_Controller{
	public function Reports(){
		parent::__construct();
	}
	
	function index(){
		$data['prefix'] = $this->session->userdata("prefix");
		//echo $prefix;
		
		$res = $this->db->get($data['prefix']."_transactions");
		$table = "<table>";
		$table .= "<tr>";
		$table .= "<th></th>";
		$table .= "<th>Receipt No.</th>";
		$table .= "<th>Amount</th>";
		$table .= "<th>Passenger</th>";
		$table .= "<th>Trip ID</th>";
		$table .= "<th>No. of Seats</th>";
		$table .= "<th>Travel Date/Time</th>";
		$table .= "<th>Route Name</th>";
		$table .= "</tr>";
		$i= 1;
		foreach($res->result() as $value){
			$data['passenger'] = $value->passenger;
			$data['trip']=$value->trip;
			$passenger = $this->passenger_details($data);
			$seats = $this->num_seats($data);
			$trip_details = $this->trip_details($data);
			
			$data['route_id'] =$trip_details['route'];
			
			$route = $this->get_route($data);
			
			$table .= "<tr>";
				$table .= "<td>$i</td>";
				$table .= "<td>$value->receipt_no</td>";
				$table .= "<td>".number_format($value->amount)."</td>";
				$table .= "<td>$passenger[firstname] $passenger[lastname]</td>";
				$table .= "<td>$value->trip</td>";
				$table .= "<td>$seats</td>";
				$table .= "<td>".date("d-M-Y h:m:s",$trip_details['date_time'])."</td>";
				$table .= "<td>$route[route]</td>";
				
			$table .= "<tr>";
			$i++;
		}
		$data['table'] = $table;
		$data['lastname'] = $this->session->userdata("lastname");
		$data['head'] = "Reports";
		$data['admin_home'] = true;
		
		$this->load->view("view_header");
		$this->load->view("view_menu", $data);
		$this->load->view("company/view_reports",$data);
		
	}
	
	function passenger_details($data){
	
		$this->db->select("firstname,lastname");
		$this->db->where("id",$data['passenger']);
		$res = $this->db->get('all_users');
		//print_r($res->result());
		foreach($res->result() as $val){
			$cust['firstname'] = $val->firstname;
			$cust['lastname'] = $val->lastname;
		}
	
		//return $cust;
	}
	
	function get_route($data){
		$this->db->select("description");
		$this->db->where("id",$data['route_id']);
		$res = $this->db->get($data['prefix']."_routes");
		
		foreach($res->result() as $val){
			$data['route'] = $val->description;
		}
		return $data;
	}
	
	function num_seats($data){
		$this->db->where("passenger_id",$data['passenger']);
		$res = $this->db->get($data['prefix']."_booked_seats");
		return $res->num_rows();
	}
	
	function trip_details($data){
		$this->db->select("*");
		$this->db->where("id",$data['trip']);
		$res = $this->db->get($data['prefix']."_trip");
		
		foreach ($res->result() as $val){
			$data['date_time'] = $val->trip_date_time;
			$data['route'] = $val->route_id;
		}
		
		return $data;
	}
	
}

?>