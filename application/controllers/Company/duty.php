<?php
class Duty extends CI_Controller{
	
	private $PREFIX;
	private $USER_LEVEL;
	
	private $logged_in;
	private $lastname;
	
	private $sys_access = false;
	
	//source
	private $source;
	
	public function duty(){
		
		parent::__construct();
		$this->logged_in = $this->session->userdata('logged_in');
		$this->user_level = $this->session->userdata('user_level');
		$this->user_id = $this->session->userdata('user_id');
		$this->lastname = $this->session->userdata('lastname');
		
		$this->PREFIX = $this->lastname = $this->session->userdata('prefix');
		if($this->logged_in != 0 and $this->user_level != 1){
			$this->sys_access = true;
		}
	}
	
	public function index(){
		$data['head'] = "Dashboard";
		$data['admin_home'] = true;
		$data['lastname'] = $this->lastname;
		
		$data['user_level'] = $this->user_level;
		
		$this->load->view("view_header");
		
		$this->load->view("view_menu", $data);
		
		$this->load->view("company/view_company_users");
		
		$this->load->view("view_footer");
	}
	
	function maps(){
		$prefix = $this->session->userdata("prefix");
		$data['terminals'] = $this->db->get($prefix."_terminals");
		//print_r($data['terminals']->result());
		$this->load->view("company/view_map",$data);
	}
	
	public function dashboard(){
		$data['head'] = "Dashboard";
		$data['admin_home'] = true;
		$data['lastname'] = $this->lastname;
		$this->load->view("view_header");
		$this->load->view("view_menu", $data);
		$this->load->view("view_admin");
	}
	
	public function create_users(){
		if($this->sys_access == true){
			$data['admin_home'] = true;
			$data['lastname'] = $this->lastname;
			$data['prefix'] = $this->PREFIX;
			$data['company'] = $this->session->userdata("company_id");
			$data['head'] = "Create Users";
			$this->load->view("view_header");
			$this->load->view("view_menu", $data);
			$this->load->view("company/view_create_users");
		}
		
	}
	
	public function terminals(){
		if($this->sys_access == true){
			$data['admin_home'] = true;
			$data['lastname'] = $this->lastname;
			$data['prefix'] = $this->PREFIX;
			$data['head'] = "Create Terminal";
			$this->load->view("view_header");
			$this->load->view("view_menu", $data);
			$this->load->view("company/view_add_terminals");
		}
	
	}
	
	public function timetable(){
		if($this->sys_access == true){
			$data['admin_home'] = true;
			$data['prefix'] = $this->session->userdata("prefix");
			$this->load->model("Model_companies");
			
			$buses = $this->Model_companies->all_buses($data);
			
			$data['bus_list'] = $buses->result();
			
			
			$data['lastname'] = $this->lastname;
		
			$data['head'] = "Timetable";
			$this->load->view("view_header");
			$this->load->view("view_menu", $data);
			$this->load->view("company/view_timetable",$data);
		}
	
	}
	
	public function get_timetable(){
		$data['bus_id'] = xss_clean($_POST['bus_id']);
		$data['admin_home'] = true;
		$data['prefix'] = $this->session->userdata("prefix");
		$this->load->model("Model_companies");
		$this->load->model("Model_users");
		$timetable = $this->Model_companies->get_timetable($data);
		
		$table = "<tr>
			<th>Day</th>
			<th>Route</th>
			<th>Start Terminal</th>
			<th>Start Time</th>
			<th>ETA</th>
			<th>Fare</th>
			<th>Conductor</th>
			<th>Driver</th>
		</tr>";
		
		if($timetable->num_rows()>0){
			foreach($timetable->result() as $t){
				$table .= "<tr>";
					$table .= "<td> $t->day_desc </td>";
					$table .= "<td>".$this->Model_companies->get_route_name($data['prefix'],$t->route_id)."</td>";
					$table .= "<td>".$this->Model_companies->get_terminal_name($data['prefix'],$t->start_terminal)."</td>";
					$table .= "<td>$t->start_time</td>";
					$table .= "<td> $t->eta </td>";
					$table .= "<td> $t->fare </td>";
					$table .= "<td>".$this->Model_companies->get_users_name($data['prefix'],$t->conductor)."</td>";
					$table .= "<td>".$this->Model_companies->get_users_name($data['prefix'],$t->driver)."</td>";
				$table .= "<tr>";
			}
			
			$days = array('Mon','Tue','Wed','Thu','Fri','Sat','Sun');
			
			$data['prefix'] = $this->session->userdata("prefix");
			$routes = $this->Model_companies->all_routes($data);
				
			//set id for conductors
			$data['get'] = 5;
			$conductors = $this->Model_users->all_users($data);
				
			$data['get'] = 7;
			$drivers = $this->Model_users->all_users($data);
			
		}else{
			$days = array('Mon','Tue','Wed','Thu','Fri','Sat','Sun');
			$data['prefix'] = $this->session->userdata("prefix");
			$routes = $this->Model_companies->all_routes($data);
			
			//set id for conductors
			$data['get'] = 5;
			$conductors = $this->Model_users->all_users($data);
			
			$data['get'] = 7;
			$drivers = $this->Model_users->all_users($data);
				
		}
		
		$table .="<tr>";
			//day
			$table .="<td><select class='tt' name='day' id='day'>";
				$table .= "<option value='Day'>Day</option>";
				foreach($days as $d){
					$table .= "<option value='$d'>$d</option>";
				}
			$table .="</select></td>";
			
			//route
			$table .="<td><select class='tt' name='route' id='route' disabled='disabled'>";
			$table .= "<option value='0'>Route</option>";
			
			foreach ($routes as $r){
				$table .= "<option value='$r[id]' start_terminal='$r[terminal_start]'
				 end_terminal='$r[terminal_end]' start_terminal_id='$r[ts_id]' end_terminal_id='$r[te_id]' 
				distance='$r[distance]' duration='$r[duration]'>$r[description]</option>";
			}
			$table .= "</select></td>";
			
			//terminal
			$table .="<td><select class='tt' name='start_terminal' id='start_terminal' disabled='disabled'>";
				$table .= "<option value='0'>Terminal</option>";
				
			$table .= "</select></td>";
			
			
			
			//time
			$table .="<td>
			<input type='text' id='start_time' class='tt' name='start_time'  disabled='disabled'/>
	
			</td>";
			
			
			//eta
			$table .="<td>
			<input type='text'  id='eta' class='tt' name='eta' disabled='disabled'/>
			</td>";
			
			//fare
			$table .="<td>
			<input type='text' id='fare' class='tt' name='fare' disabled='disabled'/>
			</td>";
			
			//conductor
			$table .="<td><select class='tt' name='conductor' id='conductor'  disabled='disabled'>";
			$table .= "<option value='0'>Conductor</option>";
			foreach ($conductors->result() as $c){
				$table .= "<option value='$c->id'>$c->firstname $c->lastname</option>";
			}
			$table .= "</select></td>";
			
			//driver
			$table .="<td><select class='tt' name='driver' id='driver'  disabled='disabled'>";
			$table .= "<option value='0'>Driver</option>";
			foreach ($drivers->result() as $d){
				$table .= "<option value='$d->id'>$d->firstname $d->lastname</option>";
			}
			$table .= "</select></td>";
			
		$table .="</tr>";
		echo $table;
		
	}
	
	public function routes(){
		if($this->sys_access == true){
			$data['admin_home'] = true;
			$this->load->model("Model_companies");
			$data['prefix'] = $this->session->userdata("prefix");
			$terminals = $this->Model_companies->all_terminals($data);
			
			$data['terminal_list'] = $terminals->result();
			
			
			
			$data['lastname'] = $this->lastname;
			
			$data['head'] = "Create Route";
			$this->load->view("view_header");
			$this->load->view("view_menu", $data);
			$this->load->view("company/view_add_routes",$data);
		}
	}
	
	public function buses(){
		if($this->sys_access == true){
			$data['admin_home'] = true;
			$this->load->model("Model_companies");
			$data['prefix'] = $this->session->userdata("prefix");
			$terminals = $this->Model_companies->all_terminals($data);
				
			$data['terminal_list'] = $terminals->result();
				
				
				
			$data['lastname'] = $this->lastname;
				
			$data['head'] = "Buses";
			$this->load->view("view_header");
			$this->load->view("view_menu", $data);
			$this->load->view("company/view_buses",$data);
		}
	}
	
	///
	public function all_terminals(){
		if($this->sys_access == true){
			$data['admin_home'] = true;
			$this->load->model("Model_companies");
			$data['prefix'] = $this->session->userdata("prefix");
			$res = $this->Model_companies->all_terminals($data);
			
			if($res->num_rows() > 0){
				echo json_encode($res->result());	
			}else{
				$json['status'] = "1";
				$json['result'] = "0";
				$json['message'] = "No data Found";
				
				echo json_encode($json);
			}
			
		}
	}
	
	public function all_routes(){
		if($this->sys_access == true){
			$this->load->model("Model_companies");
			$data['prefix'] = $this->session->userdata("prefix");
			$res = $this->Model_companies->all_routes($data);
				
			if(sizeof($res) > 0){
				echo json_encode($res);
			}else{
				$json['status'] = "1";
				$json['result'] = "0";
				$json['message'] = "No data Found";
	
				echo json_encode($json);
			}
				
		}
	}
	
	public function all_buses(){
		if($this->sys_access == true){
			$this->load->model("Model_companies");
			$data['prefix'] = $this->session->userdata("prefix");
			$res = $this->Model_companies->all_buses($data);
	
			if(sizeof($res) > 0){
				echo json_encode($res->result());
			}else{
				$json['status'] = "1";
				$json['result'] = "0";
				$json['message'] = "No data Found";
	
				echo json_encode($json);
			}
	
		}
	}
	
	
	public function save_terminal(){
		$this->load->model("Model_companies");
		$data['lat'] = xss_clean($_POST['lat']);
		$data['lng'] = xss_clean($_POST['lng']);
		$data['tn'] = xss_clean($_POST['formatted_address']);
		$data['prefix'] = $this->session->userdata('prefix');
		
		$res = $this->Model_companies->save_terminal($data);
		
		if($res == 1){
			$json['status']="1";
			$json['message'] = "saved";
		}else{
			$json['status']="0";
			$json['message'] = "not saved";
		}
		
		echo json_encode($json);
	}
	
	public function save_route(){
		
		$this->load->model("Model_companies");
		$data['from'] = xss_clean($_POST['from']);
		$data['to'] = xss_clean($_POST['to']);
		$data['distance'] = xss_clean($_POST['distance']);
		$data['duration'] = xss_clean($_POST['duration']);
		$data['name'] = xss_clean($_POST['name']);
		$data['prefix'] = $this->session->userdata('prefix');
		

		$res = $this->Model_companies->save_route($data);
		
		if($res == 1){
			$json['status']="1";
			$json['message'] = "saved";
		}else{
			$json['status']="0";
			$json['message'] = "not saved";
		}
		
		echo json_encode($json);
	}
	
	public function add_bus(){
	
		$this->load->model("Model_companies");
		
		$data['reg_num'] = xss_clean($_POST['reg_num']);
		$data['bus_code'] = xss_clean($_POST['bus_code']);
		$data['num_seats'] = xss_clean($_POST['num_seats']);
		$data['seat_config'] = xss_clean($_POST['seat_config']);
		$data['category'] = xss_clean($_POST['category']);
		$data['add_or_edit'] = xss_clean($_POST['add_or_edit']);
		$data['bus_id'] = xss_clean($_POST['bus_id']);
		
		$data['prefix'] = $this->session->userdata('prefix');
	
		
		$res = $this->Model_companies->add_bus($data);
	
		if($res == 1){
			$json['status']="1";
			$json['message'] = "saved";
		}else{
			$json['status']="0";
			$json['message'] = "not saved";
		}
		
	
		echo json_encode($json);
	}
	public function delete_bus(){
		$data['prefix'] = $this->session->userdata('prefix');
		$data['id'] = $_POST['id'];
		$this->load->model("Model_companies");
		$this->Model_companies->delete_bus($data);
		
	}
	public function delete_terminal(){
		$data['prefix'] = $this->session->userdata('prefix');
		$data['id'] = $_POST['id'];
		$this->load->model("Model_companies");
		$this->Model_companies->delete_terminal($data);
	}

}
?>