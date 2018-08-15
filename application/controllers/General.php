<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class General extends MY_Controller {
	function __construct() {
		parent::__construct();
		
	}

    public function upload_img() { 
    	//CONFIG UPLOAD IMG
    	$file_data = [
    		 'upload_path' 	=> $this->vars['PATH_UPLOAD_IMG']
			,'file_name' 	=> 'file'
    	];
    	$upload = $this->save_file($file_data);

    	if (! $upload['success']){
    		$response = [
    			'success' 	=> FALSE
    			,'error' 	=> $upload['msg']
    		];
    	} else{
    		$response = [
    			 'success' 	=> TRUE
    			,'link'  	=> base_url($upload['upload_path'])
    		];
    	}

    	echo json_encode($response);
    }

    public function load_localidades_ajax(){
        $sql_data = array(
            'id_municipio'  => $this->input->post('id_municipio')
        );

        echo $this->build_select_localidades($sql_data);
    }
}

/* End of file General.php */
/* Location: ./application/controllers/General.php */