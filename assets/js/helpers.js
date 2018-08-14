(function ( $ ) {
	/**
	 * Se agrega el metodo de expreciones regulares en el jquery Validation
	 */
	$.validator.addMethod(
	    "regex", function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    }
	);

}(jQuery));

/**
 * Funcion para obtener la URL del sistema
 * @param subdirectory String un subdirectorio del sitio
 * @return base_url String URL del sitio
 */
function base_url(subdirectory) {
	var origin 		= $(location).attr('origin'),
		pathname 	= '/ecommerce',
		subdirectory= (subdirectory ? '/' + subdirectory : '');
	var base_url = origin + pathname + subdirectory; 
	
	return base_url; 
}

/**
 * Función para redireccionarte a otra página
 * @param url, si hay un directorio te envia a la dirección recibida, si no, te manda al sitio oficial
 */
function redirect(url) {
	var url = (url ? url : '');
	window.location.href = base_url(url); 
}

/**
 * función para crear el formulario del envío de datos mediante POST
 * @param Array/Object data datos a enviar
 * @param String url ruta a enviar los datos
 * @param boolean freturn true/false hace el submit del form creado, si no, retorna el objeto creado
 */
function form_send(data, url, freturn) {
	var $form = $("<form>", {method:'post', action: url, id:'form-submit', class:'hidden'});
	$.each(data, function(name, value){
		var input = $('<input>', {type: 'text', 'name':name, 'value': value});
		$form.append(input);
	});

	if ( freturn) {
		return $form;
	}

	var submit = $('<input>', {type:'submit', value:'submit'});
	$form.append(submit);
	$form.appendTo('body').submit();
}

/**
 * Función para redireccionar a la página de login todas las peticiones 
 * via ajax cuando la session es caducada
 **/
 function check_session(response) {
 	if (isJson(response)) {
 		var response = $.parseJSON(response);
	 	if (response.session_destroy) {
	 		swal({
			  	title: general_lang.error
			  	,text: general_lang.session_destroy
			  	,type: 'error'
			  	,confirmButtonText: general_lang.aceptar
	 			,onClose: function() {
	 				redirect();
	 			}
	 		});
	 		return false;
	 	}
 	}

 	return true;
 }

/**
 * Función para verificar si es Json
 * @param str String a validar
 **/
function isJson(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

/**
 * Inicializamos el datatable
 * @param  String el de algun elemento en especifico
 * @return String Void
 */
function dataTableIni(el) {
	var element = el ? el : '.datatables';
	/** Inicializamos la datatable **/
    $(element).each(function(){
        $(this).DataTable();
    });
}