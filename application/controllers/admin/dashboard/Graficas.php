<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Graficas extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->path = "admin/dashboard";

		//Load models
	}

	/**
	 * Metodo para cargar la vista del dashboard
	 */
	public function index() { 
		//LABELS
		$data_view['title'] 					= lang('menu_dashboard');
		$data_view['general_bienvenido'] 		= lang('general_bienvenido') . $this->vars['APP_TITLE'];
		
		//LOAD VIEW
		$this->load_view("{$this->path}/Graficas", $data_view);
	}
}

/* End of file Graficas.php */
/* Location: ./application/controllers/admin/dashboard/Graficas.php */