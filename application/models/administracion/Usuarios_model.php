<?php 
(defined('BASEPATH')) OR exit('No direct script access allowed');

class Usuarios_model extends MY_Model { 

	/**
	 * Función para obtener los usuario del sistema
	 * @param $data Array datos para el filtro de la busqueda
	 * @return row_array Array registros de usuarios, si no, FALSE
	 */
	public function get_usuarios($data = array()) { 
		$tbl = $this->tbl;
		isset($data['id_usuario']) ? $this->db->where('id_usuario', $data['id_usuario']) : FALSE;
		isset($data['token']) ? $this->db->where('token', $data['token']) : FALSE;
		$request = $this->db
			->select('*')
			->from("(
				SELECT
					TP.id_personal
					,TU.id_usuario
					,TP.nombre
					,TP.paterno
					,TP.materno
					,TP.id_area
					,TP.correo_personal
					,TP.tel_movil
					,TP.tel_casa
					,TP.direccion
					,TP.id_estado
					,TP.id_municipio
					,TP.id_localidad
					,TP.codigo_postal
					,TP.fecha_nacimiento
					,TP.correo_emp
					,TP.correo_emp AS email
					,TP.tel_emp
					,TP.tel_movil_emp
					,TP.ext
					,TU.id_perfil
					,TPF.perfil
					,CR.id_rol
					,CR.rol
					,TU.username
					,TU.password
					,TU.id_lang
					,TU.token
					,SL.short_key
					,TU.inicio
					,TU.id_archivo
					,TU.activo
					,TU.dias_expiracion
					,TU.intentos_fallidos
					,(
						to_days(curdate()) - to_days(TU.update_pass)
					) AS dias_transcurridos
				FROM sys_personales TP
					LEFT JOIN sys_usuarios TU 
						ON TP.id_personal = TU.id_personal AND TU.activo = 1
					LEFT JOIN cat_roles CR 
						ON TU.id_rol = CR.id_rol
					LEFT JOIN sys_languages SL 
						ON TU.id_lang = SL.id_lang
					LEFT JOIN cat_perfiles TPF 
						ON TU.id_perfil = TPF.id_perfil
					LEFT JOIN tbl_archivos TA 
						ON TU.id_archivo = TA.id_archivo
			) AS TMP")
			->where('id_rol !=', 1)
			->where('activo', 1)
			->get();

		if ($request->num_rows()) {
			return $request->result_array();
		}

		return FALSE;
	}

	/**
	 * Función para obtener los usuario del sistema
	 * @param $data Array datos para el filtro de la busqueda
	 * @return row_array Array registros de usuarios, si no, FALSE
	 */
	public function get_usuario($data = array()) { 
		$tbl = $this->tbl;
		isset($data['id_usuario']) ? $this->db->where('id_usuario', $data['id_usuario']) : FALSE;
		isset($data['id_personal']) ? $this->db->where('id_personal', $data['id_personal']) : FALSE;
		isset($data['token']) ? $this->db->where('token', $data['token']) : FALSE;
		$request = $this->db
			->select('*')
			->from("(
				SELECT
					TP.id_personal
					,TU.id_usuario
					,TP.nombre
					,TP.paterno
					,TP.materno
					,TP.id_area
					,TP.correo_personal
					,TP.tel_movil
					,TP.tel_casa
					,TP.direccion
					,TP.id_estado
					,TP.id_municipio
					,TP.id_localidad
					,TP.codigo_postal
					,TP.fecha_nacimiento
					,TP.correo_emp
					,TP.correo_emp AS email
					,TP.tel_emp
					,TP.tel_movil_emp
					,TP.ext
					,TU.id_perfil
					,TPF.perfil
					,CR.id_rol
					,CR.rol
					,TU.username
					,TU.password
					,TU.id_lang
					,TU.token
					,SL.short_key
					,TU.inicio
					,TU.id_archivo
					,TU.activo
					,TU.dias_expiracion
					,TU.intentos_fallidos
					,(
						to_days(curdate()) - to_days(TU.update_pass)
					) AS dias_transcurridos
				FROM sys_personales TP
					LEFT JOIN sys_usuarios TU 
						ON TP.id_personal = TU.id_personal AND TU.activo = 1
					LEFT JOIN cat_roles CR 
						ON TU.id_rol = CR.id_rol
					LEFT JOIN sys_languages SL 
						ON TU.id_lang = SL.id_lang
					LEFT JOIN cat_perfiles TPF 
						ON TU.id_perfil = TPF.id_perfil
					LEFT JOIN tbl_archivos TA 
						ON TU.id_archivo = TA.id_archivo
			) AS TMP")
			->get();

		if ($request->num_rows()) {
			return $request->row_array();
		}

		return FALSE;
	}

	/**
	 * Función para la actualizaciónde datos
	 * @param $data Array datos para la actualización
	 * @return TRUE si se realizó con exito, si no, FALSE
	 */
	public function update_user($data) {
		if (is_array($data)) {
			$tbl = $this->tbl;
			$update = $this->db->where('id_usuario', $data['id_usuario'])
					->update($tbl['usuarios'], $data);

			$error = $this->db->error();
			if ( ! $error['message']) {
				$this->register_log($data['id_usuario']);
				return TRUE;
			}
		}
		return  FALSE;
	}

	/**
	 * Función para realizr el registro de un nuevo usuario
	 * @param $data Array Datos del nuevo usuario del sistema
	 * @return boolean TRUE en caso de exito, si no, FALSE
	 **/
	public function insert_user($data) {
		$tbl = $this->tbl;
		$this->db->insert($tbl['usuarios'], $data);

		$error = $this->db->error();
		if ( ! $error['message']) {
			$this->register_log();
			return TRUE;
		}

		return FALSE;
	}
}
/* End of file Usuarios_model.php */
/* Location: ./application/models/catalogos/Usuarios_model.php */