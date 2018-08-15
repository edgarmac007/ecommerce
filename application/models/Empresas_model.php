<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empresas_model extends MY_Model {

	public function get_empresas($data=array()) {
		$tbl = $this->tbl;

		isset($data['id_empresa']) 		AND $this->db->where('id_empresa', $data['id_empresa']);
		isset($data['empresa']) 		AND $this->db->where('empresa', $data['empresa']);
		isset($data['razon_social']) 	AND $this->db->where('razon_social', $data['razon_social']);
		$request = $this->db->select('*')
			->where('activo', 1)
			->get($tbl['empresas']);

		return $request->result_array();
	}

	public function insert_empresa(array $data, $batch=FALSE) {
		$tbl = $this->tbl;

		$batch ? $this->db->insert_batch($tbl['empresas'], $data) : $this->db->insert($tbl['empresas'], $data);
		$error = $this->db->error();
		$id_last = $this->db->insert_id();

		if (!$error['message']) {
			$this->register_log();
			return $batch ? TRUE : $id_last;
		}

		return FALSE;
	}

	public function update_empresa(array $data) {
		$tbl = $this->tbl;

		$this->db->where('id_empresa', $data['id_empresa'])
			->update($tbl['empresas'], $data);
		$error = $this->db->error();

		if (!$error['message']) {
			$this->register_log();
			return TRUE;
		}

		return FALSE;
	}
}

/* End of file Empresas_model.php */
/* Location: ./application/models/Empresas_model.php */