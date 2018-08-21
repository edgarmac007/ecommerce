jQuery(function($) {
	$(".content")
	/**
	 * Element: <a.open-modal>
	 * Action: click
	 * Description: abrimos el modal para poder asignar personales a las sucursales
	 */
	.on('click', 'a.open-modal', function(e){
		var url 	= base_url('admin/empresas/get_modal_asignacion_empleados')
			data 	= {
				 id_empresa: $('#id_empresa').val()
				,empresa: $('#empresa').val()
			};

		$('form.tmp').sendRequestAjax({
			 url: url
			,data: data
			,dataType: 'html'
			,success: function(response) {
				$('#content-extras').html(response);
				$('#content-extras select').selectpicker();
				$('#asignacion-empleados').modal('show');
				add_form_validate('#form-modal-validate');
			}
		});

		e.preventDefault();
	})

	/**
	 * Element: <a.drop>
	 * Action: click
	 * Description: desactiva el empleado seleccionado
	 */
	.on('click', 'a.drop', function(e){
		var tr 	= $(this).closest('tr');
		var data = tr.data();
		swal({
			title: general_lang.esta_seguro,
			text: general_lang.no_reversible,
			type: 'warning',
			showCancelButton: true,
			confirmButtonText: general_lang.si_borralo,
		}).then(function () {
			$('form.tmp').sendRequestAjax({
				 url: base_url('admin/empresas/process_drop_empleado')
				,data: data
				,success: function(response){
					swal( response.title, response.msg, response.type);
					response.success && $('.datatables').DataTable().row(tr).remove().draw();
				}
			});
		}, function () {});
		
		e.preventDefault();
	});


	$('#content-extras')
	/**
	 * Recargamos la lista de los empleados al cerrar el modal
	 */
	.on('hidden.bs.modal', '#asignacion-empleados', function () {
	  	$('#content-extras').html('');
		$('form.tmp').sendRequestAjax({
			 url: base_url('admin/empresas/load_empleados_ajax')
			,data: {id_empresa: $('#id_empresa').val()}
			,dataType: 'html'
			,success: function(response) {
				$('.content-list-empleados').html(response);
				dataTableIni();
			}
		});
	});

	/**
	 * Element: <form#form-modal-validate'>
	 * Action: sumbit
	 * Description: Asignación de personales a la sucursal
	 */
	function add_form_validate(form) {
		$(form).validate({
		 	ignore:'.ignore'
		 	,rules: {
		 		"empleado[]": {
                	required: true,
                	minlength: 1
            	}
		 	}
		 	,submitHandler: function(form) {
			    $(form).sendRequestAjax({
			    	success: function(response) {
				    	swal({
				    		title:response.title
				    		,text: response.msg
				    		,type: response.type 
				    		,onClose: function() {
				    			if (response.success) {
				    				$(form).find('input:checked').closest('tr').remove();
				    			}
				    		}
				    	});
				    }
			    });
			}
		});
	}
});