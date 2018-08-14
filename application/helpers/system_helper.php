<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 5H2
 * @version 1.0.1
 */

if (!function_exists('debug')) {
	/**
	 * Funcion para imprimir el debug php en 2 formas
	 * 1.- print_r 
	 * 2.- var_dump
	 * defaul 1
	 * @param $data Datos a imprimir cualquier tipo de dato.
	 * @param INT $type Forma de mostrar el dato var_dump o print_r
	 * @param Bollean $die bandera para finalizar el proceso TRUE/FALSE
	 */
	function debug($data, $type = 1, $die = TRUE) {
		echo "<pre>";
		if ($type === 2) {
			var_dump($data);
		} else {
			print_r($data);
		}
		echo "</pre>";

		if ($die) {
			die();
		}
	}
}


if (!function_exists('__exist_file')) {
    /**
     * Funcion para detectar si el archivo existe
     * @param String $view_path ruta del archivo
     * @return TRUE si existe el archivo, si no, FALSE
     */
    function __exist_file($file_path) {
    	if (!is_file($file_path)) {
            error_log('File not found --> '. $file_path);
			return FALSE;
    	}

    	return TRUE;
    }
}

if ( ! function_exists('set_exception')) {
	/**
	 * generamos la excepcion 
	 * @param String $msg description
	 * @param Intedger $code description
	 * @param Boolean $previous description
	 **/
	function set_exception($msg="", $code=0, $previous=NULL) {
		$message = $msg ? $msg : lang('general_throw_xception');
		throw new Exception($message, $code, $previous);
	}
}

if ( ! function_exists('custom_mkdir')) {
	function custom_mkdir($pathname="assets/tmp", $mode=0444, $recursive=FALSE) {
		if ( ! file_exists($pathname)) {
			$create_dir = mkdir($pathname, (int)$mode, $recursive);
			chmod($pathname, (int)$mode);
			return $create_dir;

		}
	}
}

/* End of file system_helper.php */
/* Location: ./application/helpers/system_helper.php */