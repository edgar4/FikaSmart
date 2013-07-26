<?php

class Model_login extends CI_Model{
    
    public function Model_login(){
		parent::__construct();
	}
    public function auth($details){
        
    	if($this->isValidEmail($details['username'])){
    		$this->db->where('email', $details['username']);
    	}else{
    		$this->db->where('username', $details['username']);
    	}
        
        $this->db->where('pass', $details['password']);
        
        $query = $this->db->get('all_users');
        
        return $query;
         
    }
    
    function isValidEmail($email){
    	return preg_match("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$^", $email);
    }
}

?>