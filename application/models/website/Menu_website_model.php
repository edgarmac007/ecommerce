<?php 
(defined('BASEPATH')) OR exit('No direct script access allowed');
class Menu_website_model extends MY_Model { 

	public function get_menus(){
		$tbl = $this->tbl;
		$result = $this->db->get_where($tbl['menu_website'],array(
			'activo' =>1
		));
		if ($result->num_rows()) {
			return $result->result_array();
		}
		return NULL;


	}

}
