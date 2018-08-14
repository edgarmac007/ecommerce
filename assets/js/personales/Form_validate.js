$(document).ready(function() {

	/**
	 * Eventos para las cargas de datos dinamicos
	 */
	$(".form-validate")

	/**
	 * Función para realizar la validación del registro del nuevo perfil para los usuarios
	 */
	.validate({
	 	ignore:'.ignore'
		,invalidHandler: function(event, validator) {}
	 	,submitHandler: function(form) {
		    $(form).sendRequestAjax({
		    	success: function(response) {
			    	swal({
			    		title:response.title
			    		,text: response.msg
			    		,type: response.type 
			    		,onClose: function() {
			    			(response.success && response.redirect) && redirect(response.url);
			    			
				    		(response.success && !response.redirect) && location.reload();
			    		}
			    	});
			    }
		    });
		}
	});
});