<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empleados_model extends MY_Model {

	public function get_empleados_empresa($data=array()) {
		$tbl = $this->tbl;

		isset($data['id_empresa']) 	AND $this->db->where('TEE.id_empresa', $data['id_empresa']);
		isset($data['id_sucursal']) AND $this->db->where('TEE.id_sucursal', $data['id_sucursal']);
		isset($data['id_personal']) AND $this->db->where('TEE.id_personal', $data['id_personal']);
		$request = $this->db->select("*, CONCAT_WS(' ', SP.nombre, SP.paterno, SP.materno) AS full_name")
			->from("$tbl[empresas_empleados] AS TEE")
			->join("$tbl[sucursales] AS TS", 'TEE.id_sucursal = TS.id_sucursal', 'INNER')
			->join("$tbl[personales] AS SP", 'TEE.id_personal = SP.id_personal', 'INNER')
			->where('TEE.activo', 1)
			->where('TS.activo', 1)
			->where('SP.activo', 1)
			->get();

		return $request->result_array();
	}

	public function get_empleados_disponibles(array $data) {
		$tbl = $this->tbl;

		$request = $this->db->select("
				 SP.*
				,SM.*
				,SL.*
				,CONCAT_WS(' ', SP.nombre, SP.paterno, SP.materno) AS full_name")
			->from("$tbl[personales] AS SP")
			->join("$tbl[municipios] AS SM", 'SP.id_municipio = SM.id_municipio', 'INNER')
			->join("$tbl[localidades] AS SL", 'SP.id_localidad = SL.id_localidad', 'INNER')
			->join("$tbl[empresas_empleados] AS TEE", "TEE.id_personal = SP.id_personal AND TEE.id_empresa = $data[id_empresa] AND TEE.activo = 1", 'LEFT')
			->where('SP.activo', 1)
			->where('TEE.id_personal', NULL)
			->get();

		return $request->result_array();
	}

	public function insert_empleado_empresa(array $data, $batch=FALSE) {
		$tbl = $this->tbl;

		$batch ? $this->db->insert_batch($tbl['empresas_empleados'], $data) : $this->db->insert($tbl['empresas_empleados'], $data);
		$error = $this->db->error();
		$id_last = $this->db->insert_id();

		if (!$error['message']) {
			$this->register_log();
			return $batch ? TRUE : $id_last;
		}

		return FALSE;
	}

	public function update_empleado_empresa(array $data) {
		$tbl = $this->tbl;

		isset($data['id_empresa_empleado']) AND $this->db->where('id_empresa_empleado', $data['id_empresa_empleado']);
		isset($data['id_empresa']) 			AND $this->db->where('id_empresa', $data['id_empresa']);
		isset($data['id_sucursal']) 		AND $this->db->where('id_sucursal', $data['id_sucursal']);
		isset($data['id_personal']) 		AND $this->db->where('id_personal', $data['id_personal']);
		$this->db->update($tbl['empresas_empleados'], $data);
		$error = $this->db->error();

		if (!$error['message']) {
			$this->register_log();
			return TRUE;
		}

		return FALSE;
	}
}

/* End of file Empleados_model.php */
/* Location: ./application/models/Empleados_model.php */