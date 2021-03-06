<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| Hooks
| -------------------------------------------------------------------------
| This file lets you define "hooks" to extend CI without hacking the core
| files.  Please see the user guide for info:
|
|	https://codeigniter.com/user_guide/general/hooks.html
|
*/

//Hooks login check
$hook['post_controller_constructor'][] = array(
   'class'    => 'Authentication',
   'function' => 'loginCheck',
   'filename' => 'Authentication.php',
   'filepath' => 'hooks',
   'params'   => array()
);

/**
 * Hooks load Language 
 */
$hook['post_controller_constructor'][] = array(
    'class'    	=> 'Load_language',
    'function' 	=> 'initialize',
    'filename' 	=> 'Load_language.php',
    'filepath' 	=> 'hooks',
    'params' 	=> ''
);