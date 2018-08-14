<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Personales extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->path = "admin/administracion/personales";

		//Load models
		$this->load->model('Roles_model', 'db_roles');
		$this->load->model('catalogos/Perfiles_model', 'db_perfiles');
		$this->load->model('administracion/Usuarios_model', 'db_usuarios');
		$this->load->model('administracion/Personales_model', 'db_personales');
	}

	/**
	 * funcion para cargar la vista de los peronales activo
	 */
	public function index() { 
		//labels
		$data_view['title'] 						= lang('menu_admin');
		$data_view['subtitle'] 						= lang('menu_personales');
		$data_view['personales_created_personal'] 	= lang('personales_created_personal');
		$data_view['general_cancelar'] 				= lang('general_cancelar');
		$data_view['general_guardar'] 				= lang('general_guardar');
		$data_view['Personales_datos_personal'] 	= lang('Personales_datos_personal');
		$data_view['personales_nombre'] 			= lang('personales_nombre');
		$data_view['personales_paterno'] 			= lang('personales_paterno');
		$data_view['personales_materno'] 			= lang('personales_materno');
		$data_view['personales_area'] 				= lang('personales_area');
		$data_view['personales_correo'] 			= lang('personales_correo');
		$data_view['personales_telefono'] 			= lang('personales_telefono');
		$data_view['usuario_username'] 				= lang('usuario_username');
		$data_view['personales_rol'] 				= lang('personales_rol');
		$data_view['personales_perfil'] 			= lang('personales_perfil');
		$data_view['personales_language'] 			= lang('personales_language');
		$data_view['personales_dias_expiracion'] 	= lang('personales_dias_expiracion');
		$data_view['general_required_fields'] 		= lang('general_required_fields');
		$data_view['personales_msg_expiracion'] 	= lang('personales_msg_expiracion');
		//data
		$data_view['data_table'] = self::build_table_main();
		$data_view['select_roles'] 		= self::build_select_roles();
		$data_view['select_langs'] 		= $this->build_select_langs();
		$data_view['select_perfiles'] 	= self::build_select_perfiles();
		$data_view['modal_account'] 	= $this->view_unique($this->path."/new_account_modal", $data_view);

		$includes['footer']['js'][] = array( 'url' => 'js/personales', 'name' => 'Table_events');
		$this->load_view($this->path."/personales_view", $data_view, $includes);
	}

	/**
	 * Función para la creación de la tabla principal de los personales
	 */
	private function build_table_main() {
		$rows = $this->db_personales->get_personales();
		// debug($rows);
		$data = array();
		$title 	= array(
			lang('general_id')
			,lang('personales_nombre')
			,lang('personales_paterno')
			,lang('personales_materno')
			,lang('personales_correo')
			,lang('personales_telefono')
			,lang('general_actions')
		);

		if ($rows) {
			foreach ($rows as $row) {
				$buttons = self::build_buttons($row);
				$data[] = array(
					'id_personal' 		=> $row['id_personal']
            		,'nombre' 			=> $row['nombre']
            		,'paterno' 			=> $row['paterno']
            		,'materno' 			=> $row['materno']
            		,'correo_personal' 	=> $row['correo_emp']
            		,'tel_movil' 		=> $row['tel_emp']
            		,'actions' 			=> build_actions($buttons)
				);
			}
		}

		$data_table = array(
			'head' 		=> $title
			,'rows' 	=> $data
			,'id' 		=> 'table-main'
			,'attr_data' => array('id_personal')
		);
		
		return Datatable($data_table);
	}

	private function build_buttons($data) {
		$buttons = array(
			array(
				'tooltip' 	=> lang('general_editar')
				,'class'	=> 'btn-warning edit'
				,'icon'		=> '<i class="material-icons">mode_edit</i>'
			)
			,array(
				'tooltip' 	=> lang('general_borrar')
				,'class'	=> 'btn-danger drop'
				,'icon'		=> '<i class="material-icons">delete</i>'
				,'data'		=> array('id_usuario' => $data['id_usuario'])
			)
		);

		//AGREGAMOS EL BOTON PARA CREAR EL USUARIO DEL EMPLEADO
		if (is_null($data['user_activo'])) {
			$buttons[] = array(
				'tooltip' => lang('personales_created_user')
				,'class'=> 'btn-success new-user'
				,'icon'	=> '<i class="material-icons">account_circle</i>'
			);
		}

		//AGREGAMOS EL BOTON PARA ACTIVAR EL USUARIO DEL EMPLEADO
		if ($data['user_activo'] === '0') {
			$buttons[] = array(
				'tooltip' => lang('personales_activar_user')
				,'class'=> 'btn-danger enable-user'
				,'icon'	=> '<i class="material-icons">account_circle</i>'
				,'data'		=> array('id_usuario' => $data['id_usuario'])
			);
		}

		return $buttons;
	}

	/**
	 * Funcion para cargar la vista del registro de nuevos ersonales
	 **/
	public function new_view() {
		//labels
		$data_view['title'] 					= lang('menu_personales');
		$data_view['general_required_fields'] 	= lang('general_required_fields');
		$data_view['Personales_datos_personal'] = lang('Personales_datos_personal');
		$data_view['personales_nombre'] 		= lang('personales_nombre');
		$data_view['personales_paterno'] 		= lang('personales_paterno');
		$data_view['personales_materno'] 		= lang('personales_materno');
		$data_view['personales_correo_personal']= lang('personales_correo_personal');
		$data_view['personales_tel_movil'] 		= lang('personales_tel_movil');
		$data_view['personales_movil'] 			= lang('personales_movil');
		$data_view['general_guardar'] 			= lang('general_guardar');
		$data_view['general_cancelar'] 			= lang('general_cancelar');
		$data_view['personales_rol'] 			= lang('personales_rol');
		$data_view['personales_perfil'] 		= lang('personales_perfil');
		$data_view['personales_language'] 		= lang('personales_language');
		$data_view['personales_dias_expiracion'] = lang('personales_dias_expiracion');
		$data_view['personales_msg_expiracion'] = lang('personales_msg_expiracion');

		//DATA
		$data_view['select_roles'] 		= self::build_select_roles();
		$data_view['select_langs'] 		= $this->build_select_langs();
		$data_view['select_perfiles'] 	= self::build_select_perfiles();

		$includes['footer']['js'][] = array( 'url' => 'js/personales', 'name' => 'Form_validate');
		$this->load_view($this->path."/new_personal_view", $data_view, $includes);
	}

	/**
	 * Construcción del select roles
	 */
	private function build_select_roles($selected="") {
		$data = $this->db_roles->get_roles();
		if ( ! $data) $data = array();
		
		$params = array(
			'option' 		=> $data
			,'name' 		=> 'id_rol'
			,'id' 			=> 'id_rol'
			,'value' 		=> 'id_rol'
			,'text' 		=> 'rol'
			,'live_search' 	=> TRUE
			,'class' 		=> 'validate required'
		);
		$selected ? $params['selected'] = $selected : FALSE;
		$dropdown = dropdown($params);

		return  $dropdown;
	}

	/**
	 * Construcción del select perfiles
	 */
	private function build_select_perfiles($selected="") {
		$data = $this->db_perfiles->get_perfiles();
		if ( ! $data) $data = array();
		
		$params = array(
			'option' 		=> $data
			,'name' 		=> 'id_perfil'
			,'id' 			=> 'id_perfil'
			,'value' 		=> 'id_perfil'
			,'text' 		=> 'perfil'
			,'class' 		=> 'validate required'
		);
		$selected ? $params['selected'] = $selected : FALSE;
		$dropdown = dropdown($params);

		return  $dropdown;
	}

	/**
	 * Proceso para guardar un nuevo personal
	 */
	public function process_save() {
		try {
			$this->db->trans_begin();
			$created_user = $this->input->post('created_user');
			$sql_data = array(
				'nombre' 			=> $this->input->post('nombre')
			    ,'paterno' 			=> $this->input->post('paterno')
			    ,'materno' 			=> $this->input->post('materno')
			    ,'tel_movil' 		=> $this->input->post('tel_movil')
			    ,'correo_emp' 		=> $this->input->post('correo')
			    ,'id_usuario' 		=> $this->session->userdata('id_usuario')
			);
			$personal 	= "$sql_data[nombre] $sql_data[paterno] $sql_data[materno]";
			$exist 		= $this->db_personales->exist_personal($sql_data);
			!$exist OR set_exception(lang('personales_user_duplicate'));

			$insert = $this->db_personales->insert_personal($sql_data);
			$insert OR set_exception();

			//SI SE VA CREAR EL USUARIO
			$data = array(
				'id_personal' 		=> $insert
				,'id_rol' 			=> $this->input->post('id_rol')
				,'id_perfil' 		=> $this->input->post('id_perfil')
				,'email' 			=> $this->input->post('correo')
				,'dias_expiracion' 	=> $this->input->post('dias_expiracion')
				,'id_lang' 			=> $this->input->post('id_lang')
				,'personal' 		=> $personal
			);
			self::register_user($data);

			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('personales_created_user_success')
				,'type' 	=> 'success'
			);
			$this->db->trans_commit();
		} catch (Exception $e) {
			$this->db->trans_rollback();
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
	 * función para crear la cuenta del usuario
	 * @param $data Array datos del perfil de la cuenta
	 **/
	private function register_user($data) {
		$personal 	= $data['personal'];
		$email 		= $data['email'];
		unset($data['personal'], $data['email']);
		$data['username'] 	= self::generate_user_name($personal);
		$data['token'] 		= random_string('md5');
		$insert = $this->db_usuarios->insert_user($data);
		$insert OR set_exception();

		//ENVIAMOS CORREO DE NOTIFICACIÓN DE CREACIÓN DE USUARIO
		$email_message = str_replace('{application}', $this->vars['APP_TITLE'], lang('email_message_register'));
		$email_data = array(
			'email_estimado' 			=> lang('email_estimado')
			,'personal' 				=> utf8_decode($personal)
			,'email_message' 			=> utf8_decode($email_message)
			,'email_usuario' 			=> lang('email_usuario')
			,'usuario' 					=> $data['username']
			,'email_restablecer_pass' 	=> utf8_decode(lang('email_restablecer_pass'))
			,'email_automatico' 		=> utf8_decode(lang('email_automatico'))
			,'anio' 					=> date('Y')
			,'url' 						=> base_url('admin/restart_password/'.$data['token'])
			,'application' 				=> $this->vars['APP_TITLE']
		);
		$body = $this->view_unique('email/user_register_view', $email_data);
		$email_data = array(
			'subject' 	=> lang('personales_register') . $this->vars['APP_TITLE']
			,'body' 	=> $body
			,'email' 	=> $email
		);
		$this->my_email->send_mail($email_data);		
	}

	/**
	 * Generamos el nombre de la cuenta del usuario a partir del nombre del personal
	 * @param $data String nombre completo del personal
	 **/
	private function generate_user_name($data) {
		list($nombre, $paterno, $materno) = explode(' ', $data);
		$paterno = str_replace(
			 array(' ', 'á', 'é', 'í', 'ó', 'ú')
			,array('', 'a', 'e', 'i', 'o', 'u')
			,$paterno
		);
		$user = strtoupper($nombre[0]).strtolower($paterno);

		return $user;
	}

	/** 
	 * Carga de la vista para la edición de los datos del personal seleccionado
	 **/
	public function edit_view() {
		$_POST OR redirect('personales', 'location');

		//labels
		$data_view['title'] 					= lang('menu_personales');
		$data_view['general_required_fields'] 	= lang('general_required_fields');
		$data_view['Personales_datos_personal'] = lang('Personales_datos_personal');
		$data_view['Personales_datos_empleado'] = lang('Personales_datos_empleado');
		$data_view['personales_nombre'] 		= lang('personales_nombre');
		$data_view['personales_paterno'] 		= lang('personales_paterno');
		$data_view['personales_materno'] 		= lang('personales_materno');
		$data_view['personales_correo_personal']= lang('personales_correo_personal');
		$data_view['personales_tel_movil'] 		= lang('personales_tel_movil');
		$data_view['general_guardar'] 			= lang('general_guardar');
		$data_view['general_cancelar'] 			= lang('general_cancelar');
		$data_view['personales_rol'] 			= lang('personales_rol');
		$data_view['personales_perfil'] 		= lang('personales_perfil');
		$data_view['personales_language'] 		= lang('personales_language');
		$data_view['personales_dias_expiracion'] = lang('personales_dias_expiracion');
		$data_view['personales_msg_expiracion'] = lang('personales_msg_expiracion');

		//DATA
		$sql_data = array('id_personal' => $this->input->post('id_personal'));
		$personal_data = $this->db_personales->get_personales($sql_data);
		$pd = $personal_data[0];
		$ud = $this->db_usuarios->get_usuario($sql_data);
		$data_view = array_merge($data_view, $pd, $ud);

		$data_view['select_roles'] 		= self::build_select_roles($ud['id_rol']);
		$data_view['select_langs'] 		= $this->build_select_langs($ud['id_lang']);
		$data_view['select_perfiles'] 	= self::build_select_perfiles($ud['id_perfil']);

		$includes['footer']['js'][] = array( 'url' => 'js/personales', 'name' => 'Form_validate');
		$this->load_view($this->path."/edit_personal_view", $data_view, $includes);
	}

	/**
	 * Proceso para guardar un nuevo personal
	 */
	public function process_edit() {
		try {
			$this->db->trans_begin();
			$sql_data = array(
				'id_personal' 		=> $this->input->post('id_personal')
				,'nombre' 			=> $this->input->post('nombre')
			    ,'paterno' 			=> $this->input->post('paterno')
			    ,'materno' 			=> $this->input->post('materno')
			    ,'correo_emp' 		=> $this->input->post('correo_emp')
			    ,'tel_movil' 		=> $this->input->post('tel_movil')
			    ,'id_usuario_update'=> $this->session->userdata('id_usuario')
			);
			
			$exist 		= $this->db_personales->exist_personal($sql_data);
			!$exist OR set_exception(lang('personales_user_duplicate'));

			$update = $this->db_personales->update_personal($sql_data);
			$update OR set_exception();

			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('personales_edit_personal_success')
				,'type' 	=> 'success'
				,'redirect' => TRUE
				,'url' 		=> 'admin/personales'
			);
			$this->db->trans_commit();
		} catch (Exception $e) {
			$this->db->trans_rollback();
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
	 * Función para hacer el eliminado logico del personal
	 **/
	public function process_drop() {
		try { 
			$this->db->trans_begin();
			$sql_data = array(
				'id_personal' 	=> $this->input->post('id_personal')
				,'id_usuario' 	=> $this->input->post('id_usuario')
				,'activo' 		=> 0
			);
			
			$update = $this->db_usuarios->update_user($sql_data);
			$update OR set_exception();

			$sql_data['id_usuario_update'] = $this->session->userdata('id_usuario');
			unset($sql_data['id_usuario']);
			$update = $this->db_personales->update_personal($sql_data);
			$update OR set_exception();

			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('personales_drop_success')
				,'type' 	=> 'success'
			);
			$this->db->trans_commit();
		} catch (Exception $e) {
			$this->db->trans_rollback();
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
	 * Función para habillitar la cuenta del personal
	 **/
	public function enable_user() {
		try {
			$sql_data = array(
				'id_usuario' 	=> $this->input->post('id_usuario')
				,'activo' 		=> 1
			);
			$update = $this->db_usuarios->update_user($sql_data);
			$update OR set_exception();

			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('personales_enable_account')
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
	 * creación del usuario del personal
	 **/
	public function create_account() {
		try {
			$nombre 	= $this->input->post('nombre');
		    $paterno 	= $this->input->post('paterno');
		    $materno 	= $this->input->post('materno');
			$personal 	= "$nombre $paterno $materno";
			
			$data = array(
				'id_personal' 		=> $this->input->post('id_personal')
			    ,'id_rol' 			=> $this->input->post('id_rol')
			    ,'id_perfil' 		=> $this->input->post('id_perfil')
				,'email' 			=> $this->input->post('correo')
		 		,'dias_expiracion' 	=> $this->input->post('dias_expiracion')
			    ,'id_lang' 			=> $this->input->post('id_lang')
				,'personal' 		=> $personal
			);

			self::register_user($data);
			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('personales_created_user_success')
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

/* End of file Personales.php */
/* Location: ./application/controllers/admin/administracion/Personales.php */