<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Municipios_model extends MY_Model {

	public function get_municipios($data=array()) {
		$tbl = $this->tbl;

		isset($data['id_municipio']) 	AND $this->db->where('id_municipio', $data['id_municipio']);
		isset($data['id_estado']) 		AND $this->db->where('id_estado', $data['id_estado']);
		$request = $this->db->select('*')
			->order_by('municipio')
			->get($tbl['municipios']);

		return $request->result_array();
	}

}

/* End of file Municipios_model.php */
/* Location: ./application/models/Municipios_model.php */