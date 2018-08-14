<?php 
(defined('BASEPATH')) OR exit('No direct script access allowed');

class Languages_model extends MY_Model { 

	public function get_lang($lang = FALSE) { 
		$tbl = $this->tbl;
		$lang ? $this->db->where('lang', $lang) : FALSE;
		$result = $this->db->select('*')
			->from($tbl['languages'])
			->where('activo', 1)
			->get();

		return $result->result_array();
	}
}
/* End of file Languages_model.php */
/* Location: ./application/models/Languages_model.php */