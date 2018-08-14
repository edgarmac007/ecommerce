<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * Classe para la carga de todas las variables de configuración del sistema
 *
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 5H2
 * @version 1.0.1
 */

class Load_vars { 

	var $vars = array();
	public function __construct($file_name = FALSE) {
    	$file_name OR die();
        
		return self::initialize($file_name);
	}

    private function initialize($file_name){
		$dir_path = APPPATH."cfg/$file_name.cfg";
		if (file_exists($dir_path)) {
			$lines = file($dir_path, FILE_IGNORE_NEW_LINES);
            foreach ($lines as $line) {
            	if (!empty($line) AND strpos($line, '#') !== 0 AND strstr($line, '=')) {
            		list($index, $value) = explode('=', $line);
            		$new_var = array($index => $value);
            		$this->vars = array_merge($this->vars, $new_var);
            	}
            }
		}
	}
}

/* End of file Load_vars.php */
/* Location: ./application/libraries/Load_vars.php */

?>