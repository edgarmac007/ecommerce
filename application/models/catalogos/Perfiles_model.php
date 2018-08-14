<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfiles_model extends MY_Model {

	public function get_perfiles($data = array()) {
		$tbl = $this->tbl;

		isset($data['id_perfil']) 	? $this->db->where('id_perfil', $data['id_perfil']) : FALSE;
		isset($data['perfil']) 		? $this->db->where('perfil', $data['perfil']) : FALSE;
		$result = $this->db->select('*')
					->where('activo', 1)
					->get($tbl['perfiles']);

		if($result->num_rows()) {
			return $result->result_array();
		}

		return FALSE;
	}

	public function exist_perfiles($data = array()) {
		$tbl = $this->tbl;

		isset($data['id_perfil']) 	? $this->db->where('id_perfil !=', $data['id_perfil']) : FALSE;
		isset($data['perfil']) 		? $this->db->where('perfil', $data['perfil']) : FALSE;
		$result = $this->db->select('*')
					->where('activo', 1)
					->get($tbl['perfiles']);

		if($result->num_rows()) {
			return $result->row_array();
		}

		return FALSE;
	}

	public function insert_perfil($data) {
		if (is_array($data)) {
			$tbl = $this->tbl;
			$this->db->insert($tbl['perfiles'], $data);
			$error = $this->db->error();
			if ( ! $error['message']) {
				$this->register_log();
				return TRUE;
			}
		}
		
		return FALSE;
	}

	public function update_perfiles($data) {
		if (is_array($data)) {
			$tbl = $this->tbl;
			$this->db->where('id_perfil', $data['id_perfil'])
					->update($tbl['perfiles'], $data);

			$error = $this->db->error();
			if (!$error['message']) {
				$this->register_log();
				return  TRUE;
			}
		}

		return  FALSE;
	}
}

/* End of file Perfiles_model.php */
/* Location: ./application/models/catalogos/Perfiles_model.php */