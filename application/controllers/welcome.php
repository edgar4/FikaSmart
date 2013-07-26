<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	function Welcome(){
		parent::__construct();
		
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
	public function index()
	{
		$this->send_email();
		$this->load->view('welcome_message');
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

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */