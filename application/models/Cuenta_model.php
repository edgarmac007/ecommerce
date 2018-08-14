<?php 
(defined('BASEPATH')) OR exit('No direct script access allowed');

class Cuenta_model extends MY_Model { 

	/**
	 * Funcion para verificar que el usuario o correo sea unico
	 * @param $data Array datos para el filtro
	 */
	public function email_unique($data) {
		if (is_array($data)) {
			$tbl = $this->tbl;
			isset($data['email']) 	? $this->db->where('email', $data['email']) : FALSE;
			isset($data['username']) ? $this->db->where('username', $data['username']) : FALSE;
			$result = $this->db->select("*")
					->where('id_usuario!=',$data['id_usuario'])
					->get($tbl['usuarios']);
				
			if (!$result->num_rows()) {
				return TRUE;
			}
		}

		return FALSE;
	}

    /** 
     * Función para actualizar los datos del usuario
     */
    public function user_update($data) {
    	if (is_array($data)) {
    		$tbl = $this->tbl;
    		$update = $this->db->where('id_usuario', $data['id_usuario'])
    					->update($tbl['usuarios'], $data);

    		$error = $this->db->error();
    		if (!$error['message']) {
				$this->register_log();
    			return TRUE;
    		}
    	}

    	return FALSE;
    }
}
/* End of file Cuenta_model.php */
/* Location: ./application/models/Cuenta_model.php */