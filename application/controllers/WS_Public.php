<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class WS_Public extends MY_Controller {

    function __construct() {
        parent::__construct();
        
    }

    public function index() {
        echo "public site";
    }

}

/* End of file WS_Public.php */
/* Location: ./application/controllers/WS_Public.php */