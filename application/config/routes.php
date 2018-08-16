<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] 	= 'WS_Public';
$route['404_override'] 			= '';
$route['translate_uri_dashes'] 	= FALSE;

//LOGIN
$route['admin'] 							= 'admin/Auth';
$route['admin/process_auth'] 				= 'admin/Auth/process_auth';
$route['admin/restart_password/(:any)'] 	= 'admin/Auth/restart_password/$1';
$route['admin/process_restart_password'] 	= 'admin/Auth/process_restart_password/';

//HOME
$route['admin/home'] 				= 'admin/dashboard/graficas';	
//DASHBOARD
$route['admin/dashboard'] 			= 'admin/dashboard/graficas';
//USUARIO
$route['admin/logout'] 				= 'admin/auth/process_logout';
$route['admin/cuenta'] 				= 'admin/cuenta';
//ADMINISTRACIÓN-PERSONALES
$route['admin/personales'] 			= 'admin/administracion/personales';
$route['admin/new-personal'] 		= 'admin/administracion/personales/new_view';
$route['admin/update-personal'] 	= 'admin/administracion/personales/edit_view';
//ADMINISTRACIÓN-USUARIOS
$route['admin/usuarios'] 			= 'admin/administracion/usuarios';
//ADMINISTRACION-PERFILES
$route['admin/perfiles'] 		    = 'admin/catalogos/perfiles';
$route['admin/new-perfil'] 		    = 'admin/catalogos/perfiles/new_perfil_view';
$route['admin/update-perfil'] 	    = 'admin/catalogos/perfiles/update_perfil_view';

//ADMINISTRACION-EMPRESAS
$route['admin/new-empresa'] 		= 'admin/empresas/new_empresas';
$route['admin/update-empresa'] 		= 'admin/empresas/edit_empresas';