$(document).ready(function() {

	/**
	 * Función para realizar la validación del inicio de sesión del usuario.
	 */
	 $(".login-form").validate({
	 	ignore:'.ignore'
		,invalidHandler: function(event, validator) {}
	 	,submitHandler: function(form) {
		    $(form).sendRequestAjax({
		    	success: function(response) {
			    	if (response.success) {
			    		redirect(response.inicio);
			    	} else {
			    		swal(general_lang.error, response.msg, 'error');
			    	}
			    }
		    });
		}
	 });
});