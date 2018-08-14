<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Roles_model extends MY_Model {

	public function get_roles($data=array()) {
		$tbl = $this->tbl;

		isset($data['id_rol']) ? $this->db->where('id_rol', $data['id_rol']) : FALSE;
		$result = $this->db->select('*')
					->where('activo', 1)
					->get($tbl['roles']);

		if ($result->num_rows()) {
			return $result->result_array();
		}

		return FALSE;
	}

}

/* End of file Roles_model.php */
/* Location: ./application/models/Roles_model.php */