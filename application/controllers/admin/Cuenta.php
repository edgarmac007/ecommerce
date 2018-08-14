<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cuenta extends MY_Controller {

	public function __construct() {
		parent::__construct();

		//Load models
		$this->load->model('Cuenta_model', 'db_cuenta');
		$this->load->model('Languages_model', 'db_lang');
		$this->load->model('Auth_model', 'db_user');
	}

	/**
	 * Funcion para cargar el perfil del usuario
	 */
	public function index() { 
		$userdata = $this->session->userdata();
		//labels
		$data_view['title'] 			= lang('menu_cuenta');
		$data_view['general_guardar'] 	= lang('general_guardar');
		$data_view['cuenta_cuenta'] 	= lang('cuenta_cuenta');
		$data_view['cuenta_chnage_contrasena'] = lang('cuenta_chnage_contrasena');
		$data_view['cuenta_contrasena'] = lang('cuenta_contrasena');
		$data_view['cuenta_confir_contra'] = lang('cuenta_confir_contra');
		$data_view['cuenta_usuario']  	= lang('cuenta_usuario');
		$data_view['cuenta_correo'] 	= lang('cuenta_correo');
		$data_view['cuenta_idioma'] 	= lang('cuenta_idioma');
		$data_view['cuenta_editables'] 	= lang('cuenta_editables');
		$data_view['cuenta_perfil'] 	= lang('cuenta_perfil');
		$data_view['cuenta_new_contrasena'] = lang('cuenta_new_contrasena');
		$data_view['cuenta_requerimientos'] = lang('cuenta_requerimientos');
		$data_view['cuenta_requeriment_1'] = lang('cuenta_requeriment_1');
		$data_view['cuenta_requeriment_2'] = lang('cuenta_requeriment_2');
		$data_view['cuenta_requeriment_3'] = lang('cuenta_requeriment_3');
		$data_view['cuenta_requeriment_4'] = lang('cuenta_requeriment_4');
		$data_view['cuenta_requeriment_5'] = lang('cuenta_requeriment_5');
		$data_view['cuenta_requeriment_6'] = lang('cuenta_requeriment_6');
		$data_view['cuenta_requeriment_7'] = lang('cuenta_requeriment_7');

		//data
		$data_view['id_usuario'] 		= $userdata['id_usuario'];
		$data_view['select_lang'] 		= self::build_select_lang($userdata['id_lang']);
		$data_view['username'] 			= $userdata['username'];
		$data_view['email'] 			= $userdata['email'];


		$includes['footer']['js'][] = array( 'url' => 'vendor/Username-Blacklist', 'name' => 'list');
		$includes['footer']['js'][] = array( 'url' => 'js/cuenta', 'name' => 'Form_validate');
		$this->load_view('admin/Cuenta_view', $data_view, $includes);
	}

	/**
	 * Construcción select HTML idiomas
	 */
	private function build_select_lang($selected = FALSE){
		$lang = $this->db_lang->get_lang();
		$data_select = array(
			'option'	=> $lang
			,'name'		=> 'id_lang'
			,'id' 		=> 'id_lang'
			,'required'	=> true
			,'selected' => $selected
			,'value'	=> 'id_lang'
			,'text'		=> 'language'
		);

		return  dropdown($data_select);
	}

	/**
	 * Función para la actualización de datos del perfil
	 */
	public function process_update_data(){ 
		try {
			$id_usuario = $this->session->userdata('id_usuario');
			$sql_data = array(
			    'id_usuario' 	=> $id_usuario
			    ,'username'		=> $this->input->post('username')
			    ,'id_lang' 		=> $this->input->post('id_lang')
			);

			$unique = $this->db_cuenta->email_unique($sql_data);	
			$unique OR set_exception(lang('cuenta_user_duplicate'));	

			//actualización de datos
			$this->db_cuenta->user_update($sql_data);
			
			$userdata = $this->db_user->get_auth(array('id_usuario' => $id_usuario));
            unset($userdata['password']);
			$this->session->set_userdata($userdata);
			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('cuenta_update_success')
				,'type' 	=> 'success'
			);

		} catch (Exception $e) {
			$response = array(
				'success' 	=> FALSE
				,'title' 	=> lang('general_error')
				,'msg' 		=> $e->getMessage()
				,'type' 	=> 'error'
			);
		}

		echo json_encode($response);
	}

	/** 
	 * Función para editar la contraseña del usuario
	 */
	public function process_update_password() {
		try {
			$id_usuario = $this->session->userdata('id_usuario');
			$userdata = $this->db_user->get_auth(array('id_usuario' => $id_usuario));
			($userdata['password'] == $this->input->post('old_password')) OR set_exception(lang('cuenta_error_autentication'));

			$sql_data = array(
			    'id_usuario' => $id_usuario
			    ,'password' => $this->input->post('password')
			);

			//actualización de datos
			$update = $this->db_cuenta->user_update($sql_data);
			$update OR set_exception(lang('general_throw_xception'));
			
			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('cuenta_update_success')
				,'type' 	=> 'success'
			);
		} catch (Exception $e) {
			$response = array(
				'success' 	=> FALSE
				,'title' 	=> lang('general_error')
				,'msg' 		=> $e->getMessage()
				,'type' 	=> 'error'
			);
		}

		echo json_encode($response);
	}

}

/* End of file Cuenta.php */
/* Location: ./application/controllers/admin/Cuenta.php */