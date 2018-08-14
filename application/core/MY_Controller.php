<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 5H2
 * @version 1.0.1
 * 
 */

class MY_Controller extends CI_Controller {
	
    var $vars;
	function  __construct() {
        parent::__construct(); 

        //LOAD HELPERS FOR ADMIN
        $this->load->helper('system');
        $this->load->helper('admin');
        
        //LOAD VARS APP
        $Load_vars = new Load_vars('application');
        $this->vars = $Load_vars->vars;
        
        //LOAD MODELS 
        $this->load->model("menu/menu_model", "db_menu");
        $this->load->model('Languages_model', 'db_lang');
    }

	/**
     * Load View
     *
     * Este metodo se encarga de cargar el contenido principal del sistema, 
     * integrando el header y el footer 
     * @param    String $view ruta del archivo a cargar, omitir la extención del archivo
     * @param    $data array datos a mostrar en la vista
     * @param    $includes array nombre y ruta de la librerias o styles a incluir
     * @param    $ext extencion del archivo
     * @param    $return booleano true si se retorna la vista, si no, false
     * @return   mixed
     */
    public function load_view($view = '', $data = array(), $includes = array(), $return = FALSE) {
        $vars = $this->vars;
    	$view_path = VIEWPATH."{$view}.html";
        
    	if (__exist_file($view_path)) { 
            $data_view['APP_TITLE']         = $vars['APP_TITLE'];
            $data_page['APP_LANG']          = $vars['APP_LANG'];
            $data_view['APP_CHARSET']       = $vars['APP_CHARSET'];
            $user_lang                      = $this->session->userdata('lang');
            $data_view['LANG']              = ($user_lang ? $user_lang : 'es_mx');
            $data_view['BASE_URL']          = base_url();
            $data['BASE_URL']               = base_url();
            $data_view['USER_MENU']         = '';
            $data_view['INCLUDES_HEADDER']  = '';
            $data_view['INCLUDES_VENDOR']   = '';
            $data_view['INCLUDES_FOOTER']   = '';
            $data_page['BODY_CLASS']        = ( isset($data['body_class']) ? $data['body_class'] : '');

            //OBTENEMOS EL MENU PARA LA ADMINISTRACIÓN DEL SYSTEM(MENU VERTICAL)
            $data_page['MENU_DASHBOARD'] = self::get_menu('VERTICAL');

            //OBTENEMOS EL MENU MAIN DEL SYSTEM(MENU HORIZONTAL)
            $data_page['MENU_APPLICATION'] = self::get_menu('HORIZONTAL', $data);

            //VERIFICACIÓN PARA EL FULL PAGE
            if(empty($data_page['MENU_DASHBOARD'])){
                $data_page['BODY_CLASS'] .= " wrapper-full-page";
            }

            //OBTENEMOS LOS ARCHIVOS A INCLUIR EN EL HEADER
            if (isset($includes['header'])) {
                $data_view['INCLUDES_HEADDER'] = self::get_link($includes['header']);
            }
            //OBTENEMOS LOS ARCHIVOS A INCLUIR EN EL FOOTER
            if (isset($includes['footer'])) {
                $data_view['INCLUDES_FOOTER'] = self::get_link($includes['footer']);
            }
            //OBTENEMOS LOS ARCHIVOS A INCLUIR EN EL VENDOR
            if (isset($includes['vendor'])) {
                $data_view['INCLUDES_VENDOR'] = self::get_link($includes['vendor']);
            }

            //OBTENEMOS LOS VENDOR JS
            $data_view['VENDOR_JS'] = self::view_unique('template/vendor', $data_view);

            $data_page['HEADER']        = self::view_unique('template/header', $data_view);
            $data_page['CONTENT_PAGE']  = self::view_unique($view, $data);
            $data_page['FOOTER']        = self::view_unique('template/footer', $data_view);
            
            //LOAD PAGE MAIN
            self::view_unique('template/page', $data_page, FALSE);
    	}
    }

    /**
     * View unique
     *
     * Este metodo se encarga de cargar el contenido del sistema. 
     * @param    String $view ruta del archivo a cargar, omitir la extención del archivo
     * @param    $data array datos a mostrar en la vista
     * @param    $return booleano true retorna la vista el formato HTML, si no, muestra el HTML
     * @return   SI @param $return es TRUE retorna la vista HTML, si no, carga la vista HTML
     */
    public function view_unique($view = '', $data = array(), $return = TRUE) {
        $extencion  = pathinfo($view, PATHINFO_EXTENSION);
        $view      .= (!$extencion?'.html': '');
        $view_path  = VIEWPATH.$view;
        if (__exist_file($view_path)) { 
            if ($return) {
                return $this->parser->parse($view, $data, TRUE);
            }
            $this->parser->parse($view, $data);
    	} 
    }

    /**
     * Este metodo se encarga de construir la liga de los archivos a incluir en el sistema
     * @param $data Array tipo, ruta y nombre de los archivos a incluir
     * @return HTML link de CSS Y/O JQuery
     */
    private function get_link($data) {
        $links = array();
        if (is_array($data)) {
            $base_url   = trim(base_url(), '/').'/assets';
            foreach ($data as $file_extends => $files) {
                foreach ($files as $file) {
                    $file_url   = trim($file['url'], '/');
                    $file_name  = trim($file['name'], '/');

                    if ($file_extends == 'css') {
                        $links[]= "<link href='$base_url/$file_url/$file_name.css' rel='stylesheet'/>";
                    }
                    if ($file_extends == 'js') {
                        $links[]= "<script src='$base_url/$file_url/$file_name.js'></script>";
                    }
                }
            }
        }
        $str_links = implode('', $links);

        return $str_links;
    }

    /**
     * Función para obtener el menu del usuario
     * @return HTML menú del usuario, si no, FALSE
     */
    private function get_menu($position, $data_view = array()) {
        $vars = $this->vars;
        $id_usuario = $this->session->userdata('id_usuario');
        $data_view['APP_TITLE'] = $vars['APP_TITLE'];
        $data_view['BASE_URL']  = base_url();
        $data_view['USER_NAME'] = $this->session->userdata('username');
        $data_view['mi_perfil'] = lang('cuenta_mi_perfil');
        $data_view['salir'] = lang('menu_loguot');

        if ($id_usuario) {
            $data_menu = $this->db_menu->get_menu($position, $id_usuario);

            // if ($data_menu) {
                $data_view["MENU_{$position}"] = self::build_menu($data_menu);
                $position = strtolower($position);
                $menu = self::view_unique("template/menu_{$position}", $data_view);
                return $menu;
            // }
        }
        
        return '';
    }

    /**
     * Función para construir el HTML del usuario logueado
     * @param $data Array menu
     * @param $id_padre INT id del padre del menu
     * @return HTML menu
     */
    private function build_menu($data, $id_padre = 0){
        $list   = '';
        $base_url = base_url();
        $class_menu = '';

        //INICIAMOS LA CONSTRUCCIÓN DEL MENU HTML
        foreach ($data as $row) {
            ($id_padre == $row['id_menu']) ? 
                $class_menu = ( $row['posicion'] == 'VERTICAL' ? 'nav' : 'dropdown-menu dropdown-menu-right') 
            : '';
            if ($row['id_padre'] == $id_padre) {
                $li_class = 'admin/'.$this->uri->segment(2, '') == $row['url'] ? 'active' : '';
                $label = $row['short_key'] == 'menu_user' ? $this->session->userdata('username') : lang($row['short_key']);
                $label = $label ? $label : $row['short_key'];
                
                switch ($row['nivel']) {
                    case 'simple':
                        $link = '<a href="'.$base_url.$row['url'].'">';
                        $link .= $row['icono'] ? '<i class="material-icons">'.$row['icono'].'</i>' : '';
                        $label = $row['posicion'] == 'VERTICAL' ? "<p>$label</p>" : $label;
                        $link .= $label;
                        $link .= '</a>';
                        break;
                
                    case 'padre':
                        $id_menu = str_replace('/', '_', $row['url']);
                        $class  = $row['posicion'] == 'HORIZONTAL' ? "dropdown-toggle" : '';
                        $href   = '#'.($row['posicion'] == 'VERTICAL' ? $row['url'] : '');
                        $link   = '<a href="#'.$id_menu.'" class="'.$class.'" data-toggle="'.$row['toggle'].'">';
                        $link .= $row['icono'] ? '<i class="material-icons">'.$row['icono'].'</i>' : '';
                        $label = $row['posicion'] == 'VERTICAL' ? "<p>$label<b class='caret'></b></p>" : $label;
                        $link .= $label;
                        $link .= '</a>';
                        $link .= $row['posicion'] == 'VERTICAL' ? '<div class="collapse" id="'.$id_menu.'">': '';
                        $link .= self::build_menu($data, $row['id_menu']);
                        $link .= $row['posicion'] == 'VERTICAL' ? '</div>': '';
                        break;

                    case 'hijo':
                        $link = '<a href="'.$base_url.$row['url'].'">'.$label.'</a>';
                        break;
                }

                $list   .= '<li class="'.$li_class.'">';
                $list   .= $link;
                $list   .= '</li>';
            }
        }

        $ul = $id_padre ? '<ul class="'.$class_menu.'">' : '';
        $ul .= $list;
        $ul .= '</ul>';
        return $ul;
    }

    /**
     * Construcción del select idiomas en HMTL
     * @return  String select HTML
     */
    protected function build_select_langs($selected=FALSE, $label_all=FALSE) {
        $data = $this->db_lang->get_lang();
        if ( $label_all) {
            $selected=0;
            $data = array_merge([[
                     'id_lang'   => 0
                    ,'language'  => lang('general_todo')
                ]
            ], $data);
        }
        
        $params = array(
            'option'        => $data
            ,'name'         => 'id_lang'
            ,'id'           => 'id_lang'
            ,'value'        => 'id_lang'
            ,'text'         => 'language'
            ,'class'        => 'validate required'
        );
        $selected!==FALSE ? $params['selected'] = $selected : FALSE;
        $dropdown = dropdown($params);

        return  $dropdown;
    }

    /**
     * construcción del select metatag en HTML
     * @return  String select HTML
     **/
    protected function build_select_meta($data=array()) {
        $selected = isset($data['selected']) ? $data['selected'] : FALSE;
        $required = isset($data['required']) ? 'required' : '';
        $sql_data = [];
        isset($data['id_lang']) ? $sql_data['id_lang'] = $data['id_lang'] : FALSE;
        $rows = $this->db_meta->get_metatags($sql_data);

        $params = array(
            'option'        => $rows
            ,'name'         => 'id_metatag'
            ,'id'           => 'id_metatag'
            ,'value'        => 'id_metatag'
            ,'text'         => 'titulo'
            ,'class'        => "validate $required"
        );
        $selected!==FALSE ? $params['selected'] = $selected : FALSE;
        $dropdown = dropdown($params);

        return  $dropdown;
    }

    /**
     * Proceso para guardar archivos en el sistema
     * @param Array $data datos para el guardado del archivo
     * @return Array $response Ruta donde se guardó el archivo 
     **/
    protected function save_file($data=array()) {
        //LOAD LIBRARYS
        $this->load->library('upload');
        
        $folder = date('Ymd');
        $config = [
             'upload_path'   => "$data[upload_path]/$folder/"
            ,'allowed_types' => 'gif|jpg|jpeg|png'
        ];
        custom_mkdir($config['upload_path'], 0777, TRUE);
        $this->upload->initialize($config);

        if ( ! $this->upload->do_upload($data['file_name'])) {
            $response = [
                'success'   => FALSE
                ,'msg'      => $this->upload->display_errors()
            ];
        } else {
            $file_name = $this->upload->data('file_name');
            $response = [
                'success'       => TRUE
                ,'upload_path'  => "$data[upload_path]/$folder/$file_name"
            ];
        }

        return $response;
    }
}

/* Location: ./application/core/MY_Controller.php */
/* End of file MY_Controller.php */