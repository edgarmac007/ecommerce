<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empresas extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->path = "admin/empresas";

		//Load models
		$this->load->model('empresas_model', 'db_empresas');
	}

	public function index() {
		//LABELS
		$data_view['title'] 					= lang('menu_admin');
		$data_view['subtitle'] 					= lang('menu_empresas');
		
		//DATA
		$data_view['data_table'] = self::build_table_empresas();

		//load view
		$includes['footer']['js'][] = array( 'url' => 'js/empresas', 'name' => 'Table_events');
		$this->load_view($this->path."/list-empresas", $data_view, $includes);
	}

	/**
	 * Función para la creación de la tabla principal de los usuarios
	 */
	private function build_table_empresas() {
		$rows = $this->db_empresas->get_empresas();
		$data = array();
		$title 	= array(
			lang('general_id')
			,lang('empresas_empresa')
			,lang('empresas_razon_social')
			,lang('empresas_rfc')
			,lang('general_actions')
		);

		foreach ($rows as $row) {
			$data[] = array(
				 'id_empresa' 	=> $row['id_empresa']
				,'empresa' 		=> $row['empresa']
				,'razon_social' => $row['razon_social']
				,'rfc' 			=> $row['rfc']
				,'action' 		=> self::build_icon_empresas($row)
			);
		}

		$data_table = array(
			 'head' 		=> $title
			,'rows' 		=> $data
			,'id' 			=> 'table-main'
			,'attr_data' 	=> array('id_empresa', 'empresa')
		);
		
		return Datatable($data_table);
	}

	private function build_icon_empresas(array $data) {
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
			)
		);

		return build_actions($buttons);
	}

	/**
	 * Carga del formulario para el registro de nuevas empresas
	 * @return  Void string
	 **/
	public function new_empresas() {
		//labels
		$data_view['title'] 					= lang('menu_empresas');
		$data_view['general_required_fields'] 	= lang('general_required_fields');
		$data_view['empresas_datos_empresa'] 	= lang('empresas_datos_empresa');
		$data_view['general_municipio'] 		= lang('general_municipio');
		$data_view['general_localidad'] 		= lang('general_localidad');
		$data_view['general_guardar'] 			= lang('general_guardar');
		$data_view['empresas_empresa'] 			= lang('empresas_empresa');
		$data_view['empresas_razon_social']		= lang('empresas_razon_social');
		$data_view['empresas_rfc'] 				= lang('empresas_rfc');
		$data_view['empresas_calle'] 			= lang('empresas_calle');
		$data_view['general_cancelar'] 			= lang('general_cancelar');
		$data_view['empresas_num_calle'] 		= lang('empresas_num_calle');
		$data_view['empresas_telefono'] 		= lang('empresas_telefono');

		//DATA
		$params = array('required'=>TRUE);
		$data_view['select_municipios'] 		= $this->build_select_municipios($params);
		$params['id_municipio'] = 0;
		$data_view['select_localidades'] 		= $this->build_select_localidades($params);

		$includes['footer']['js'][] = array( 'url' => 'js/empresas', 'name' => 'Form_validate');
		$this->load_view($this->path."/new_empresa", $data_view, $includes);
	}

	/**
	 * Proceso para el guardado de los datos de la nueva empresa
	 **/
	public function process_save_empresa() {
		try {
			$sql_data = array(
				 'id_municipio' 	=> $this->input->post('id_municipio')
			    ,'id_localidad' 	=> $this->input->post('id_localidad')
			    ,'empresa' 			=> $this->input->post('empresa')
			    ,'razon_social' 	=> $this->input->post('razon_social')
			    ,'rfc' 				=> $this->input->post('rfc')
			    ,'calle' 			=> $this->input->post('calle')
			    ,'num_calle' 		=> $this->input->post('num_calle')
			    ,'telefono' 		=> $this->input->post('telefono')
			    ,'id_usuario' 		=> $this->session->userdata('id_usuario')
			);

			$exist 	= $this->db_empresas->get_empresas($sql_data);
			$exist AND set_exception(lang('empresas_duplicate'));

			$insert = $this->db_empresas->insert_empresa($sql_data);
			$insert OR set_exception();

			$response = array(
				 'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('empresas_save_success')
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
	 * Proceso para la eliminacion de la empresa
	 **/
	public function process_drop_empresa() {
		try {
			$sql_data = array(
				 'id_empresa' 		=> $this->input->post('id_empresa')
			    ,'id_usuario_edit' 	=> $this->session->userdata('id_usuario')
				,'activo' 			=> 0
			);
			$update = $this->db_empresas->update_empresa($sql_data);
			$update OR set_exception();

			$response = array(
				 'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('empresas_delete_success')
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
	 * Cargamos el formulario para la edicion de la empresa
	 **/
	public function edit_empresas() {
		$_POST OR redirect(base_url('admin/empresas'), 'refresh');
		//labels
		$data_view['title'] 					= lang('menu_empresas');
		$data_view['general_required_fields'] 	= lang('general_required_fields');
		$data_view['empresas_datos_empresa'] 	= lang('empresas_datos_empresa');
		$data_view['general_municipio'] 		= lang('general_municipio');
		$data_view['general_localidad'] 		= lang('general_localidad');
		$data_view['general_guardar'] 			= lang('general_guardar');
		$data_view['empresas_empresa'] 			= lang('empresas_empresa');
		$data_view['empresas_razon_social']		= lang('empresas_razon_social');
		$data_view['empresas_rfc'] 				= lang('empresas_rfc');
		$data_view['empresas_calle'] 			= lang('empresas_calle');
		$data_view['general_cancelar'] 			= lang('general_cancelar');
		$data_view['empresas_num_calle'] 		= lang('empresas_num_calle');
		$data_view['empresas_telefono'] 		= lang('empresas_telefono');

		//DATA
		$sql_data 	= $this->input->post();
		$data 		= $this->db_empresas->get_empresas($sql_data);
		$data_view 	= array_merge($data_view, $data[0]);
		$params = array(
			 'required' => TRUE
			,'selected' => $data[0]['id_municipio']
		);
		$data_view['select_municipios'] 		= $this->build_select_municipios($params);
		$params['id_municipio'] = $data[0]['id_municipio'];
		$params['selected'] 	= $data[0]['id_localidad'];
		$data_view['select_localidades'] 		= $this->build_select_localidades($params);

		$includes['footer']['js'][] = array( 'url' => 'js/empresas', 'name' => 'Form_validate');
		$this->load_view($this->path."/edit_empresa", $data_view, $includes);
	}

	/**
	 * Proceso para la edición de la empresa
	 **/
	public function process_edit_empresa() {
		try {
			$sql_data = array(
				 'update' 			=> $this->input->post('id_empresa')
				,'id_municipio' 	=> $this->input->post('id_municipio')
			    ,'id_localidad' 	=> $this->input->post('id_localidad')
			    ,'empresa' 			=> $this->input->post('empresa')
			    ,'razon_social' 	=> $this->input->post('razon_social')
			    ,'rfc' 				=> $this->input->post('rfc')
			    ,'calle' 			=> $this->input->post('calle')
			    ,'num_calle' 		=> $this->input->post('num_calle')
			    ,'telefono' 		=> $this->input->post('telefono')
			    ,'id_usuario_edit' 	=> $this->session->userdata('id_usuario')
			);

			$exist 	= $this->db_empresas->get_empresas($sql_data);
			$exist AND set_exception(lang('empresas_duplicate'));
			unset($sql_data['update']);

			$sql_data['id_empresa'] = $this->input->post('id_empresa');
			$update = $this->db_empresas->update_empresa($sql_data);
			$update OR set_exception();

			$response = array(
				 'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('empresas_edit_success')
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

/* End of file Empresas.php */
/* Location: ./application/controllers/admin/Empresas.php */