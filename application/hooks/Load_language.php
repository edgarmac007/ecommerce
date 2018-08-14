<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * Classe para la carga de todas las etiquetas del lenguaje del sistema
 *
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 CORE CI
 * @version 1.0.1
 */

class Load_language { 
	var $CI;

	public function __construct() {
    	$this->CI =& get_instance();
    }

    public function initialize(){
    	$CI = $this->CI;
		$default_lang 	= $CI->config->item('language');
		$lang_files 	= $CI->config->item('lang_files');
		$lang_files 	= array_unique($lang_files);
		$lang_folder	= $CI->session->userdata('short_key');
		$lang_folder 	= ($lang_folder ? $lang_folder : $default_lang);
		$CI->config->set_item('language', $lang_folder);

		$CI->lang->load($lang_files);
	}
}

/* End of file Load_language.php */
/* Location: ./application/hooks/Load_language.php */