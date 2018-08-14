<?php 
(defined('BASEPATH')) OR exit('No direct script access allowed');

class Menu_model extends MY_Model { 

	/** 
	 * Funcion para obtener el menu del usuario
	 * @param $position String posicion del menu a obtener HORIZONTAL/VERTICAL
	 * @param $id_usuario INT id del usuario logueado
	 */
	public function get_menu($position, $id_usuario = FALSE) {
		$tbl = $this->tbl;
		$id_usuario ? $this->db->where('TU.id_usuario', $id_usuario) : FALSE;
		$result = $this->db->select('SM.*')
			->from("$tbl[usuarios] AS TU")
			->join("$tbl[roles] AS CR", "id_rol", "INNER")
			->join("$tbl[perfiles] AS TP", "id_perfil", "LEFT")
			->join("$tbl[menus] AS SM", "FIND_IN_SET( SM.id_menu, IF(TU.id_rol=1, (SELECT GROUP_CONCAT(id_menu) FROM $tbl[menus] WHERE activo = 1), TP.id_menu ))", "LEFT", FALSE)
			->where('SM.posicion', $position)
			->where('SM.activo', 1)
			->order_by('SM.orden_menu, SM.orden_menu')
			->get();

		return $result->result_array();
	}

	/** 
	 * Funcion para obtener el menu para la creacion de perfiles
	 * @param $position String posicion del menu a obtener HORIZONTAL/VERTICAL
	 */
	public function get_menu_perfil($position) {
		$tbl = $this->tbl;
		$result = $this->db->select('*')
					->where('activo', 1)
					->where('posicion', $position)
					->get("$tbl[menus]");

		if ($result->num_rows()) {
			return $result->result_array();
		}

		return FALSE;
	}
}
/* End of file Menu_model.php */
/* Location: ./application/models/menu/Menu_model.php */