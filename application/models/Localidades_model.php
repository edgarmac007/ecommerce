<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Localidades_model extends MY_Model {

	public function get_localidades($data=array()) {
		$tbl = $this->tbl;

		isset($data['id_localidad']) 	AND $this->db->where('id_localidad', $data['id_localidad']);
		isset($data['id_estado']) 		AND $this->db->where('id_estado', $data['id_estado']);
		isset($data['id_municipio']) 	AND $this->db->where('id_municipio', $data['id_municipio']);
		isset($data['codigo_postal']) 	AND $this->db->where('codigo_postal', $data['codigo_postal']);
		$request = $this->db->select("*
				,CONCAT(localidad, '(', codigo_postal, ')') AS custom_localidad
			", FALSE)
			->order_by('localidad')
			->get($tbl['localidades']);

		return $request->result_array();
	}

}

/* End of file Localidades_model.php */
/* Location: ./application/models/Localidades_model.php */