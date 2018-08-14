<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfiles extends MY_Controller {

		var $path;
	public function __construct() {
		parent::__construct();
		$this->path = 'admin/catalogos';

		//Load models
		$this->load->model('menu/Menu_model', 'db_menu');
		$this->load->model('catalogos/Perfiles_model', 'db_perfiles');
	}

	/**
	 * Funcion para cargar los perfiles existentes
	 */
	public function index() { 
		//labels
		$data_view['title'] 		= lang('menu_catalogos');
		$data_view['subtitle'] 		= lang('menu_perfiles');

		//DATA
		$data_view['data_table'] 	= self::build_table_main();

		$includes['footer']['js'][] = array( 'url' => 'js/perfiles', 'name' => 'Table_events');
		$this->load_view($this->path."/perfiles/perfiles_view", $data_view, $includes);
	}

	/**
	 * Función para la creación de la tabla principal de los perfiles
	 */
	private function build_table_main() {
		$rows = $this->db_perfiles->get_perfiles();
		$data = array();
		$title 	= array(
			lang('general_id')
			,lang('perfil_perfil')
			,lang('general_actions')
		);

		if ($rows) {
			foreach ($rows as $row) {
				$actions = array(
					array(
						'tooltip' => lang('general_editar')
						,'class'	=> 'btn-warning edit'
						,'icon'	=> '<i class="material-icons">mode_edit</i>'
					)
					,array(
						'tooltip' => lang('general_borrar')
						,'class'	=> 'btn-danger drop'
						,'icon'	=> '<i class="material-icons">delete</i>'
					)
				);
				$data[] = array(
					'id_perfil' 	=> $row['id_perfil']
            		,'perfil' 		=> $row['perfil']
            		,'actions' 		=> build_actions($actions)
				);
			}
		}

		$data_table = array(
			'head' 		=> $title
			,'rows' 	=> $data
			,'id' 		=> 'table-main'
			,'attr_data' => array('id_perfil')
		);
		
		return Datatable($data_table);
	}

	public function new_perfil_view() {
		//labels
		$data_view['title'] 			= lang('menu_perfiles');
		$data_view['perfil_menu_vert'] 	= lang('perfil_menu_vert');
		$data_view['perfil_menu_hori'] 	= lang('perfil_menu_hori');
		$data_view['perfil_perfil'] 	= lang('perfil_perfil');
		$data_view['general_guardar'] 	= lang('general_guardar');
		$data_view['general_cancelar'] 	= lang('general_cancelar');

		//data
		$data_view['menu_vertical'] 	= self::get_menu('VERTICAL');
		$data_view['menu_horizontal'] 	= self::get_menu('HORIZONTAL');
		
		$includes['header']['css'][] 	= array( 'url' => 'vendor/tree', 'name' => 'MultiNestedList');
		$includes['footer']['js'][] 	= array( 'url' => 'vendor/tree', 'name' => 'MultiNestedList');
		$includes['footer']['js'][] 	= array( 'url' => 'js/perfiles', 'name' => 'Form_validate');
		$this->load_view($this->path."/perfiles/new_perfil_view", $data_view, $includes);
	}

	private function get_menu($position, $menu = array()) {
		$data = $this->db_menu->get_menu_perfil($position);
		if (!$data) {
			return '';
		}

		$menu = self::build_menu_html($data, 0, $menu);
        return $menu;
	}

	/**
     * Función para construir el HTML del usuario logueado
     * @param $data Array menu
     * @param $id_padre INT id del padre del menu
     * @return HTML menu
     */
    private function build_menu_html($data, $id_padre = 0, $menu){
    	$list = '';
    	foreach ($data as $row) {
            if ($row['id_padre'] == $id_padre) {
                $label = lang($row['short_key']);
                $label = ($label ? $label : $row['short_key']);
                $checked = in_array($row['id_menu'], $menu) ? 'checked' : '';
                $label = "<input type='checkbox' name='id_menu[]' value='$row[id_menu]' $checked>$label";
                
                switch ($row['nivel']) {
                    case 'simple':
                        $link  = '<a href="#">';
                        $link .= $label;
                        $link .= '</a>';
                        break;
                
                    case 'padre':
                        $link  = '<a href="#">';
                        $link .= $label;
                        $link .= '</a>';
                        $link .= self::build_menu_html($data, $row['id_menu'], $menu);
                        break;

                    case 'hijo':
                        $link = '<a href="#">'.$label.'</a>';
                        break;
                }

                $list   .= '<li>';
                $list   .= $link;
                $list   .= '</li>';
            }
        }

        $ul = '<ul>';
        $ul .= $list;
        $ul .= '</ul>';

        return $ul;
    }

    /**
     * Función para el registro de un nuevo perfil
     */
    public function process_save() {
    	try {
	    	$menu 	= $this->input->post('id_menu');
	    	$id_menu= '';
	    	if (is_array($menu)) {
	    		$id_menu = implode(',', $menu);
	    	}

	    	$sql_data = array(
	    		'perfil' 		=> $this->input->post('perfil')
	  			,'id_menu' 		=> $id_menu
	  			,'id_usuario' 	=> $this->session->userdata('id_usuario')
	    	);

	    	//VALIDAMOS DE QUE EL PERFIL SEA UNICO
	    	$exist = $this->db_perfiles->exist_perfiles($sql_data);
	    	!$exist OR set_exception(lang('perfil_save_duplicate'));

	    	$insert = $this->db_perfiles->insert_perfil($sql_data);
	    	$insert OR set_exception();

    		$response = array(
    			'success' 	=> TRUE
    			,'title' 	=> lang('general_exito')
    			,'msg' 		=> lang('perfil_save_success')
    			,'type' 	=> 'success'
    		);
    	} catch (Exception $e) {
    		$response = array(
    			'success' 	=> FALSE
    			,'title' 	=> lang('general_error')
    			,'msg' 		=> $e->getMessage()
    			,'type' 	=> 'error'
    		);	
    	}

    	echo json_encode($response);
    }

    /**
     * Función para eliminar el perfil seleccionado
     */
    public function process_drop() {
    	try {
    		$sql_data = array(
    			'id_perfil' 		=> $this->input->post('id_perfil')
    			,'id_usuario_edit'	=> $this->session->userdata('id_usuario')
    			,'activo' 			=> 0
    		);
    		$update = $this->db_perfiles->update_perfiles($sql_data);
    		$update OR set_exception(lang('general_throw_xception'));

    		$response = array(
    			'success' 	=> TRUE
    			,'title' 	=> lang('general_exito')
    			,'msg' 		=> lang('perfil_drop_success')
    			,'type' 	=> 'success'
    		);
    	} catch (Exception $e) {
    		$response = array(
    			'success' 	=> FALSE
    			,'title' 	=> lang('general_error')
    			,'msg' 		=> $e->getMessage()
    			,'type' 	=> 'error'
    		);
    	}

    	echo json_encode($response);
    }

    public function update_perfil_view(){
    	$sql_data = array(
    		'id_perfil' => $this->input->post('id_perfil')
    	);
    	$perfil = $this->db_perfiles->get_perfiles($sql_data);
    	$perfil = $perfil[0];
    	$menu = explode(',', $perfil['id_menu']);


		//labels
		$data_view['title'] 			= lang('menu_perfiles');
		$data_view['perfil_menu_vert'] 	= lang('perfil_menu_vert');
		$data_view['perfil_menu_hori'] 	= lang('perfil_menu_hori');
		$data_view['perfil_perfil'] 	= lang('perfil_perfil');
		$data_view['general_guardar'] 	= lang('general_guardar');
		$data_view['general_cancelar'] 	= lang('general_cancelar');

		//data
		$data_view['menu_vertical'] 	= self::get_menu('VERTICAL', $menu);
		$data_view['menu_horizontal'] 	= self::get_menu('HORIZONTAL', $menu);
		$data_view = array_merge($data_view, $perfil);
		
		$includes['header']['css'][] 	= array( 'url' => 'vendor/tree', 'name' => 'MultiNestedList');
		$includes['footer']['js'][] 	= array( 'url' => 'vendor/tree', 'name' => 'MultiNestedList');
		$includes['footer']['js'][] 	= array( 'url' => 'js/perfiles', 'name' => 'Form_validate');
		$this->load_view($this->path."/perfiles/edit_perfil_view", $data_view, $includes);
    }

    /**
     * Función para el registro de un nuevo perfil
     */
    public function process_update() {
    	try {
	    	$menu 	= $this->input->post('id_menu');
	    	$id_menu= '';
	    	if (is_array($menu)) {
	    		$id_menu = implode(',', $menu);
	    	}

	    	$sql_data = array(
	    		'id_perfil' 	=> $this->input->post('id_perfil')
	    		,'perfil' 		=> $this->input->post('perfil')
	  			,'id_menu' 		=> $id_menu
	  			,'id_usuario' 	=> $this->session->userdata('id_usuario')
	    	);

	    	//VALIDAMOS DE QUE EL PERFIL SEA UNICO
	    	$exist = $this->db_perfiles->exist_perfiles($sql_data);
	    	!$exist OR set_exception(lang('perfil_save_duplicate'));

	    	$insert = $this->db_perfiles->update_perfiles($sql_data);
	    	$insert OR set_exception(lang('general_throw_xception'));

    		$response = array(
    			'success' 	=> TRUE
    			,'title' 	=> lang('general_exito')
    			,'msg' 		=> lang('perfil_update_success')
    			,'type' 	=> 'success'
    			,'redirect' => TRUE
    		);
    	} catch (Exception $e) {
    		$response = array(
    			'success' 	=> FALSE
    			,'title' 	=> lang('general_error')
    			,'msg' 		=> $e->getMessage()
    			,'type' 	=> 'error'
    		);
    	}

    	echo json_encode($response);
    }

}

/* End of file Perfiles.php */
/* Location: ./application/controllers/admin/catalogos/Perfiles.php */
