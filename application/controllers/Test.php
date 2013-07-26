<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Test extends CI_Controller{
	
	public function Test()
	{
		parent::__construct();
	}
	
	public function index()
	{	
		
		$date = "12/07/2012";
		$time = "07:00:00";
		//$bus = $data['bus'];
		//$route = $data['route'];
		//$prefix = $data['prefix'];
		
		$date_array = explode("/",$date);
		$time_array = explode(":",$time);
		print_r($date_array);
		$d = $date_array[1];
		$m = $date_array[0];
		$y = $date_array[2];
		$h = $time_array[0];
		$min = $time_array[1];
		$s = $time_array[2];
		
		echo "Date 1: ".$date." ".$time;
		echo "<br>";
		
		$timestamp = mktime($h,$min,$s,$m,$d,$y);
		echo "Date 2: ";
		echo date("d-M-Y h:m:d","1420171200");
	}
	public function dashboard()
	{	
		$data['head'] = "Dashboard";
		$this->load->view("view_header");
		$this->load->view("view_menu", $data);
		$this->load->view("view_admin");
	}
	public function create_admin()
	{	
		$data['head'] = "Create Company Admin";
		$this->load->view("view_header");
		$this->load->view("view_menu", $data);
		$this->load->view("view_create_admin");
	}
	public function create_comp()
	{	
		$data['head'] = "Create Company";
		$this->load->view("view_header");
		$this->load->view("view_menu", $data);
		$this->load->view("view_create_company");
	}
	public function create_user()
	{
		$data['head'] = "Create User";
		$this->load->view("view_header");
		$this->load->view("view_menu", $data);
		$this->load->view("view_create_users");
	}
	public function cust_login()
	{	
		$data['head'] = "";
		$this->load->view("view_header_login");
		$this->load->view("view_menu", $data);
		$this->load->view("view_cust_login");
	}
	public function login_validation(){
	
		$data['password'] = sha1($this->input->post('password'));
		$data['username'] = $this->input->post('username');
		
		$this->load->model("Model_login");
		$auth = $this->Model_login->cust_auth($data);
		
		
		if($auth->num_rows() == 1){
			 //echo json_encode($auth->result());
			
			//echo $cut['STATUS'] = "1";
			//echo $cut['MESSAGE'] = "logged in";
			//echo json_encode($cut);
			
			echo "{\"STATUS\":\"1\"}";
			
		
		} else {
			echo "{\"STATUS\":\"0\"}";
		}
		
	}
	
	public function reg_cust(){
		$data['head'] = "Customer Registration";
		$this->load->view("view_header_login");
		$this->load->view("view_menu", $data);
		$this->load->view("view_reg_cust");
	}
	public function reg_cust_post(){
		
		$key = md5(uniqid());
		
		$this->load->library('email');
		
		$config['protocol']    = 'smtp';
        $config['smtp_host']    = 'ssl://smtp.gmail.com';
        $config['smtp_port']    = '465';
        $config['smtp_timeout'] = '7';
        $config['smtp_user']    = 'oscarpalmer9@gmail.com';
        $config['smtp_pass']    = 'October2';
        $config['charset']    = 'utf-8';
        $config['newline']    = "\r\n";
        $config['mailtype'] = 'html'; // or html
        $config['validation'] = TRUE; // bool whether to validate email or not      

        $this->email->initialize($config);

		$name = $this->input->post('firstname');
		$name2 = $this->input->post('lastname');
		
		$this->load->model("Model_login");
		
		$this->email->from('oscarababu@yahoo.com', "TravelIQ");
		$this->email->to($this->input->post('email'));
		$this->email->subject("Confirm Your Account");
		
		$message = "<p>Thank You for Signing Up $name $name2 ";
		$message .= "<a href='".base_url()."Test/register_user/$key'>Click Here</a>to confirm your account</p>";
		
		$this->email->message($message);
		
		if($this->Model_login->add_temp_user($key)){
			if($this->email->send()){
				echo "Email Sent, Check your Email Address for confirmation";
				//echo $this->email->print_debugger();
			} else{
				echo "Could not send Mail";
			}
		
		}else{
			echo "Problem Adding To database";
		}
	}
	
	public function register_user($key){
		$this->load->model('Model_Login');
		if($this->Model_Login->is_key_valid($key)){
			//echo "Valid Key";
			
			if($new = $this->Model_Login->add_user($key)){
				
				$show = "{\"STATUS\":\"1\"}";
				redirect('Test/cust_login');
				
			} else {
				echo "Failed to add user, please try again";
			}
			
		}else{
			echo "Invalid Key";
		}
		
	}
	
	public function search_bus(){
	
		 $search['from'] = $this->input->post('from');
		 $search['to'] = $this->input->post('to');
		 $search['dep_date'] = $this->input->post('dep_date');
		 $search['time'] = $this->input->post('time');
		 
		 $this->load->model('Model_booking');
		 $this->load->Model_booking($search);
		 
		 
	}
	public function gen(){
		 $e = $this->input->post('seats');
		 
		 for($i=1; $i<= $e; $i++ ){
		 
		 $r = rand(10,100);
		 $no = $r.$i;
		 
		$this->load->model('Model_Login');
		
		if($this->Model_Login->seats_id($no)){
		echo "Truuuuue";
		
		}else{
		echo "Telling a lie";
		}
		
		 
		 }
		 
	
	}
	public function authenticate(){
		$cred['password'] = sha1($this->input->post('password'));
		$cred['username'] = $this->input->post('username');
		$this->load->model('Model_Login');
		if($this->Model_Login->auth_cred($cred))
		{
		 echo "{\"STATUS\":\"1\"}";
		 
		}else{
			echo "{\"STATUS\":\"0\"}";
		}
		
	}
	public  function seat_layout(){
		$this->load->model('Model_Seats');
		$bus['bus_id'] = 1;
		
		$data['seats'] = "<input type = 'hidden' name='bus_id' id='bus_id' value='$bus[bus_id]' />";
		//get number of rows from db
		$bus['rows'] = 7;
		$bus['the_limit']= 0;
		$row1 = $this->Model_Seats->get_seats($bus);
		
		$data['seats'] .= "<table>";
		
		$data['seats'] .= "<tr><td></td>";
		foreach ($row1 as $r1){
			$data['seats'] .= "<td><input type='button' class='seats' id='$r1[seat_id]' value='$r1[seat_no]' /></td>";
		}
		$data['seats'] .= "</tr>";
		
		//echo json_encode($row1);
		
		//echo "<hr>";
		
		$bus['rows'] = 7;
		$bus['the_limit']= 7;
		$row2 = $this->Model_Seats->get_seats($bus);
		
		$data['seats'] .= "<tr><td></td>";
		foreach ($row2 as $r2){
			$data['seats'] .= "<td><input type='button' class='seats' id='$r2[seat_id]' value='$r2[seat_no]' /></td>";
		}
		$data['seats'] .= "</tr>";
		
		//echo json_encode($row2);
		
		//echo "<hr>";
		
		$bus['rows'] = 1;
		$bus['the_limit']= 14;
		$row3 = $this->Model_Seats->get_seats($bus);
		
		$data['seats'] .= "<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td>";
		foreach ($row3 as $r3){
			$data['seats'] .= "<td><input type='button' class='seats' id='$r3[seat_id]' value='$r3[seat_no]' /></td>";
		}
		$data['seats'] .= "</tr>";
		//echo json_encode($row3);
		
		//echo "<hr>";
		
		$bus['rows'] = 8;
		$bus['the_limit']= 16;
		$row4 = $this->Model_Seats->get_seats($bus);
		$cell = 1;
		$data['seats'] .= "<tr>";
		foreach ($row4 as $r4){
			if($cell != 3){
				$data['seats'] .= "<td><input type='button' class='seats' id='$r4[seat_id]' value='$r4[seat_no]' /></td>";
			}else{
				$data['seats'] .= "<td></td>";
			}
			
			$cell++;
		}
		$data['seats'] .= "</tr>";
		//echo json_encode($row4);
		
		
		//echo "<hr>";
		
		$bus['rows'] = 8;
		$bus['the_limit']= 24;
		$row5 = $this->Model_Seats->get_seats($bus);
		$cell = 1;
		
		$data['seats'] .= "<tr>";
		foreach ($row5 as $r5){
			if($cell != 3){
				$data['seats'] .= "<td><input type='button' class='seats' id='$r5[seat_id]' value='$r5[seat_no]' /></td>";
			}else{
				$data['seats'] .= "<td></td>";
			}
			
			$cell++;
		}
		$data['seats'] .= "</tr>";
		//echo json_encode($row5);
		
		//$bus['rows'] = 7;
		///$bus['the_limit']= $bus['rows'] + 1;
		//$row1 = $this->Model_seats->get_seats($bus);
		
		//$bus['rows'] = 1;
		//$row1 = $this->Model_seats->get_seats($bus);
		
		//$bus['rows'] = 7;
		//$row1 = $this->Model_seats->get_seats($bus);
		
		//$bus['rows'] = 7;
		//$row1 = $this->Model_seats->get_seats($bus);
		$data['seats'] .= "</table>";
		
		return $data['seats'];
	}
	
	public function seat()
	{
		
		$data['seats'] = $this->seat_layout();
		
		
		$data['head'] = "";
		$this->load->view("view_header_login");
		$this->load->view("view_menu", $data);
		$this->load->view("view_seat", $data);
	}
	
	public function booked_seats(){
		
		$this->load->model('Model_Seats');
		$bus_id = $_POST['bus_id'];
		$seat = $this->Model_Seats->check_seats_booking($bus_id);
		
		echo json_encode($seat->result());
	}
	
	public function save_seats(){
		$this->load->model('Model_Seats');
		$id['bus_id'] = $_POST['bus_id'];
		$id['id'] = $_POST['id'];
		$save = $this->Model_Seats->save_seats_booking($id);
		
		if ($save == 1){
			$status['status'] = "1";
		}else{
			$status['status'] = "0";
		}
		
		echo json_encode($status);
	}
	
	public function pass(){
		$data['head'] = "";
		$this->load->view("view_header");
		$this->load->view("view_menu", $data);
		$this->load->view("view_pass");
		
	}
	
	public function pass_recovery(){
		
		$hold['id'] = $_POST['id_num'];
		$hold['email'] = $_POST['email'];
		print_r($hold);
	}

}

?>