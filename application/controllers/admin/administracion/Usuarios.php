<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->path = "admin/administracion/usuarios";

		//Load models
		$this->load->model('Roles_model', 'db_roles');
		$this->load->model('catalogos/Perfiles_model', 'db_perfiles');
		$this->load->model('administracion/usuarios_model', 'db_usuarios');
	}

	/**
	 * Metodo principal para el acceso al sistema SICAH
	 */
	public function index() { 
		//labels
		$data_view['title'] 					= lang('menu_admin');
		$data_view['subtitle'] 					= lang('menu_usuarios');
		$data_view['usuario_username'] 			= lang('usuario_username');
		$data_view['personales_rol'] 			= lang('personales_rol');
		$data_view['personales_perfil'] 		= lang('personales_perfil');
		$data_view['personales_language'] 		= lang('personales_language');
		$data_view['personales_dias_expiracion'] = lang('personales_dias_expiracion');
		$data_view['general_required_fields'] 	= lang('general_required_fields');
		$data_view['personales_msg_expiracion'] = lang('personales_msg_expiracion');
		$data_view['general_cancelar'] 			= lang('general_cancelar');
		$data_view['general_guardar'] 			= lang('general_guardar');
		$data_view['personales_correo'] 		= lang('personales_correo');
		$data_view['usuario_userdata'] 			= lang('usuario_userdata');

		//data
		$data_view['select_roles'] 		= self::build_select_roles();
		$data_view['select_langs'] 		= $this->build_select_langs();
		$data_view['select_perfiles'] 	= self::build_select_perfiles();
		$data_view['data_table'] = self::build_table_main();
		$data_view['modal_edit'] = $this->view_unique($this->path."/user_account_modal", $data_view);

		$includes['footer']['js'][] = array( 'url' => 'js/usuarios', 'name' => 'Table_events');
		$this->load_view($this->path."/usuarios_view", $data_view, $includes);
	}

	/**
	 * Función para la creación de la tabla principal de los usuarios
	 */
	private function build_table_main() {
		$rows = $this->db_usuarios->get_usuarios();
		$data = array();
		$title 	= array(
			lang('general_id')
			,lang('usuario_username')
			,lang('usuario_email')
			,lang('usuario_rol')
			,lang('usuario_perfil')
			,lang('usuario_short_key')
			,lang('usuario_inicio')
			,lang('general_actions')
		);

		if ($rows) {
			foreach ($rows as $row) {
				$data[] = self::build_row($row);
			}
		}

		$data_table = array(
			'head' 		=> $title
			,'rows' 	=> $data
			,'id' 		=> 'table-main'
			,'attr_data' => array('id_usuario', 'username', 'email')
		);
		
		return Datatable($data_table);
	}

	private function build_row($row) {
		$actions = array(
			array(
				'tooltip' 	=> lang('general_editar')
				,'class' 	=> 'btn-warning edit'
				,'icon'		=> '<i class="material-icons">edit</i>'
				,'data' 	=> array(
					'id_perfil' => $row['id_perfil']
					,'id_rol' 	=> $row['id_rol']
					,'id_lang' 	=> $row['id_lang']
				)
			)
			,array(
				'tooltip' 	=> lang('general_borrar')
				,'class'	=> 'btn-danger drop'
				,'icon'		=> '<i class="material-icons">delete</i>'
			)
		);
		$data = array(
			'id_usuario' 	=> $row['id_usuario']
    		,'username' 	=> $row['username']
    		,'email' 		=> $row['email']
    		,'rol' 			=> $row['rol']
    		,'perfil' 		=> $row['perfil']
    		,'short_key' 	=> $row['short_key']
    		,'inicio' 		=> $row['inicio']
    		,'actions' 		=> build_actions($actions)
		);

		return $data;
	}

	/**
	 * Función para hacer el eliminado logico del usuario
	 **/
	public function process_drop() {
		try { 
			$this->db->trans_begin();
			$sql_data = array(
				'id_usuario' 	=> $this->input->post('id_usuario')
				,'activo' 		=> 0
			);
			
			$update = $this->db_usuarios->update_user($sql_data);
			$update OR set_exception();

			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('usuario_drop_account_success')
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
	 * Proceso para la actualización de datos del usuario
	 **/
	public function process_update() {
		try {
			$sql_data = array(
				'id_usuario' 		=> $this->input->post('id_usuario')
			    ,'username' 		=> $this->input->post('username')
			    ,'id_rol' 			=> $this->input->post('id_rol')
			    ,'id_perfil' 		=> $this->input->post('id_perfil')
			    ,'id_lang' 			=> $this->input->post('id_lang')
			    ,'dias_expiracion' 	=> $this->input->post('dias_expiracion')
			);
			$update = $this->db_usuarios->update_user($sql_data);
			$update OR set_exception();

			//GET ROW DATA USER WITH NEW DATA
			$rows = $this->db_usuarios->get_usuarios($sql_data);
			$row  = self::build_row($rows[0]);

			$response = array(
				'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('usuario_update_success')
				,'type' 	=> 'success'
				,'row' 		=> $row
				// ,'row' 		=> '<tr><td>'.implode('</td><td>', $row).'</td></tr>'
			);
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

}

/* End of file Usuarios.php */
/* Location: ./application/controllers/admin/administracion/Usuarios.php */
