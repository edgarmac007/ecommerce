<?php 
(defined('BASEPATH')) OR exit('No direct script access allowed');

class Perfil_model extends MY_Model { 

	/**
	 * Funcion para verificar que el correo sea unico
	 * @param $data Array datos para el filtro
	 */
	public function email_unique($data) {
		if (is_array($data)) {
			$tbl = $this->tbl;
			$result = $this->db->select("*")
					->where('id_usuario!=',$data['id_usuario'])
					->where('email', $data['email'])
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
/* End of file Perfil_model.php */
/* Location: ./application/models/Perfil_model.php */