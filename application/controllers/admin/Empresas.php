<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empresas extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->path = "admin/empresas";

		//Load models
		$this->load->model('empresas_model', 'db_empresas');
		$this->load->model('sucursales_model', 'db_sucursales');
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
				'tooltip' 	=> lang('empresas_sucursales')
				,'class'	=> 'btn-info list-sucursales'
				,'icon'		=> '<i class="material-icons">business</i>'
			)
			,
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

	/**
	 * Cargamos la lista de las sucursales registrados en la empresa
	 **/
	public function list_sucursales($id_empresa=FALSE) {
		$_POST OR $id_empresa OR redirect(base_url('admin/empresas'), 'refresh');
		$id_empresa AND $_POST['id_empresa'] = $id_empresa;

		//LABELS
		$data_view['title'] 					= lang('menu_admin');
		$data_view['subtitle'] 					= lang('empresas_sucursales');
		
		//DATA
		$data_view['data_table'] = self::build_table_sucursale();
		$data_view['id_empresa'] = $this->input->post('id_empresa');

		//load view
		$includes['footer']['js'][] = array( 'url' => 'js/sucursales', 'name' => 'Table_events');
		$this->load_view($this->path."/list-sucursales", $data_view, $includes);
	}

	/**
	 * Generamos la lista de las sucursale de la empresa
	 **/
	private function build_table_sucursale() {
		$sql_data 	= $this->input->post();
		$rows 		= $this->db_sucursales->get_sucursales($sql_data);
		$title 		= array(
			 lang('general_id')
			,lang('general_municipio')
			,lang('general_localidad')
			,lang('empresas_sucursal')
			,lang('empresas_calle')
			,lang('empresas_num_calle')
			,lang('empresas_telefono')
			,lang('general_actions')
		);

		$data = array();
		foreach ($rows as $row) {
			$data[] = array(
				 'id_sucursal' 	=> $row['id_sucursal']
				,'municipio' 	=> $row['municipio']
				,'localidad' 	=> $row['localidad']
				,'sucursal' 	=> $row['sucursal']
				,'calle' 		=> $row['calle']
				,'num_calle' 	=> $row['num_calle']
				,'telefono' 	=> $row['telefono']
				,'action' 		=> '' //self::build_icon_sucursales($row)
			);
		}

		$data_table = array(
			 'head' 		=> $title
			,'rows' 		=> $data
			,'id' 			=> 'table-main'
			,'attr_data' 	=> array('id_id_sucursal', 'sucursal')
		);
		
		return Datatable($data_table);
	}

	/**
	 * Cargamos la vista para registrar nuevas sucursales de la empresa
	 **/
	public function new_sucursal($id_empresa=FALSE) {
		$id_empresa OR redirect(base_url('admin/empresas'), 'refresh');
		$sql_data['id_empresa'] = $id_empresa;
		$data = $this->db_empresas->get_empresas($sql_data);
		count($data) OR redirect(base_url('admin/empresa'), 'refresh');

		//labels
		$data_view['title'] 					= lang('menu_empresas');
		$data_view['general_required_fields'] 	= lang('general_required_fields');
		$data_view['empresas_datos_sucursal'] 	= lang('empresas_datos_sucursal');
		$data_view['general_municipio'] 		= lang('general_municipio');
		$data_view['general_localidad'] 		= lang('general_localidad');
		$data_view['general_guardar'] 			= lang('general_guardar');
		$data_view['empresas_empresa'] 			= lang('empresas_empresa');
		$data_view['empresas_razon_social']		= lang('empresas_razon_social');
		$data_view['empresas_sucursal'] 		= lang('empresas_sucursal');
		$data_view['empresas_calle'] 			= lang('empresas_calle');
		$data_view['general_cancelar'] 			= lang('general_cancelar');
		$data_view['empresas_num_calle'] 		= lang('empresas_num_calle');
		$data_view['empresas_telefono'] 		= lang('empresas_telefono');

		//DATA
		$data_view = array_merge($data_view, $data[0]);
		$params = array('required'=>TRUE);
		$data_view['select_municipios'] 		= $this->build_select_municipios($params);
		$params['id_municipio'] = 0;
		$data_view['select_localidades'] 		= $this->build_select_localidades($params);

		$includes['footer']['js'][] = array( 'url' => 'js/sucursales', 'name' => 'Form_validate');
		$this->load_view($this->path."/new_sucursal", $data_view, $includes);
	}

	/**
	 * Proceso para guardar la nueva sucursal
	 **/
	public function process_save_sucursal() {
		try {
			$sql_data = array(
			     'id_empresa' 		=> $this->input->post('id_empresa')
				,'id_municipio' 	=> $this->input->post('id_municipio')
			    ,'id_localidad' 	=> $this->input->post('id_localidad')
			    ,'sucursal' 		=> $this->input->post('sucursal')
			    ,'calle' 			=> $this->input->post('calle')
			    ,'num_calle' 		=> $this->input->post('num_calle')
			    ,'telefono' 		=> $this->input->post('telefono')
			    ,'id_usuario' 		=> $this->session->userdata('id_usuario')
			);

			$exist 	= $this->db_sucursales->get_sucursales($sql_data);
			$exist AND set_exception(lang('empresas_duplicate'));

			$insert = $this->db_sucursales->insert_sucursal($sql_data);
			$insert OR set_exception();

			$response = array(
				 'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('empresas_sucursal_save_success')
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