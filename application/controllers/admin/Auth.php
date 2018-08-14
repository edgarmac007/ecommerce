<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends MY_Controller {
   
    public function __construct() {
        parent::__construct();

        //Load models
        $this->load->model('Auth_model', 'db_auth');
        $this->load->model('administracion/Usuarios_model', 'db_usuarios');
    }

    /**
     * Metodo principal para el acceso al sistema SICAH
     */
    public function index() { 
        $data_view['login_title']       = lang('login_title'); 
        $data_view['login_user']        = lang('login_user'); 
        $data_view['login_pass']        = lang('login_pass'); 
        $data_view['general_aceptar']   = lang('general_aceptar'); 

        $includes['footer']['js'][] = array( 'url' => 'js/auth', 'name' => 'Auth_validate');
        $this->load_view('admin/auth/login', $data_view, $includes);
    }

    /**
     * Función para realizar la validación de la autenticación del usuario
     * @return json data de la autenticación del usuario
     */
    public function process_auth() {
        try {
            $sql_data = array(
                'username'  => $this->input->post("username")
            );
            $user_data = $this->db_auth->get_auth($sql_data);

            //USUARIO NO ENCONTRADO
            $user_data OR set_exception(lang('login_error'));

            //CUENTA BLOQUEDADA
            !$user_data['token']  OR set_exception(lang('login_account_locked'));

            $mail_data = $user_data;
            $intentos_fallidos = $user_data['intentos_fallidos'];
            $sql_data['password'] = $this->input->post("password");
            $user_data = $this->db_auth->get_auth($sql_data);

            //REGISTRO DE INTENTO FALLIDO
            if (!$user_data) {
                if (++$intentos_fallidos >= 5) {
                    self::send_email_to_restore_password($mail_data);
                    set_exception(lang('login_intentos_excedido'));
                }
                //REGISTRO DE INTENTO FALLIDO
                self::set_intento_fallido($mail_data['id_usuario'], $intentos_fallidos);
                set_exception(lang('login_error'));
            }

            //PASSWORD EXPIRADO
            if ($user_data['dias_expiracion'] AND $user_data['dias_expiracion'] <= $user_data['dias_transcurridos']) {
                throw new Exception(lang('login_pass_expirado'));
                self::send_email_to_restore_password($mail_data);
            }

            unset($user_data['password']);
            $this->session->set_userdata($user_data);
            $sql_data = array(
                'id_usuario'    => $user_data['id_usuario']
                ,'ip_address'   => $_SERVER['REMOTE_ADDR']
                ,'user_agent'   => $_SERVER['HTTP_USER_AGENT']
                ,'evento'       => lang('login_title')
            );
            $this->db_auth->set_auth($sql_data);

            $response = array(
                'success'   => TRUE
                ,'inicio'   =>  $user_data['inicio']
            );
        } catch (Exception $e) { 
            $response = array(
                'success' => FALSE
                ,'msg'     => $e->getMessage()
                ,'type'    => 'error'
            );
        }
        
        echo json_encode($response);
    }

    /**
     * Función para el envío de correo para la restauración de contraseña
     * @param $id_usuario INT ID del usuario
     */
    private function send_email_to_restore_password($data) {
        $sql_data = array(
            'id_usuario' => $data['id_usuario']
            ,'token'     => random_string('md5')
        );
        $this->db_usuarios->update_user($sql_data);
        $email_data = array(
            'email_message'             => utf8_decode(lang('email_message_restart_pass'))
            ,'email_restablecer_pass'   => utf8_decode(lang('email_restablecer_pass'))
            ,'email_automatico'         => utf8_decode(lang('email_automatico'))
            ,'anio'                     => date('Y')
            ,'url'                      => base_url("restart_password/$sql_data[token]")
            ,'application'              => $this->vars['APP_TITLE']
        );
        $html = $this->view_unique('email/restart_password_view', $email_data);
        $email_data = array(
            'subject'   => utf8_decode(lang('login_restore_pass'))
            ,'body'     => $html
            ,'email'    => $data['email']
        );
        $this->my_email->send_mail($email_data);
    }

    /**
     * Función que realiza el registro de intento fallido de autenticacion
     * @param $id_usuario INT ID del usuario
     * @param $intentos_fallidos INT total de intentos fallidos
     */
    private function set_intento_fallido($id_usuario, $intentos_fallidos) {
        $sql_data = array(
            'id_usuario'            => $id_usuario
            ,'intentos_fallidos'    => $intentos_fallidos
        );
        $this->db_usuarios->update_user($sql_data);
    }

    /**
     * Función para finalizar la session del usuario
     */
    public function process_logout() {
        $sql_data = array(
            'id_usuario'    => $this->session->userdata('id_usuario')
            ,'ip_address'   => $_SERVER['REMOTE_ADDR']
            ,'user_agent'   => $_SERVER['HTTP_USER_AGENT']
            ,'evento'       => lang('login_logout')
        );
        $this->db_auth->set_auth($sql_data);
        $this->session->sess_destroy();
        redirect(base_url());
    }

    /**
     * Función para cargar la vista de restablecimiento de contraña
     */
    public function restart_password($token) {
        $sql_data = array('token' => $token);
        $user_data = $this->db_usuarios->get_usuario($sql_data);
        if (!$user_data) {
            redirect('auth', 'refresh');
        }

        //LABELS
        $data_view['login_restore_pass']    = lang('login_restore_pass');
        $data_view['login_new_pass']        = lang('login_new_pass');
        $data_view['login_confir_pass']     = lang('login_confir_pass');
        $data_view['general_aceptar']       = lang('general_aceptar');
        $data_view['cuenta_requeriment_1']  = lang('cuenta_requeriment_1');
        $data_view['cuenta_requeriment_2']  = lang('cuenta_requeriment_2');
        $data_view['cuenta_requeriment_3']  = lang('cuenta_requeriment_3');
        $data_view['cuenta_requeriment_4']  = lang('cuenta_requeriment_4');
        $data_view['cuenta_requeriment_5']  = lang('cuenta_requeriment_5');
        $data_view['cuenta_requeriment_6']  = lang('cuenta_requeriment_6');
        $data_view['cuenta_requeriment_7']  = lang('cuenta_requeriment_7');

        //DATA
        $data_view = array_merge($data_view, $user_data);

        $includes['footer']['js'][] = array( 'url' => 'js/auth', 'name' => 'restart_password');
        $this->load_view('admin/auth/restart_password', $data_view, $includes);
    }

    /**
     * Función para restaurar la contraña
     */
    public function process_restart_password() {
        try {
            $sql_data = array(
                'id_usuario'        => $this->input->post('id_usuario')
                ,'password'         => $this->input->post('password')
                ,'token'            => ''
                ,'intentos_fallidos'=> 0
            );

            $update = $this->db_usuarios->update_user($sql_data);
            $update OR set_exception(lang('general_throw_xception'));

            $response = array(
                'success'   => TRUE
                ,'title'    => lang('general_exito')
                ,'msg'      => lang('login_restart_pass_success')
                ,'type'     => 'success'
                ,'inicio'   => 'admin'
            );
        } catch (Exception $e) {
            $response = array(
                'success'   => FALSE
                ,'title'     => lang('general_error')
                ,'msg'       => $e->getMessage()
                ,'type'      => 'error'
            );
        }

        echo json_encode($response);
    }

}

/* End of file Auth.php */
/* Location: ./application/controllers/admin/Auth.php */