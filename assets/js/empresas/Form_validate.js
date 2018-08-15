jQuery(function($) {

	/**
	 * Eventos para las cargas de datos dinamicos
	 */
	$(".form-validate")

	.on('change', '#id_municipio', function() {
		$('.load-localidades').loadSelectForm({
			 url: base_url('general/load_localidades_ajax')
			,required: true
			,data: {
				id_municipio: $(this).val()
			}
		});
	})

	/**
	 * Función para realizar la validación del registro de la nueva empresa
	 */
	.validate({
	 	ignore:'.ignore'
	 	,submitHandler: function(form) {
		    $(form).sendRequestAjax({
		    	success: function(response) {
			    	swal({
			    		title:response.title
			    		,text: response.msg
			    		,type: response.type 
			    		,onClose: function() {
			    			redirect('admin/empresas');
			    		}
			    	});
			    }
		    });
		}
	});
});