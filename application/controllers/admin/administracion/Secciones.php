<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Secciones extends MY_Controller {

	public function __construct() {
		parent::__construct();
		//Do your magic here
		$this->path = "admin/administracion/Secciones";

		//LOAD MODELS
		$this->load->model('Languages_model', 'db_lang');
		$this->load->model('Secciones_model', 'db_secciones');
		$this->load->model('Secciones_slider_model', 'db_secciones_sliders');
	}

	/**
	 * load view lista sections proyectos
	 **/
	public function index() {
		//labels
		$data_view['title'] 	= lang('menu_admin');
		$data_view['subtitle'] 	= lang('menu_secciones');
		
		//DATA
		$data_view['data_table'] 		= self::build_table_main();
		$data_view['dropdown_paises'] 	= $this->build_select_langs(FALSE, TRUE);

		$includes['footer']['js'][] = array( 'url' => 'js/secciones', 'name' => 'Table_events');
		$this->load_view($this->path."/secciones_view", $data_view, $includes);
	}

	private function build_table_main($data=[]) {
		$sql_data = [];
		isset($data['id_lang']) ? $sql_data['id_lang'] = $data['id_lang']: FALSE;
		$rows = $this->db_secciones->get_secciones($sql_data);

		$data = array();
		$title 	= array(
			lang('general_id')
			,lang('general_idioma')
			,lang('general_titulo')
			,lang('proyectos_total_imgs')
			,lang('general_actions')
		);

		foreach ($rows as $row) {
			$buttons = self::build_buttons($row);
			$data[] = array(
				 $row['id_seccion']
        		,$row['short_key']
        		,$row['titulo']
        		,$row['total_img']
        		,build_actions($buttons)
			);
		}

		$data_table = array(
			'head' 		=> $title
			,'rows' 	=> $data
			,'id' 		=> 'table-main'
		);
		
		return Datatable($data_table);
	}

	/**
	 * Creacion de botones HTML
	 * @param Array $data Datos de la seccion
	 * @return String HTML acciones de cada fila
	 **/
	private function build_buttons($data=array()) {
		$buttons = array(
			[
				'tooltip' 	=> lang('general_editar')
				,'class'	=> 'btn-warning edit'
				,'icon'		=> '<i class="material-icons">mode_edit</i>'
				,'data'		=> array('id_seccion' => $data['id_seccion'])
			]//,[
			// 	'tooltip' 	=> lang('general_borrar')
			// 	,'class'	=> 'btn-danger drop'
			// 	,'icon'		=> '<i class="material-icons">delete</i>'
			// 	,'data'		=> array('id_proyecto' => $data['id_proyecto'])
			// ]
		);

		return $buttons;
	}

	/**
     * Función para eliminar la noticia seleccionado
     */
    public function process_drop() {
    	try {
    		$this->db->trans_begin();
    		//DESACTIVAMOS EL PROYECTO
    		$sql_data = array(
    			'id_proyecto' 		=> $this->input->post('id_proyecto')
    			,'id_usuario_edit'	=> $this->session->userdata('id_usuario')
    			,'activo' 			=> 0
    		);
    		$update = $this->db_proyectos->update_proyectos($sql_data);
    		$update OR set_exception(lang('general_throw_xception'));

    		//DESACTIVAMOS EL SLIDER DEL PROYECTO
    		$update = $this->db_proyectos_sliders->update_proyectos_sliders($sql_data);
    		$update OR set_exception(lang('general_throw_xception'));

    		$response = array(
    			'success' 	=> TRUE
    			,'title' 	=> lang('general_exito')
    			,'msg' 		=> lang('proyectos_drop_success')
    			,'type' 	=> 'success'
    		);
    		$this->db->trans_commit();
    		
    	} catch (Exception $e) {

    		$this->db->trans_rollback();
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
     * Carga de la tabla proyectos via ajax
     **/
    public function get_table_ajax() {
    	$data = [];
    	$id_lang = $this->input->post('id_lang');
    	$id_lang ? $data['id_lang'] = $id_lang : FALSE;

    	$data_table = self::build_table_main($data);
    	echo $data_table;
    }

    /**
     * Cargamos la vista del formulario para la edicion de la seccion
     **/
    public function edit_seccion() {
    	$_POST OR redirect('admin/secciones', 'refresh');
    	$sql_data = ['id_seccion' => $this->input->post('id_seccion')];
    	$secciones = $this->db_secciones->get_secciones($sql_data);

    	//labels
		$data_view['title'] 					= lang('menu_secciones');
		$data_view['secciones_edit'] 			= lang('secciones_edit');
		$data_view['general_required_fields'] 	= lang('general_required_fields');
		$data_view['proyectos_new'] 			= lang('proyectos_new');
		$data_view['general_titulo'] 			= lang('general_titulo');
		$data_view['general_subtitulo'] 		= lang('general_subtitulo');
		$data_view['general_descripcion'] 		= lang('general_descripcion');
		$data_view['general_guardar'] 			= lang('general_guardar');
		$data_view['general_cancelar'] 			= lang('general_cancelar');
		$data_view['personales_language'] 		= lang('personales_language');
		$data_view['general_select_img'] 		= lang('general_select_img');
		$data_view['general_cambiar'] 			= lang('general_cambiar');
		$data_view['general_quitar'] 			= lang('general_quitar');
		$data_view['noticias_imagen'] 			= lang('noticias_imagen');
		$data_view['noticias_portada'] 			= lang('noticias_portada');
		$data_view['secciones_slider'] 			= lang('secciones_slider');
		$data_view['proyectos_imagen_grande'] 	= lang('proyectos_imagen_grande');
		$data_view['proyectos_imagen_title'] 	= lang('proyectos_imagen_title');

		//DATA PROYECTO
		$data_view['select_langs'] 		= $this->build_select_langs($secciones[0]['id_lang']);
		$data_view['select_metas'] 		= self::load_metatags($secciones[0]['id_lang'], $secciones[0]['id_metatag']);
		$data_view['input_sliders'] 	= '';
		$data_view = array_merge($data_view, $secciones[0]);
		$data_view['seccion_titulo'] = $secciones[0]['titulo'];
		$data_view['seccion_descripcion'] = $secciones[0]['descripcion'];
		//DATA SLIDERS
		$sliders = $this->db_secciones_sliders->get_seccion_sliders($sql_data);
		if (count($sliders)) {
			$data_view = array_merge($data_view, $sliders[0]);
			unset($sliders[0]);
			!count($sliders) OR $data_view['input_sliders'] = input_sliders($sliders, 'id_seccion_slide');
		}

		$includes['footer']['js'][] = array( 'url' => 'js/secciones', 'name' => 'Form_validate');
		$this->load_view($this->path."/edit_seccion_view", $data_view, $includes);
    }

    /**
	 * Carga del select HTML metatags
	 **/
    private function load_metatags($id_lang=FALSE, $selected=FALSE) {
    	$data = ['id_lang'=>$id_lang, 'selected'=>$selected];
    	$dropdown = $this->build_select_meta($data);

    	return  $dropdown;
    }

    /**
     * Función para la edición del proyecto seleccionado
     */
    public function process_edit() {
    	try {
			$this->db->trans_begin();
	    	$sql_data = array(
	    		'exist' 			=> $this->input->post('id_seccion')
	    		,'id_lang' 			=> $this->input->post('id_lang')
	  			,'titulo' 			=> $this->input->post('titulo')
	  			,'titulo' 			=> $this->input->post('titulo')
	  			,'subtitulo' 		=> $this->input->post('subtitulo')
	  			,'descripcion' 		=> $this->input->post('descripcion')
	  			,'id_usuario_edit' 	=> $this->session->userdata('id_usuario')
	    	);
	    	//VALIDAMOS DE QUE EL PROYECTO SEA UNICO
	    	$exist = $this->db_secciones->get_secciones($sql_data);
	    	!count($exist) OR set_exception(lang('proyectos_save_duplicate'));
	    	$sql_data['id_seccion'] = $sql_data['exist'];
	    	unset($sql_data['exist']);
	    	$file_data = ['upload_path'=>$this->vars['PATH_UPLOAD_IMG']];

	    	$update = $this->db_secciones->update_seccion($sql_data);
	    	$update OR set_exception();

	    	//GUARDAMOS LAS IMAGENES PARA EL SLIDER
	    	$tmp_img 			= isset($_FILES['img-slider']['name'][0]) ? $_FILES['img-slider']['name'] : [0];
	    	$slider_titulo 		= $this->input->post('slider_titulo');
	    	$seccion_slide 	= $this->input->post('id_seccion_slide');
	    	$sql_data 			= FALSE;
	    	$_FILES['slider'] 	= [
		    	 'name' 	=> NULL
				,'type' 	=> NULL
				,'tmp_name' => NULL
				,'error' 	=> NULL
				,'size' 	=> NULL
			];
	    	foreach ($tmp_img as $index => $image) {
	    		$_FILES['slider']['name'] 		= isset($_FILES['img-slider']['name'][$index]) ? $_FILES['img-slider']['name'][$index] : $_FILES['img-slider']['name'];
                $_FILES['slider']['type'] 		= isset($_FILES['img-slider']['type'][$index]) ? $_FILES['img-slider']['type'][$index] : $_FILES['img-slider']['type'];
                $_FILES['slider']['tmp_name'] 	= isset($_FILES['img-slider']['tmp_name'][$index]) ? $_FILES['img-slider']['tmp_name'][$index] : $_FILES['img-slider']['tmp_name'];
                $_FILES['slider']['error'] 		= isset($_FILES['img-slider']['error'][$index]) ? $_FILES['img-slider']['error'][$index] : $_FILES['img-slider']['error'];
                $_FILES['slider']['size'] 		= isset($_FILES['img-slider']['size'][$index]) ? $_FILES['img-slider']['size'][$index] : $_FILES['img-slider']['size'];

                //SI LA IMAGEN ESTA VACÍO, CONTINUA
                if (!$_FILES['slider']['size']) continue;

                //SI SE CAMBIÓ LA IMAGEN, SE DESACTIVA EL ANTERIOR
                if (isset($seccion_slide[$index])) {
                	$slider_remove = [
                		'id_seccion_slide' => $seccion_slide[$index]
                		,'id_usuario_edit' 	=> $this->session->userdata('id_usuario')
                		,'activo' 			=> 0
                	];
                	$update = $this->db_secciones_sliders->update_seccion_sliders($slider_remove);
                	$update OR set_exception();
                }

                //GUARDAMOS LA IMAGEN PARA EL SLIDER
		    	$file_data['file_name'] = 'slider';
		    	$slider 	= $this->save_file($file_data);
		    	$slider['success'] OR set_exception($slider['msg']);
		    	$sql_data[] = [
		    		'id_seccion' 	=> $this->input->post('id_seccion')
		    		,'titulo' 		=> $slider_titulo[$index]
		    		,'ruta_img' 	=> $slider['upload_path']
	  				,'id_usuario' 	=> $this->session->userdata('id_usuario')
		    	];
	    	}
	    	
	    	if ($sql_data) {
	    		$insert_sliders = $this->db_secciones_sliders->insert_seccion_sliders($sql_data, TRUE);
	    		$insert_sliders OR set_exception();
	    	}

    		$response = array(
    			'success' 	=> TRUE
    			,'title' 	=> lang('general_exito')
    			,'msg' 		=> lang('secciones_update_success')
    			,'type' 	=> 'success'
    			,'reload' 	=> 'admin/secciones'
    		);
    		$this->db->trans_commit();
    	} catch (Exception $e) {
    		$this->db->trans_rollback();
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
     * función para el eliminado logica del slider del proyecto
     **/
    public function slide_process_drop() {
    	try {
    		$sql_data = [
    			 'id_seccion_slide' => $this->input->post('id_seccion_slide')
    			,'id_usuario_edit' 	=> $this->session->userdata('id_usuario')
    			,'activo' 			=> 0
    		];

    		$update = $this->db_secciones_sliders->update_seccion_sliders($sql_data);
    		$update OR set_exception();

    		$response = array(
    			'success' 	=> TRUE
    			,'title' 	=> lang('general_exito')
    			,'msg' 		=> lang('secciones_slider_delete')
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

}

/* End of file Secciones.php */
/* Location: ./application/controllers/admin/administracion/Secciones.php */