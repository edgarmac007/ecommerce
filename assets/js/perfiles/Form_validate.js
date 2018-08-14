$(document).ready(function() {
	var id_perfil 	= $("#id_perfil").val();

	/**
	 * Función para realizar la validación del registro del nuevo perfil para los usuarios
	 */
	 $(".form-validate").validate({
	 	ignore:'.ignore'
		,invalidHandler: function(event, validator) {}
	 	,submitHandler: function(form) {
	 		$("#id_perfil").val(id_perfil);
		    $(form).sendRequestAjax({
		    	success: function(response) {
			    	swal({
			    		title:response.title, 
			    		text: response.msg, 
			    		type: response.type, 
			    		onClose: function() {
				    		if (response.redirect) {
				    			redirect('admin/perfiles')
				    		}
			    		}
			    	});
			    	if (response.success) {
			    		form.reset();
			    	}
			    }
		    });
		}
	 });
});