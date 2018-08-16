<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sucursales_model extends MY_Model {

	public function get_sucursales($data=array()) {
		$tbl = $this->tbl;

		isset($data['update']) 		AND $this->db->where('TS.id_sucursal !=', $data['update']);
		isset($data['id_sucursal']) AND $this->db->where('TS.id_sucursal', $data['id_sucursal']);
		isset($data['id_empresa']) 	AND $this->db->where('TS.id_empresa', $data['id_empresa']);
		isset($data['sucursal']) 	AND $this->db->where('TS.sucursal', $data['sucursal']);
		$request = $this->db->select("TS.*
				,SM.municipio
				,SL.localidad
			", FALSE)
			->from("$tbl[sucursales] AS TS")
			->join("$tbl[municipios] AS SM", 'TS.id_municipio = SM.id_municipio', 'INNER')
			->join("$tbl[localidades] AS SL", 'TS.id_localidad = SL.id_localidad AND SM.id_municipio = SL.id_municipio', 'INNER')
			->where('TS.activo', 1)
			->get();

		return $request->result_array();
	}

	public function insert_sucursal(array $data, $batch=FALSE) {
		$tbl = $this->tbl;

		$batch ? $this->db->insert_batch($tbl['sucursales'], $data) : $this->db->insert($tbl['sucursales'], $data);
		$error = $this->db->error();
		$id_last = $this->db->insert_id();

		if (!$error['message']) {
			$this->register_log();
			return $batch ? TRUE : $id_last;
		}

		return FALSE;
	}

	public function update_sucursal(array $data) {
		$tbl = $this->tbl;

		$this->db->where('id_sucursal', $data['id_sucursal'])
			->update($tbl['sucursales'], $data);
		$error = $this->db->error();

		if (!$error['message']) {
			$this->register_log();
			return TRUE;
		}

		return FALSE;
	}

}

/* End of file Sucursales_model.php */
/* Location: ./application/models/Sucursales_model.php */