<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * Classe para la carga de todas las etiquetas del lenguaje del sistema
 *
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 CORE CI
 * @version 1.0.1
 */

class Authentication { 

	private $CI;
	public function __construct() {
    	$this->CI =& get_instance();
		!$this->CI->load->library('session') ? $this->CI->load->library('session') : FALSE;
		!$this->CI->load->helper('url') ? $this->CI->load->helper('url') : FALSE;
    }

    public function loginCheck(){ 
        $CI         = $this->CI;
        $free_sites =  array(
            'admin'
            ,'admin/process_auth'
            ,'admin/process_restart_password'
        );
        $auth_required  = $CI->uri->segment(1);
        $uri            = $CI->uri->uri_string();
        $is_logged      = $CI->session->userdata('id_usuario');
        $inicio         = $CI->session->userdata('inicio');

        if ($auth_required == 'admin') {
            //SI ESTA LOGUEADO E INTENTA ENTRARA AL LOGIN, REDIRECCIONA A INICIO
            if ($is_logged AND $uri == 'admin') {
                redirect(base_url('admin/dashboard'));
            }

            //SI ES UNA PETICIÓN AJAX, RETORNA LA BANDERA DE SESSION DESTROY
            if (!$is_logged AND $CI->input->is_ajax_request() AND !in_array($uri, $free_sites)) {
                echo json_encode(array('session_destroy' => TRUE));
                die();
            }
            
            //SI SE ESTA DIRIJIENDO A UNA PÁGINA DIFERENTE DE LAS PÁGINAS LIBRES, REDIRECCIONA AL LOGIN
            if (!$is_logged AND ! in_array($uri, $free_sites) AND !preg_match("/^admin\/restart_password\/.*/", $uri)) {
              redirect(base_url('admin'));
              die();
            }
    	}
	}
}

/* End of file Authentication.php */
/* Location: ./application/hooks/Authentication.php */