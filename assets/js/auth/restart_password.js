$(document).ready(function() {
	var regexp 		= /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&.])([A-Za-z\d$@$!%*?&.]|[^ ]){8,15}$/;
	var id_usuario 	= $("#id_usuario").val();

	/**
	 * Función para realizar la validación del inicio de sesión del usuario.
	 */
	 $(".restart-pass").validate({
	 	ignore:'.ignore'
		,invalidHandler: function(event, validator) {}
		,rules: {
			password: {regex: regexp}
		    ,password_again: {
		      	equalTo: "#password"
		    }
		}
		,messages: { password: general_lang.pass_requeriment }
	 	,submitHandler: function(form) {
	 		$("#id_usuario").val(id_usuario);
		    $(form).sendRequestAjax({
		    	success: function(response) { 
		    		swal({
		    			title: response.title, 
		    			text: response.msg, 
		    			type: response.type,
		    			confirmButtonText: general_lang.aceptar,
		    			onClose: function() {
			    			if (response.success) {
			    				redirect(response.inicio)
			    			}
			    		}
		    		});
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
		  confirmButtonText: general_lang.aceptar
		});
		e.preventDefault();
	});
});