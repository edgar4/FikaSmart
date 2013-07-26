<?php

class Model_companies extends CI_Model{
    
    public function Model_companies(){
		parent::__construct();
	}
	
    function add_company($data){
    	
    	$company_name = $data['company_name'];
    	$company_loc = $data['company_loc'];
    	$status = 0;
    	$db_prefix = $data['db_prefix'];
    	//$company_admin = 0;
    	$created_by = $data['created_by'];

    	$email_add = $data['email_add'];
    	$company_addr = $data['company_addr'];
    	$tel = $data['tel_number'];
    	
    	//$query = "insert into companies(company_name,company_loc,
    	//db_prefix,created_by_admin,postal_adress,email_add) values('$company_name',
    	//'$company_loc','$db_prefix','$created_by','$company_addr','$email_add')";
    	
    	//$result = mysql_query($query) or die(mysql_error());
    	
    	//echo $result;
    	
    	//insert
    	
    	$this->db->set('company_name', $company_name);
    	$this->db->set('company_loc', $company_loc);
    	$this->db->set('tel', $tel);
    	//$this->db->set('status', $status);
    	$this->db->set('db_prefix', $db_prefix);
    	//$this->db->set('company_admin', $company_admin);
    	$this->db->set('created_by_admin', $created_by);
    	$this->db->set('postal_adress', $company_addr);
    	$this->db->set('email_add', $email_add);
    	
    	
    	$res = $this->db->insert('companies');
    	return $res;
    		
    }
    
    function edit_company($data){
    	
    	$name = $data['company_name'];
    	$loc =$data['company_loc'];
    	$addr = $data['company_addr'];
    	$tel = $data['tel_number'];
    	$email = $data['email_add'];
    	$id = $data['company_id'];
    	
    	
    	$update_data = array(
    			'company_name' => $name,
    			'company_loc' => $loc,
    			'postal_adress' => $addr,
    			'email_add' => $email,
    			'tel' => $tel
    	);
    	
    	$this->db->where('id', $id);
    	$res = $this->db->update('companies', $update_data);
    	
    	
    	return $res;
    }
    
    
    
    function all_companies(){
    	$this->db->select("id,company_name,company_loc,status,company_admin,email_add,postal_adress,tel,db_prefix");
    	$this->db->order_by("when_created","desc");
    	return $this->db->get("companies");
    }
    
    function all_buses($data){
    	$prefix = $data['prefix'];
    	return $this->db->get($prefix."_buses");
    }
    
    function save_terminal($data){
    	$prefix = $data['prefix'];
    	
    	$lng = $data['lng'];
    	$lat = $data['lat'];
    	$tn = $data['tn'];
    	
    	$this->db->set('longitude', $lng);
    	$this->db->set('latitude', $lat);
    	$this->db->set('terminal_name', $tn);
    	
    	 
    	 
    	$res = $this->db->insert($prefix.'_terminals');
    	return $res;
    }
    
    function add_bus($data){
    	$reg_num = $data['reg_num'];
		$bus_code = $data['bus_code'];
		$num_seats = $data['num_seats'];
		$seat_config = $data['seat_config'];
		$category = $data['category'];
		$prefix = $data['prefix'];
		$add_or_edit = $data['add_or_edit'];
		$bus_id = $data['bus_id'];
    	
		if($add_or_edit == 1){
			$this->db->set('registration_num', $reg_num);
			$this->db->set('bus_code', $bus_code);
			$this->db->set('seats', $num_seats);
			$this->db->set('seat_config_id', $seat_config);
			$this->db->set('category_id', $category);
			
			$res = $this->db->insert($prefix.'_buses');
			
			$data['bus_id'] = $this->db->insert_id();
			
			$this->create_seats($data);
			
			//print_r($data);
			
		}else{
			$update_data = array(
					'registration_num' => $reg_num,
					'bus_code' => $bus_code,
					'seats' => $num_seats,
					'seat_config_id' => $seat_config,
					'category_id' => $category
			);
			 
			$this->db->where('id', $bus_id);
			$res = $this->db->update($prefix.'_buses', $update_data);
			
		}
    	
    	
    	return $res;
    }
    
    function create_seats($data){
    	for($i = 1; $i <=32; $i++){
    		if($i <= 7){
    			$a = "A";
    		}else if($i>7 && $i<=15){
    			$a = "B";
    		}else{
    			$a = "C";
    		}
    		
    		$this->db->set('bus_id',$data['bus_id']);
    		$seat_no = $a.$i;
    		$this->db->set('seat_no',$seat_no);
    		
    		$this->db->insert($data['prefix']."_seats");
    	}
    }
    
    function save_route($data){
    	$prefix = $data['prefix'];
    	 
    	$from = $data['from'];
    	$to = $data['to'];
    	$distance= $data['distance'];
    	$duration= $data['duration'];
    	$name= $data['name'];
    	 
    	$this->db->set('description', $name);
    	$this->db->set('terminal_start', $from);
    	$this->db->set('terminal_end', $to);
    	$this->db->set('distance', $distance);
    	$this->db->set('duration', $duration);
    	 
    
    
    	$res = $this->db->insert($prefix.'_routes');
    	return $res;
    }
    
    function all_terminals($data){
    	$prefix = $data['prefix'];
    	
    	$res = $this->db->get($prefix.'_terminals');
    	
    	return $res;
    }
    
    public function all_routes($data){
    	$prefix = $data['prefix'];
    	 
    	$res = $this->db->get($prefix.'_routes');
    	$db_vals = "";
    	foreach ($res->result() as $index=>$value){
    		$db_vals[$index]['id'] = $value->id;
    		$db_vals[$index]['description'] = $value->description;
    		$db_vals[$index]['terminal_start'] = $this->get_terminal_name($prefix, $value->terminal_start);
    		$db_vals[$index]['ts_id'] = $value->terminal_start;
    		$db_vals[$index]['te_id'] = $value->terminal_end;
    		$db_vals[$index]['terminal_end'] = $this->get_terminal_name($prefix, $value->terminal_end);
    		$db_vals[$index]['distance'] = $value->distance;
    		$db_vals[$index]['duration'] = $value->duration;	
    	}
    	 
    	return $db_vals;
    }
    
    
    public function get_terminal_name($prefix,$id){
    	$this->db->select('terminal_name');
    	
    	$this->db->where('id',$id);
    	
    	$ts_res = $this->db->get($prefix."_terminals");
    	
    	foreach ($ts_res->result() as $value){
    		return $value->terminal_name;
    	}
    } 
    
    public function get_route_name($prefix,$id){
    	$this->db->select('description');
    	 
    	$this->db->where('id',$id);
    	 
    	$ts_res = $this->db->get($prefix."_routes");
    	 
    	foreach ($ts_res->result() as $value){
    		return $value->description;
    	}
    }
    
    public function get_users_name($prefix,$id){
    	$this->db->select('firstname,lastname');
    
    	$this->db->where('id',$id);
    
    	$ts_res = $this->db->get($prefix."_susers");
    
    	foreach ($ts_res->result() as $value){
    		return $value->lastname.", ".$value->firstname;
    	}
    }
    
    public function get_timetable($data){
    	$bus_id = $data['bus_id'];
    	$prefix = $data['prefix'];
    	
    	$this->db->select("*");
    	$this->db->where("bus_id",$bus_id);
    	
    	$res = $this->db->get($prefix."_timetable");
    	
    	return $res;
    }
    
    public function delete_bus($data){
    	$query = $this->db->delete($data['prefix']."_buses", array('id' => $data['id']));
    	return $query;
    }
    
    public function delete_terminal($data){
    	$qry['term'] = $this->db->delete($data['prefix']."_terminals", array('id' => $data['id']));
    	$qry['route'] = $this->db->delete($data['prefix']."_routes", array('terminal_start' => $data['id']));
    	$qry['route2'] = $this->db->delete($data['prefix']."_routes", array('terminal_end' => $data['id']));
    	return $qry;    	
    }
    
}

?>