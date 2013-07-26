<?php

class Model_users extends CI_Model{
    
    public function Model_users(){
		parent::__construct();
	}
	
    function add_user($form_data){
    	
    	$fname = $form_data['admin_firstname'];
		$lname = $form_data['admin_lastname'];
		$idnum = $form_data['admin_idnum'];
		$email = $form_data['admin_email'];
		$username = $form_data['admin_username'];
		$phone = $form_data['admin_phone'];
		$company = $form_data['admin_select_company'];
		$user_level = $form_data['admin_user_level'];
		$prefix = $form_data['admin_prefix'];
		
		$pass = do_hash($form_data['password']);
    	
    	//$query = "insert into companies(company_name,company_loc,
    	//db_prefix,created_by_admin,postal_adress,email_add) values('$company_name',
    	//'$company_loc','$db_prefix','$created_by','$company_addr','$email_add')";
    	
    	//$result = mysql_query($query) or die(mysql_error());
    	
    	//echo $result;
    	
    	//insert
    	
    	$this->db->set('firstname', $fname);
    	$this->db->set('lastname', $lname);
    	$this->db->set('company', $company);
    	$this->db->set('pass', $pass);
    	
    	$this->db->set('email', $email);
    	//$this->db->set('status', $status);
    	$this->db->set('id_num', $idnum);
    	//$this->db->set('company_admin', $company_admin);
    	$this->db->set('user_group', $user_level);
    	$this->db->set('mobilenumber', $phone);
    	$this->db->set('username', $username);
    	
    	
    	$res = $this->db->insert('all_users');
    	return $res;
    		
    }
    
    function edit_user($form_data){
    	$fname = $form_data['admin_firstname'];
    	$lname = $form_data['admin_lastname'];
    	$idnum = $form_data['admin_idnum'];
    	$email = $form_data['admin_email'];
    	$username = $form_data['admin_username'];
    	$phone = $form_data['admin_phone'];
    	//$company = $form_data['admin_select_company'];
    	$user_level = $form_data['admin_user_level'];
    	$prefix = $form_data['admin_prefix'];
    	$id = $form_data['user_id'];
    	//$pass = $form_data['password'];

    	
    	$update_data = array(
    			'firstname' => $fname,
    			'lastname' => $lname,
    			'email' => $email,
    			'id_num' => $idnum,
    			'user_group' => $user_level,
    			'mobilenumber'=>$phone,
    			'username'=>$username
    	);
    	
    	$this->db->where('id', $id);
    	$res = $this->db->update($prefix.'_susers', $update_data);
    	
    	
    	return $res;
    	
    }
    
    function all_users($data){
    	$prefix = $data['prefix'];
    	$company = $this->session->userdata("company_id");
    	if(isset($data['get'])){
    		$user_id = $data['get'];
    		$this->db->where('user_group',$user_id);
    	}
    	$this->db->where('company',$company);
    	$res = $this->db->get("all_users"); 
    	return $res;
    }
    function delete_user($data){
    	$query = $this->db->delete('all_users', array('id'=>$data['id']));
    	return $query;
    }
}

?>