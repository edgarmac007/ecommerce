<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empresas extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->path = "admin/empresas";

		//Load models
		$this->load->model('empresas_model', 'db_empresas');
		$this->load->model('empleados_model', 'db_empleados');
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
			,array(
				'tooltip' 	=> lang('general_empleados')
				,'class'	=> 'btn-success empleados'
				,'icon'		=> '<i class="material-icons">assignment_ind</i>'
			)
			,array(
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
		$data_view['general_regresar'] 			= lang('general_regresar');
		
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
				,'action' 		=> self::build_icon_sucursales($row)
			);
		}

		$data_table = array(
			 'head' 		=> $title
			,'rows' 		=> $data
			,'id' 			=> 'table-main'
			,'attr_data' 	=> array('id_sucursal', 'sucursal')
		);
		
		return Datatable($data_table);
	}

	/**
	 * Generamos los botones para las acciones de las sucursales de las empresas
	 **/
	protected function  build_icon_sucursales(array $data) {
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
	 * Cargamos la vista para registrar nuevas sucursales de la empresa
	 **/
	public function new_sucursal($id_empresa=FALSE) {
		$id_empresa OR redirect(base_url('admin/empresas'), 'refresh');
		$sql_data['id_empresa'] = $id_empresa;
		$data = $this->db_empresas->get_empresas($sql_data);
		count($data) OR redirect(base_url('admin/empresas'), 'refresh');

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

	/**
	 * Generamos el proceso de la eliminación de la sucursal
	 **/
	public function process_drop_sucursal() {
		try {
			$sql_data = array(
				 'id_sucursal' 		=> $this->input->post('id_sucursal')
			    ,'id_usuario_edit' 	=> $this->session->userdata('id_usuario')
				,'activo' 			=> 0
			);
			$update = $this->db_sucursales->update_sucursal($sql_data);
			$update OR set_exception();

			$response = array(
				 'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('empresas_sucursal_drop_success')
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
	 * Carga del formulario para la edición de la sucursal
	 **/
	public function edit_sucursal() {
		$_POST OR redirect(base_url('admin/empresas'), 'refresh');
		$sql_data['id_sucursal'] = $this->input->post('id_sucursal');
		$data_sucursal = $this->db_sucursales->get_sucursales($sql_data);
		$sql_data['id_empresa'] = $data_sucursal[0]['id_empresa'];
		$data_empresa = $this->db_empresas->get_empresas($sql_data);

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
		$data_view = array_merge($data_view, $data_empresa[0], $data_sucursal[0]);
		$params = array(
			 'required' => TRUE
			,'selected' => $data_sucursal[0]['id_municipio']
		);
		$data_view['select_municipios'] 		= $this->build_select_municipios($params);
		$params = array(
			 'required' 	=> TRUE
			,'id_municipio' => $data_sucursal[0]['id_municipio']
			,'selected' 	=> $data_sucursal[0]['id_localidad']
		);
		$data_view['select_localidades'] 		= $this->build_select_localidades($params);

		$includes['footer']['js'][] = array( 'url' => 'js/sucursales', 'name' => 'Form_validate');
		$this->load_view($this->path."/edit_sucursal", $data_view, $includes);
	}

	/**
	 * Proceso para la edición de los datos de la sucursal
	 **/
	public function process_edit_sucursal() {
		try {
			$sql_data = array(
				 'update' 			=> $this->input->post('id_sucursal')
				,'id_municipio' 	=> $this->input->post('id_municipio')
			    ,'id_localidad' 	=> $this->input->post('id_localidad')
			    ,'sucursal' 		=> $this->input->post('sucursal')
			    ,'calle' 			=> $this->input->post('calle')
			    ,'num_calle' 		=> $this->input->post('num_calle')
			    ,'telefono' 		=> $this->input->post('telefono')
			    ,'id_usuario_edit' 	=> $this->session->userdata('id_usuario')
			);

			$exist 	= $this->db_sucursales->get_sucursales($sql_data);
			$exist AND set_exception(lang('empresas_sucursal_duplicate'));
			unset($sql_data['update']);

			$sql_data['id_sucursal'] = $this->input->post('id_sucursal');
			$update = $this->db_sucursales->update_sucursal($sql_data);
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
	 * Cargamos la lista de los empleados que estan asignados a una sucursal
	 **/
	public function empleados() {
		$_POST OR redirect(base_url('empresas'), 'refresh');

		//LABELS
		$data_view['title'] 			= lang('menu_empresas');
		$data_view['subtitle'] 			= lang('empresas_empleados');
		$data_view['general_regresar'] 	= lang('general_regresar');
		
		//DATA
		$data_view['data_table'] = self::build_table_empleados();
		$data_view = array_merge($data_view, $this->input->post());

		//load view
		$includes['footer']['js'][] = array( 'url' => 'js/empleados', 'name' => 'Table_events');
		$this->load_view($this->path."/list-empleados", $data_view, $includes);
	}

	/**
	 * Generamos la lista de los empleados asignados a una sucursal
	 **/
	private function build_table_empleados() {
		$sql_data = $this->input->post();
		$rows = $this->db_empleados->get_empleados_empresa($sql_data);
		$data = array();
		$title 	= array(
			lang('general_id')
			,lang('empresas_sucursal')
			,lang('empresas_empleado')
			,lang('general_actions')
		);

		foreach ($rows as $row) {
			$buttons = array(
				array(
					'tooltip' 	=> lang('general_borrar')
					,'class'	=> 'btn-danger drop'
					,'icon'		=> '<i class="material-icons">delete</i>'
				)
			);

			$data[] = array(
				 'id_empresa_empleado' 	=> $row['id_empresa_empleado']
				,'sucursal' 			=> $row['sucursal']
				,'full_name' 			=> $row['full_name']
				,'action' 				=> build_actions($buttons)
			);
		}

		$data_table = array(
			 'head' 		=> $title
			,'rows' 		=> $data
			,'id' 			=> 'table-main'
			,'attr_data' 	=> array('id_empresa_empleado', 'full_name')
		);
		
		return Datatable($data_table);
	}

	public function load_empleados_ajax() {
		echo self::build_table_empleados();
	}

	/**
	 * Obtenemos el modal para la asignación de empleados
	 **/
	public function get_modal_asignacion_empleados() {
		//LABELS
		$data_view['general_guardar'] 				= lang('general_guardar');
		$data_view['general_cerrar'] 				= lang('general_cerrar');
		$data_view['empresas_asignacion_empleado'] 	= lang('empresas_asignacion_empleado');
		$data_view['empresas_message1'] 			= lang('empresas_message1');
		$data_view['empresas_empresa'] 				= lang('empresas_empresa');
		$data_view['empresas_sucursal'] 			= lang('empresas_sucursal');

		//DATA
		$sql_data 						= $this->input->post();
		$sql_data['required'] 			= TRUE;
		$data_view['select_sucursales'] = $this->build_select_sucursales($sql_data);
		$data_view['dataTable'] 		= $this->build_empleados_disponibles();
		$data_view 						= array_merge($data_view, $this->input->post());

		echo $this->view_unique($this->path."/asignacion_empleados_modal", $data_view);
	}

	private function build_empleados_disponibles() {
		$sql_data 	= $this->input->post();
		$rows 		= $this->db_empleados->get_empleados_disponibles($sql_data);

		$data 		= array();
		$title 	= array(
			 ''
			,lang('general_municipio')
			,lang('general_localidad')
			,lang('empresas_empleado')
		);

		foreach ($rows as $row) {
			$data[] = array(
				 '<div class="checkbox">
                    	<label>
                        	<input type="checkbox" name="empleado[]" value="'.$row['id_personal'].'">
                        	<span class="checkbox-material"><span class="check"></span></span>
                    	</label>
                	</div>'
				,$row['municipio']
				,$row['localidad']
				,$row['full_name']
			);
		}

		$data_table = array(
			 'head' 	=> $title
			,'rows' 	=> $data
			,'id' 		=> 'empleados-disponibles'
		);
		
		return Datatable($data_table);
	}

	/**
	 * Proceso para la asignación de empleados a la sucursal de la empresa
	 **/
	public function process_asignacion_empleados() {
		try {
			$empleados = $this->input->post('empleado');
			foreach ($empleados as $id_personal) {
				$sql_data[] = array(
					 'id_empresa' 	=> $this->input->post('id_empresa')
					,'id_sucursal' 	=> $this->input->post('id_sucursal')
					,'id_personal' 	=> $id_personal
					,'id_usuario' 	=> $this->session->userdata('id_usuario')
				);
			}

			$insert = $this->db_empleados->insert_empleado_empresa($sql_data, TRUE);
			$insert OR set_exception();

			$response = array(
				 'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('empresas_asignacion_save_success')
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
	 * Proceso para la desasignacion del empleado a una sucursal
	 **/
	public function process_drop_empleado() {
		try {
			$sql_data = array(
				 'id_empresa_empleado' 	=> $this->input->post('id_empresa_empleado')
			    ,'id_usuario_edit' 		=> $this->session->userdata('id_usuario')
				,'activo' 				=> 0
			);
			$update = $this->db_empleados->update_empleado_empresa($sql_data);
			$update OR set_exception();

			$response = array(
				 'success' 	=> TRUE
				,'title' 	=> lang('general_exito')
				,'msg' 		=> lang('empresas_delete_empleado_success')
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