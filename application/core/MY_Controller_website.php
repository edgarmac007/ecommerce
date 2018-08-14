<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 5H2
 * @version 1.0.1
 * 
 */

class MY_Controller_website extends CI_Controller {
    
    var $vars;
    function  __construct() {
        parent::__construct(); 

        //LOAD HELPERS FOR ADMIN
        $this->load->helper('system');
        $this->load->helper('website');

        //LOAD VARS APP
        $Load_vars = new Load_vars('application');
        $this->vars = $Load_vars->vars;
        
        //LOAD MODELS 
        $this->load->model("menu/menu_model", "db_menu");
        $this->load->model("website/Menu_website_model",'menu_website');
        $this->load->model('Secciones_model','Secciones');
        $this->load->model('Languages_model','Languages');
        
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
    public function load_view_website($view = '', $data = array(), $includes = array(), $return = FALSE) {

        
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
            $data_view['INCLUDES_FOOTER']   = '';

            $secciones = $this->_get_menu_website(array(
                'id_lang' => $data['id_lang']
            ));

            
            $data_view['menu_website']      = build_menu_website($secciones,base_url());
            $data_view['LANGUAGE']          = build_menu_lenguajes($this->_get_lenguage_webiste());
            $data_page['BODY_CLASS']        = ( isset($data['body_class']) ? $data['body_class'] : '');

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
            //OBTENEMOS LOS VENDOR JS
            $data_view['VENDOR_JS']     = self::view_unique('template/vendor', $data_view);
            
            $data_page['HEADER']        = self::view_unique('template/header_website', $data_view);
            $data_page['CONTENT_PAGE']  = self::view_unique($view, $data);
            $data_page['FOOTER']        = self::view_unique('template/footer_website', $data_view);
            
            
            
            //LOAD PAGE MAIN
            self::view_unique('template/page_website', $data_page, FALSE);
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
    private function _get_menu_website($data = array()){
        $secciones = $this->Secciones->get_secciones_lang(array(
            'id_lang' => isset($data['id_lang'])?$data['id_lang']:1
        ));
        return $secciones;
        
    }
    private function _get_lenguage_webiste(){
        return $lenguage = $this->Languages->get_lang();

    }



}

/* Location: ./application/core/MY_Controller.php */
/* End of file MY_Controller.php */