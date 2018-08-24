<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Productos extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->path = "admin/productos";

		//Load models
	}

	public function index() {
		//LABELS
		$data_view['title'] 	= lang('menu_catalogos');
		$data_view['subtitle'] 	= lang('menu_productos');
		
		//load view
		$this->load_view($this->path."/mosaicos", $data_view);
	}

	public function add() {
		//labels
		$data_view['title'] 						= lang('menu_productos');
		$data_view['subtitle'] 						= lang('productos_registro');
		$data_view['general_required_fields'] 		= lang('general_required_fields');
		$data_view['productos_laboratorio'] 		= lang('productos_laboratorio');
		$data_view['productos_categoria'] 			= lang('productos_categoria');
		$data_view['productos_presentacion'] 		= lang('productos_presentacion');
		$data_view['productos_nombre_generico'] 	= lang('productos_nombre_generico');
		$data_view['productos_nombre_comercial'] 	= lang('productos_nombre_comercial');
		$data_view['productos_concentracion']		= lang('productos_concentracion');
		$data_view['productos_contenido'] 			= lang('productos_contenido');
		$data_view['general_guardar'] 				= lang('general_guardar');
		$data_view['general_regresar'] 				= lang('general_regresar');

		//DATA
		$params = array('required'=>TRUE);
		$data_view['select_municipios'] 		= $this->build_select_municipios($params);
		$params['id_municipio'] = 0;
		$data_view['select_localidades'] 		= $this->build_select_localidades($params);

		$includes['footer']['js'][] = array( 'url' => 'js/empresas', 'name' => 'Form_validate');
		$this->load_view($this->path."/new_producto", $data_view, $includes);
	}

}

/* End of file Productos.php */
/* Location: ./application/controllers/admin/Productos.php */