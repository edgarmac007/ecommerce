<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inicio extends MY_Controller {
   
    public function __construct() {
        parent::__construct();
    }

    public function index() {
        echo "site public";
    }

}

/* End of file Inicio.php */
/* Location: ./application/controllers/public/Inicio.php */