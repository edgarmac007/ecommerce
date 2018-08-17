<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empleados extends MY_Controller {

	public function __construct() {
		parent::__construct();
		$this->path = "admin/empleados";

		//Load models
	}

	public function index() {
		debug($_POST);
	}

}

/* End of file Empleados.php */
/* Location: ./application/controllers/admin/Empleados.php */