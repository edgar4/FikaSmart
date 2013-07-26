<?php

class Model_Seats extends CI_Model {
	
	public function Model_Seats() {
		parent::__construct ();
	}
	
	public function get_seats($data) {
		$bus_id = $data ['bus_id'];
		$lim1 = $data ['rows'];
		$lim2 = $data ['the_limit'];
		$prefix = $data['prefix'];
		$this->db->where ( 'bus_id', $bus_id );
		$this->db->limit ( $lim1, $lim2 );
		$query = $this->db->get ( $prefix.'_seats' );
		$i = 1;
		foreach ( $query->result () as $index => $r ) {
			$seats ['seat_id'] = $r->id;
			
			$status = $this->check_seat_status ( $seats );
			
			$seat_data [$index] ['seat_id'] = $r->id;
			$seat_data [$index] ['seat_no'] = $r->seat_no;
			
			if ($status->num_rows () == 0) {
				$seat_data [$index] ['status'] = 0;
			} else {
				foreach ( $status->result () as $s ) {
					$the_status = $s->status;
					$seat_data [$index] ['status'] = $the_status;
				}
			}
			$i ++;
		}
		return $seat_data;
	}
	
	private function check_seat_status($data) {
		$seat_id = $data ['seat_id'];
		
		$this->db->where ( 'seat_id', $seat_id );
		$r = $this->db->get ( 'bookings_seats' );
		return $r;

	}
	
	public function check_seats_booking($bus_id) {
		$this->db->where ( 'bus_id', $bus_id['bus_id'] );
		$this->db->where ( 'trip_id', $bus_id['trip'] );
		$qry = $this->db->get ( $bus_id['prefix'].'_booked_seats' );
		return $qry;
	}
	
	public function save_seats_booking($id) {
		$prefix = $id['prefix'];
		$this->db->where('seat_id', $id ['id']);
		$this->db->where('trip_id', $id ['trip']);
		$q1 = $this->db->get($prefix.'_booked_seats');
		
		
		
		if($q1->num_rows() == 0){
			$this->db->set ( 'seat_id', $id ['id'] );
			$this->db->set ( 'status', 1 );
			$this->db->set ( 'bus_id', $id ['bus_id'] );
			$this->db->set ( 'trip_id', $id ['trip'] );
			if($this->session->userdata("type") == "temp"){
				$this->db->set ( 'passenger_id', $this->session->userdata("session_id") );
			}else{
				$this->db->set ( 'passenger_id',  $this->session->userdata("passenger")  );
			}
			
	
			$qry = $this->db->insert($prefix.'_booked_seats' );
			
			return 1;
		}else{
			return 0;
		}
		
		
	}
}

?>