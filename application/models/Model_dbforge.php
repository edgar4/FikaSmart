<?php

class Model_dbforge extends CI_Model{
    
    public function Model_dbforge(){
		parent::__construct();
	}
	
	function duplicate($pref){
		
		$db_array = array(
				'bookings_details',
				'booked_seats',
				'bookings_seats',
				'bus_categories',
				'buses',
				'journeys',
				'location_mapping',
				'loyalty',
				'parcels',
				'passengers',
				'payment_methods',
				'routes',
				'seat_config',
				'seats',
				'status',
				'sub_route',
				'susers',
				'terminals',
				'timetable',
				'transactions',
				'trip',
				'user_group'
				);
		
		foreach ($db_array as $tables){
			$query = "CREATE TABLE ".$pref."_".$tables." LIKE ".$tables;
			//$query = "CREATE TABLE ".$pref."_".$tables." AS (SELECT * FROM ".$tables." WHERE 1=2);";
			
			$result = mysql_query($query) or die(mysql_error());
		}
		
		return $result;
	}


}

?>