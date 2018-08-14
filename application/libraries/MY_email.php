<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * Clase para el envío de correo del sistema
 *
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 5H2
 * @version 1.0.1
 */

class MY_email { 

    private $mail, $vars;
	function __construct() { 
        require_once(APPPATH."third_party/PHPMailer/PHPMailerAutoload.php");
        $Load_vars = new Load_vars('email');
        $vars = $this->vars = $Load_vars->vars;

        $mail = new PHPMailer;
        $mail->SMTPDebug    = $vars['SMTPDEBUG'];
        $mail->isSMTP();
        $mail->isHTML(($vars['MAILTYPE'] == 'html'));
        $mail->Debugoutput  = $vars['DEBUGOUTPUT'];
        $mail->Host         = $vars['HOST'];
        $mail->Port         = $vars['PORT'];
        $mail->SMTPSecure   = $vars['SMTPSECURE'];
        $mail->SMTPAuth     = $vars['SMPT_AUTH'];
        $mail->Username     = $vars['USERNAME'];
        $mail->Password     = $vars['PASSWORD'];
        $mail->Timeout      = $vars['TIMEOUT'];
        $mail->setFrom($vars['USERNAME'], $vars['NAME']);
        $this->mail = $mail;
    }

    public function test_sendMail($html) {
        $mail = $this->mail;

        // $mail->addAddress('saulitoh76@gmail.com', 'SAUL');     // Add a recipient
        $mail->addAddress('shernandez_developer@outlook.com'); 

        $mail->Subject = 'Here is the subject';
        $mail->Body    = $html;
        $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

        //SE REALIZA EN ENVÍO DEL CORREO
        self::process_send_mail($mail);    
    }

    public function send_mail($data=array()) {
        if ($this->vars['SEND_MAIL']) {
            $mail = $this->mail;
            $mail->Subject  = $data['subject'];
            $mail->Body     = $data['body'];

            //AGREGAMOS LAS DIRECCIONES DE LOS CORREOS A ENVIAR
            if (isset($data['email'])) {
                if (is_array($data['email'])) {
                    foreach ($data['email'] as $address) {
                        $mail->addAddress($address); 
                    }
                } else {
                    $mail->addAddress($data['email']); 
                }
            }

            self::process_send_mail($mail);
        }
    }

    /**
     * Función para enviar el correo a los destinatarios
     * @param $mail Object phpmailer
     **/
    private function process_send_mail($mail) {
        $message = "Mail has been sent\n"; 
        ob_start();
        if (!$mail->send()) {
            $message = $mail->ErrorInfo;
        }
        $trace = ob_get_contents();
        $trace .= $message;
        ob_end_clean();

        //SE GUARDA EL LOG DEL ENVÍO DE CORREO
        $filepath = $this->vars['LOG_PATH'];
        file_exists($filepath) OR mkdir($filepath, 0755, TRUE);
        $filepath .='log-'.date('Y-m-d His').'.'.$this->vars['LOG_FILE_EXTENSION'];

        $fp = @fopen($filepath, 'ab');
        flock($fp, LOCK_EX);
        fwrite($fp, $trace);
        flock($fp, LOCK_UN);
        fclose($fp);
    }
}

/* End of file My_phpmailer.php */
/* Location: ./application/libraries/My_phpmailer.php */