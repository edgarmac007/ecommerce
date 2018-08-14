$(document).ready(function() {
	var regexp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&.])([A-Za-z\d$@$!%*?&.]|[^ ]){8,}$/;

	/**
	 * Función para realizar la validación de la actualización de datos de la cuenta
	 */
	 $(".cuenta-form").validate({
	 	ignore:'.ignore'
		,invalidHandler: function(event, validator) {}
	 	,submitHandler: function(form) {
		    $(form).sendRequestAjax({
		    	beforeSend: function(jqXHR, obj) {
		    		if ($.inArray($("#username").val(), Username_Blacklist) > 0) {
		    			error_lang.error_0 = personal_lang.user_error;
		    			$(form).find('.submit').elEnable();
		    			jqXHR.abort();
		    		}
		    	}
		    	,success: function(response) {
			    	swal({
			    		title: response.title, 
			    		text: response.msg, 
			    		type: response.type,
			    		onClose: function() {
			    			if (response.success) {
			    				setTimeout(redirect("cuenta"), 2000);
			    			}
			    		}
			    	});
			    }
		    });
		}
	 });

	/**
	 * Función para realizar la validación de la actualización de contraseña
	 */
	 $(".password-form").validate({
	 	ignore:'.ignore'
		// ,rules: {
		// 	password: {regex: regexp}
		// }
		// ,messages: { password: general_lang.pass_requeriment }
		,invalidHandler: function(event, validator) {}
	 	,submitHandler: function(form) {
		    $(form).sendRequestAjax({
		    	success: function(response) {
			    	swal(response.title, response.msg, response.type);
			    	if (response.success) {
			    		form.reset();
			    	}
			    }
		    });
		}
	 });

	/**
	 * Mostramos los requerimientos de la contraseña
	 */
	$(".required-pass").click(function(e){
		var requerimientos = $('.requeriment-list').html();
		swal({
		  title: general_lang.requerimientos,
		  html: requerimientos,
		  showCancelButton: false,
		  confirmButtonText: general_lang.aceptar,
		  customClass: 'wa-custom-title-1'
		});
		e.preventDefault();
	});

});