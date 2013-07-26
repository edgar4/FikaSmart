<?php
class Mymenu{
	
	private $user_id;
	private $user_level;
	private $logged_in;
	private $lastname;
	private $company_prefix;
	private $company_name;
	private $company_id;
	
	public function get_menu($session_data,$page=""){
		//print_r($session_data);
		$this->set_values($session_data);
		
		echo "<div class=\"menu\">";
			echo $this->company_name; 
			
			//echo page
			if($page != ""){
				echo " | ".$page;
			}
					
		echo "<div style=\"float:right\">";
			if($this->logged_in == 1){
				echo anchor("Home","Home");
				echo $this->menu_separator();
				
				switch ($this->user_level){
					case 1:
						echo anchor("admin/create_comp","Company");
						echo $this->menu_separator();
					break;
					case 2://company admin
						echo anchor("Company/Company_users/create_users","Users");
						echo $this->menu_separator();
						echo anchor("Company/Company_users/view_manifest","manifest");
						echo $this->menu_separator();
						echo anchor("Company/Company_users/terminals","Terminals");
						echo $this->menu_separator();
						echo anchor("Company/Company_users/routes","Routes");
						echo $this->menu_separator();
						echo anchor("Company/Company_users/buses","Buses");
						echo $this->menu_separator();
						echo anchor("Company/Company_users/timetable","Timetable");
						echo $this->menu_separator();
						echo anchor("Company/Reports","Bookings");
						echo $this->menu_separator();
						
					break;
					
					case 3://terminal manager
						echo anchor("Company/Company_users/view_manifest","manifest");
						echo $this->menu_separator();
					    echo anchor("Company/Company_users/terminals","Terminals");
						echo anchor("Company/Company_users/routes","Routes");
						echo $this->menu_separator();
						echo anchor("Company/Company_users/timetable","Timetable");
						echo $this->menu_separator();
						echo anchor("Company/Reports","Bookings");
						echo $this->menu_separator();
						
					break;
					
					case 4://cashier
						echo anchor("Company/Company_users/timetable","Timetable");
						echo $this->menu_separator();
						echo anchor("Company/Reports","Bookings");
						echo $this->menu_separator();
						
					break;
			
					case 5://conductor
						echo anchor("Company/Company_users/view_manifest","manifest");
						echo $this->menu_separator();
						echo anchor("Company/Company_users/timetable","Timetable");
						echo $this->menu_separator();
						
					break;
					case 6://loader
						echo $this->menu_separator();
						echo anchor("Company/Company_users/timetable","Timetable");
						echo $this->menu_separator();
						
					break;
					case 7://driver
						echo anchor("Company/Company_users/view_manifest","manifest");
						echo $this->menu_separator();
						echo anchor("Company/Company_users/timetable","Timetable");
						echo $this->menu_separator();
						
					break;
					case 8://customer
						echo anchor("Company/Company_users/timetable","Timetable");
						echo $this->menu_separator();
						echo anchor("Company/Reports","Bookings");
						echo $this->menu_separator();
						
					break;

				}
				
				echo anchor("Login/logout","Logout (".$this->lastname .")");
			}else{
				echo anchor("Home","Home");
			}
			
			
		echo "</div></div>";
	} 
	
	function set_values($session_data){
		if(isset($session_data['user_level'])){
			$this->user_level =  $session_data['user_level'];
		}else{
			$this->user_level = "";
		}
		
		if(isset($session_data['user_id'])){
			$this->user_id =  $session_data['user_id'];
		}else{
			$this->user_id = "";
		}
		
		if(isset($session_data['lastname'])){
			$this->lastname =  $session_data['lastname'];
		}else{
			$this->lastname = "";
		}
		
		if(isset ($session_data['logged_in'])){
			$this->logged_in = $session_data['logged_in'];
		}else{
			$this->logged_in = "";
		}
		
		if(isset ($session_data['company_prefix'])){
			$this->company_prefix = $session_data['company_prefix'];
		}else{
			$this->company_prefix = "";
		}
		
		if(isset ($session_data['company_name'])){
			$this->company_name= $session_data['company_name'];
		}else{
			$this->company_name = "Travel IQ";
		}
		
		/*
		 $sid =  $session_data['session_id'];
		$ip =  $session_data['ip_address'];
		$activity =  $session_data['last_activity'];
		*/
		
	}
	
	private function menu_separator(){
		return " | ";
	}
}

/*
 * <a href="<?php echo base_url()."admin/create_comp";?>">Companies</a> | 
	 <?php }?>
	  <a href="<?php echo base_url()."Company/Company_users/create_users";?>">Users</a> |
	  <a href="<?php echo base_url()."Company/Company_users/terminals";?>">Terminals</a> |
	  <a href="<?php echo base_url()."Company/Company_users/routes";?>">Routes</a> |
	  <a href="<?php echo base_url()."Company/Company_users/buses";?>">Buses</a> |
	   <a href="<?php echo base_url()."Company/Company_users/timetable";?>">Timetable</a> |
	 
	 <a href="<?php echo base_url()."Login/logout";?>">Log Out</a>
 */
?>