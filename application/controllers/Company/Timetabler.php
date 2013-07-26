<?php

class Timetabler extends CI_Controller{
	function Timetabler(){
		parent::__construct();
		$this->load->model("Model_timetabler");
	}
	
	function get_specific_routes(){
		$data['prefix'] = $this->session->userdata('prefix');
		$data['terminal'] = xss_clean($_POST['terminal']);
		
		$res = $this->Model_timetabler->get_specific_routes($data);
		
		echo json_encode($res->result());
	}
	
	function save_timetable(){
		$data['prefix'] = $this->session->userdata('prefix');
		$data['day'] = xss_clean($_POST['day']);
		$data['route']= xss_clean($_POST['route']);
		$data['start_terminal'] = xss_clean($_POST['start_terminal']);
		$data['fare'] = xss_clean($_POST['fare']);
		$data['conductor'] = xss_clean($_POST['conductor']);
		$data['driver'] = xss_clean($_POST['driver']);
		$data['bus'] = xss_clean($_POST['select_bus_select']);
		$data['start_time'] = xss_clean($_POST['start_time']);
		
		$res = $res = $this->Model_timetabler->save_timetable($data);
		
		if($res == 1){
			$json['status'] = "1";
			$json['message'] = "Data saved";
		}
		echo json_encode($json);
	}
}

?>