<?php

class Emailer {
	public function Emailer(){
		$config = Array(
				'protocol' => 'smtp',
				'smtp_host' => 'ssl://smtp.googlemail.com',
				'smtp_port' => 465,
				'smtp_user' => 'phinkoholism@gmail.com',
				'smtp_pass' => 'phineaskobia45409950',
				'mailtype'  => 'html',
				'charset'   => 'iso-8859-1'
		);
		
		$this->load->library('email', $config);
	}
	
	public function send_email(){
		$this->email->set_newline("\r\n");
		
		$this->email->from('phinkoholism@gmail.com', 'aaa');
		$this->email->to('mwitikobia@yahoo.com');
		$this->email->subject('This is an email test');
		$this->email->message('It is working. Great!');
		$result = $this->email->send();
		echo $this->email->print_debugger();
	}
}

?>