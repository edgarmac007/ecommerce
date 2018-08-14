<?php 
(defined('BASEPATH')) OR exit('No direct script access allowed');

class Auth_model extends MY_Model { 

	/**
	 * Función para obtener los datos del acceso del usuario
	 * @param $data Array datos para el acceso del sistema
	 * @return row_array Array datos del usuario, si no, FALSE
	 */
	public function get_auth($data) { 
		$tbl = $this->tbl;
		isset($data['id_usuario']) ? $this->db->where('id_usuario', $data['id_usuario']) : FALSE;
		isset($data['password']) ? $this->db->where('password', $data['password']) : FALSE;

		if (isset($data['username'])) {
			$this->db->group_start()
				->where('username', $data['username'])
			    ->or_where('email', $data['username'])
		    	->group_end();
		}

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
			->where('activo', 1)
			->get();

		if ($request->num_rows()) {
			return $request->row_array();
		}

		return FALSE;
	}

	/** 
	 * Función para el registro del acceso al sistema
	 */
	public function set_auth($data){
		$tbl = $this->tbl;
        $this->db->insert($tbl['log'], $data);
        $error = $this->db->error();
        if ( ! $error['message']) {
        	return TRUE;
        }

        return FALSE;
    }
}
/* End of file Auth_model.php */
/* Location: ./application/models/Auth_model.php */