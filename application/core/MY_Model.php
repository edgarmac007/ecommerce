<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 5H2
 * @version 1.0.1
 */

class MY_Model extends CI_Model {

	protected $tbl;
	function __construct() { 
        parent::__construct();
        $Load_vars = new Load_vars('db');
        $vars 	= $Load_vars->vars;
        $db1 	= $vars['DATABASE1'];
        $db2 	= $vars['DATABASE2'];

        //SYSTEM
		$this->tbl['paises'] 		= "$db1.sys_paises";
		$this->tbl['estados'] 		= "$db1.sys_estados";
		$this->tbl['municipios'] 	= "$db1.sys_municipios";
		$this->tbl['localidades'] 	= "$db1.sys_localidades";
		$this->tbl['menus'] 		= "$db1.sys_menus";
		$this->tbl['languages'] 	= "$db1.sys_languages";
		$this->tbl['log'] 			= "$db1.sys_log";
		$this->tbl['usuarios'] 		= "$db1.sys_usuarios";
		$this->tbl['personales'] 	= "$db1.sys_personales";

		//CATALOGOS
		$this->tbl['perfiles'] 		= "$db1.cat_perfiles";
		$this->tbl['roles'] 		= "$db1.cat_roles";

		//TABLES
		$this->tbl['empresas'] 				= "$db1.tbl_empresas";
		$this->tbl['sucursales'] 			= "$db1.tbl_sucursales";
		$this->tbl['empresas_empleados'] 	= "$db1.tbl_empresas_empleados";


		//VIEWS
		$this->tbl['vw_peruser'] 	= "$db1.vw_personales_usuarios";

	}

	/**
	 * función para registrar el CRUD del system
	 */
	public function register_log($id_usuario=FALSE) {
		$tbl = $this->tbl;
		$id_usuario= $id_usuario ? $id_usuario : $this->session->userdata('id_usuario');
        $sql_data = array(
            'id_usuario'    => $id_usuario
            ,'ip_address'   => $_SERVER['REMOTE_ADDR']
            ,'user_agent'   => $_SERVER['HTTP_USER_AGENT']
            ,'evento'       => $this->db->last_query()
        );

        $this->db->insert($tbl['log'], $sql_data);
        $error = $this->db->error();
        if ( ! $error['message']) {
        	return TRUE;
        }

        return FALSE;
	}
}
/* End of file MY_Model.php */
/* Location: ./application/core/MY_Model.php */