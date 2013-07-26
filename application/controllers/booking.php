<?php
class Booking extends CI_Controller{
	public function Booking(){
		parent::__construct();
		$this->load->model("Model_booking");
		
	}
	
	public function book(){
		$logged_in = $this->session->userdata("logged_in");
		
		$data['lastname'] = "Guest";
		
		if(empty($logged_in) || $logged_in != 1){
			$this->load->view("view_header_login");
		}else{
			$this->load->view("view_header");
		}
		
		$this->load->view("view_menu", $data);
		$this->load->view("view_book",$data);
	}
	
	public function search(){
		$data['t1'] = trim(xss_clean($_POST['terminal1']));
		$data['t2'] = trim(xss_clean($_POST['terminal2']));
		$data['td'] = trim(xss_clean($_POST['travel_date']));
		//get prefixes first
		$weekday = date('D', strtotime($data['td']));
		//echo $weekday;
		$this->db->select("db_prefix");
		$q1 = $this->db->get("companies");
		$json = "";
		$string = "[";
		$c = 0;
		foreach($q1->result() as $v1){
			
			//get terminal ids
			$t1 = $this->get_terminal_id($data['t1'], $v1->db_prefix);
			$t2 = $this->get_terminal_id($data['t2'], $v1->db_prefix);
			
			if(!empty($t1) && !empty($t2)){
				//get routes
				$this->db->select("id,description,distance");
				$this->db->where("terminal_start",$t1);
				$this->db->where("terminal_end",$t2);
				$res = $this->db->get($v1->db_prefix."_routes");
				
				if($res->num_rows() != 0){
					foreach($res->result() as $v2){
						//echo $v2->description;
						//echo $v2->id;	
						//get schedules from the timetable
						$this->db->select("start_time,bus_id,fare");
						$this->db->where("day_desc",$weekday);
						$this->db->where("route_id",$v2->id);
						$rest = $this->db->get($v1->db_prefix."_timetable");
						//echo "Found ".$rest->num_rows();
						
						if($rest->num_rows() > 0){
							
							
							foreach($rest->result() as $index=>$v3){
								
								//check whether the instance has been startted
								$trip_data['time']=$v3->start_time;
								$trip_data['date']=$data['td'];
								$trip_data['bus']=$v3->bus_id;
								$trip_data['route']=$v2->id;
								$trip_data['prefix']=$v1->db_prefix;

								$trip_res = $this->check_trip_instance($trip_data);
								
								if($trip_res->num_rows() != 0){
									foreach ($trip_res->result() as $tv){
										///get bus information
										$trip = $tv->id;
									}
								}else{
									$trip = "new";
								}
								
								if($c != 0){
									$string .= ",";
								}
								$string .= "{";
								$string .= '"company":"'.$v1->db_prefix.'"';
								$string .= ",";
								$string .= '"desc":"'.$v2->description.'"';
								$string .= ",";
								$string .= '"date":"'.$trip_data['date'].'"';
								$string .= ",";
								$string .= '"time":"'.$v3->start_time.'"';
								$string .= ",";
								$string .= '"bus":"'. $v3->bus_id.'"';
								$string .= ",";
								$string .= '"fare":"'.$v3->fare.'"';
								$string .= ",";
								$string .= '"trip":"'.$trip.'"';
								$string .= ",";
								$string .= '"route_id":"'.$trip_data['route'].'"';
								//$json[$v1->db_prefix]['description'] = $v2->description;
								//$json[$v1->db_prefix]['start_time'] = $v3->start_time;
								//$json[$v1->db_prefix]['bus_id'] = $v3->bus_id;
								//$json[$v1->db_prefix]['fare'] = $v3->fare;
								$string .= "}";
								$c++;
							}
							
						}
					}
				}
				
			}
		}
		
		$string .= "]";
		
		$j = json_decode($string);
		
		//order result by time
		$s = @$this->subval_sort($j,'time');
		
		echo json_encode($s);
		
		//echo $string;
	}
	
	function check_trip_instance($data){

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
		//echo $timestamp;

		$this->db->select('id');
		$this->db->where("trip_date_time",$timestamp);
		$this->db->where("bus_id",$bus);
		$this->db->where("route_id",$route);
		
		$res = $this->db->get($prefix."_trip");
		
		return $res;
	}
	
	function subval_sort($a,$subkey) {
		foreach($a as $k=>$v) {
			$b[$k] = strtolower($v->$subkey);
		}
		asort($b);
		foreach($b as $key=>$val) {
			$c[] = $a[$key];
		}
		return $c;
	}
	
	private function get_terminal_id($name,$prefix){
		$this->db->select("id");
		$this->db->where("terminal_name",$name);
		$res = $this->db->get($prefix."_terminals");
		foreach ($res->result() as $v){
			return $v->id;
		}
	}
	
	private function initialize($company){
		
		$now = time();
		//echo date('Y-m-d H:i:s',$now);
		
		//five minutes later
		//echo "Five Minutes later<br>";
		
		$now = $now - 5*60;
		$timestamp =  date('Y-m-d H:i:s',$now);
		//$this->db->select();
		//$this->db->where('date_created <', $timestamp);
		//$this->db->delete($company['prefix'].'_booked_seats');


		//$num = $this->db->affected_rows();
		
	}
	
	function start_booking(){
		//get post values
		$data['prefix'] = trim(xss_clean($_POST['company']));
		
		//REMOVE UNBOOKED SEATS
		$now = time();
		$now = $now - 25*60;
		$timestamp =  date('Y-m-d H:i:s',$now);
		$this->db->where('date_created <', $timestamp);
		$this->db->where('status', 1);
		$this->db->delete($data['prefix'].'_booked_seats');
		
		//check if user is logged in and create temporary id 
		$user = $this->session->userdata("passenger");
		if (empty($user) or $user == false){
			$session_id = $this->session->userdata("session_id");
			
			$this->db->set('session_id',$session_id);
			
			
			$this->db->insert("temp_users");
			$id = $this->db->insert_id();
			$userdata = array("passenger"=>$id,"type"=>"temp");
			$this->session->set_userdata($userdata);
		}
		
		$data['bus'] =  trim(xss_clean($_POST['bus']));
		$data['trip'] =  trim(xss_clean($_POST['trip']));
		$data['route'] =  trim(xss_clean($_POST['route']));
		$data['date'] =  trim(xss_clean($_POST['date']));
		$data['time'] =  trim(xss_clean($_POST['time']));
		//get company name
		$company_name = $this->Model_booking->get_company_name($data['prefix']);
		foreach ($company_name->result() as $c_res){
			$json['company_name'] = $c_res->company_name;
		}
		
		//get bus buscode
		$bus_code = $this->Model_booking->get_bus_code($data['bus'],$data['prefix']);
		foreach ($bus_code->result() as $b_value){
			$json['bus'] = $b_value->bus_code;
		}
		
		//register trip if its not there
		if($data['trip'] == "new"){
			$json['trip'] = $this->Model_booking->register_trip($data);
		}else{
			$json['trip'] = $data['trip'];
		}
		
		//return results
		echo json_encode($json);
	}
	
	function check_cust_exist(){
		$data['fname'] = trim(xss_clean($_POST['fname']));
		$data['email'] = trim(xss_clean($_POST['email']));
		$data['lname'] = trim(xss_clean($_POST['lname']));
		$data['idnum'] = trim(xss_clean($_POST['idnum']));
		$data['prefix'] = trim(xss_clean($_POST['prefix']));
		$data['mobile'] = trim(xss_clean($_POST['mobile']));
		//$this->db->select("*");
		$data['session_id'] = $this->session->userdata("session_id");
		$data['type'] = $this->session->userdata("type");
		
		$this->db->select("*");
		$this->db->where("email",$data['email']);
		$this->db->or_where("id_num",$data['idnum']);
		
		$res = $this->db->get("all_users");
		
		$json['fname'] = $data['fname'];
		$json['lname']= $data['lname'];
		$json['idnum'] = $data['idnum'];
		
		if($res->num_rows() == 1){
			//update bookings to reflect the user id
			
			//get id
			foreach($res->result() as $res){
				$passanger_id = $res->id;
				
				$json['fname'] = $res->firstname;
				$json['lname']= $res->lastname;
			}
			
			//update
			
			$update_data = array(
					'passenger_id' => $passanger_id,
			);
			$this->session->set_userdata($update_data);

			$this->db->where('passenger_id', $data['session_id']);
			$this->db->update($data['prefix'].'_booked_seats', $update_data);
			//
			
			//delete from temporary users
			$this->delete_temp($data);
			
			$json['status'] = "exists";
		}else{
			//add the user in the system and update session values in the db
			$id = $this->add_passager($data);
			
			//update db values
			$update_data = array(
					'passenger_id' => $id,
			);
			$this->session->set_userdata($update_data);
			
			$this->db->where('passenger_id', $data['session_id']);
			$this->db->update($data['prefix'].'_booked_seats', $update_data);
			
			//delete from temp users
			$this->delete_temp($data);
			
			$json['status'] = "not exists";
		}
		$json['passenger_id']= $this->session->userdata("passenger_id");
		echo json_encode($json);
	}
	
	function delete_temp($data){
		$sid = $data['session_id'];
		$prefix = $data['prefix'];
		
		$this->db->where("session_id",$sid);
		$this->db->delete("temp_users");
	}
	
	function add_passager($data){
		$fname = $data['fname'];
		$email = $data['email'];
		$lname = $data['lname'];
		$idnum = $data['idnum'];
		$prefix = $data['prefix'];
		$mobile = $data['mobile'];
		
		$this->db->set("firstname",$fname);
		$this->db->set("lastname",$lname);
		$this->db->set("id_num",$idnum);
		$this->db->set("user_group",0);
		$this->db->set("email",$email);
		$this->db->set("mobilenumber",$mobile);
		
		$this->db->insert("all_users");
		
		return $this->db->insert_id();
	}
	
	function complete_booking(){

		$data['prefix'] = trim(xss_clean($_POST['prefix']));
		$data['trip'] = trim(xss_clean($_POST['trip']));
		$data['payment_type'] = trim(xss_clean($_POST['payment_type']));
		$data['payment_amount'] = trim(xss_clean($_POST['payment_amount']));
		//$data['required_amount'] = trim(xss_clean($_POST['required_amount']));
		$data['passenger'] = trim(xss_clean($_POST['passenger']));
		$data['bus_no'] = trim(xss_clean($_POST['bus_no']));
		
		//echo json_encode($data);
		
		$receipt= $data['bus_no']. "-".$data['trip']."-";
		
		$this->db->set("passenger",$data['passenger']);
		$this->db->set("uuser","");
		$this->db->set("payment_type",1);
		$this->db->set("amount",$data['payment_amount']);
		$this->db->set("payment_method",$data['payment_type']);
		$this->db->set("trip",$data['trip']);
		
		$this->db->insert($data['prefix']."_transactions");
		
		$ins_id = $this->db->insert_id();
		$receipt .= $ins_id;
		$update_data = array("receipt_no"=>$receipt);
		$this->db->where("id",$ins_id);
		$this->db->update($data['prefix']."_transactions",$update_data);
		
		//update seats data
		$data['num_seats'] = $this->update_seats($data);
		
		$res = $this->trip_details($data);
		$data['date_now'] = date("d-M-Y h:d:s");
		$data['travel_date'] = date("d-M-Y h:d:s",$res['date_time']);;
		$data['route'] = $res['route'];
		
		//get customer detaiils
		
		$cust_details = $this->passenger_details($data);
		
		$data['firstname'] = $cust_details['firstname'];
		$data['lastname']= $cust_details['lastname'];
		
		$data['receipt'] = $receipt;
		echo json_encode($data);
	}
	
	function update_seats($data){
		$update_array = array("status"=>2);
		$this->db->where("trip_id",$data['trip']);
		$this->db->where("passenger_id",$data['passenger']);
		$this->db->update($data['prefix']."_booked_seats",$update_array);
		$num = $this->db->affected_rows();
		return $num;
	}
	
	function trip_details($data){
		$this->db->select("route_id,trip_date_time");
		$this->db->where("id",$data['trip']);
		$res = $this->db->get($data['prefix'].'_trip');
		
		foreach($res->result() as $value){
			$d['date_time'] = $value->trip_date_time;
			
			$this->db->select("description");
			$this->db->where("id",$value->route_id);
			$res2 = $this->db->get($data['prefix'].'_routes');
			foreach($res2->result() as $value2){
				$d['route'] = $value2->description;
			}
		}
		
		return $d;
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
		
		return $cust;
	}
		
}
?>