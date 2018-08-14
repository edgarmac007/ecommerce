<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mail extends MY_Controller {

	public function test() {
		//ENVIAMOS CORREO DE NOTIFICACIÓN DE CREACIÓN DE USUARIO
		$email_data = array(
			'email_estimado' 			=> lang('email_estimado')
			,'personal' 				=> utf8_decode('DEMOS TEST')
			,'email_message' 			=> utf8_decode(lang('email_message_restart_pass'))
			,'email_usuario' 			=> lang('email_usuario')
			,'usuario' 					=> 'TEST'
			,'email_restablecer_pass' 	=> utf8_decode(lang('email_restablecer_pass'))
			,'email_automatico' 		=> utf8_decode(lang('email_automatico'))
			,'anio' 					=> date('Y')
			,'url' 						=> base_url('restart_password/')
		);
		$body = $this->view_unique('email/restart_password_view', $email_data);
		$email_data = array(
			'subject' 	=> 'TEST'
			,'body' 	=> $body
			,'email' 	=> 'hernan.06_saul@hotmail.com'
		);
		$this->my_email->send_mail($email_data);
	}
}

/* End of file Mail.php */
/* Location: ./application/controllers/Mail.php */