<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Personales_model extends MY_Model {

	public function get_personales($data = array()) {
		$tbl = $this->tbl;

		isset($data['id_personal']) ? $this->db->where('id_personal', $data['id_personal']) : FALSE;

		$result = $this->db->select('*, TU.activo AS user_activo')
					->from("$tbl[personales] AS TP")
					->join("$tbl[usuarios] AS TU", "id_personal", "LEFT")
					->where('TP.activo', 1)
					->order_by('nombre, paterno, materno')
					->get();

		if ($result->num_rows()) {
			return  $result->result_array();
		}

		return FALSE;
	}

	public function exist_personal($data = array()) {
		$tbl = $this->tbl;

		isset($data['id_personal']) 	? $this->db->where('id_personal !=', $data['id_personal']) : FALSE;
		isset($data['correo_personal']) ? $this->db->where('correo_personal', $data['correo_personal']) : FALSE;
		isset($data['correo_emp']) 		? $this->db->where('correo_emp', $data['correo_emp']) : FALSE;
		$result = $this->db->select('*')
					->where('activo', 1)
					->get($tbl['personales']);

		if($result->num_rows()) {
			return $result->row_array();
		}

		return FALSE;
	}

	public function insert_personal($data) {
		$tbl = $this->tbl;
		if (is_array($data)) {
			$this->db->insert($tbl['personales'], $data);
			$error = $this->db->error();
			$id_last = $this->db->insert_id();
			if ( ! $error['message']) {
				$this->register_log();
				return $id_last;
			}
		}

		return FALSE;
	}

	public function update_personal($data) {
		$tbl = $this->tbl;

		$this->db->where('id_personal', $data['id_personal'])
				->update($tbl['personales'], $data);
		$error = $this->db->error();
		if ( ! $error['message']) {
			$this->register_log();
			return TRUE;
		}

		return FALSE;
	}
}

/* End of file Personales_model.php */
/* Location: ./application/models/administracion/Personales_model.php */