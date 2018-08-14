$(document).ready(function() {
	var link = '';

	/**
	 * Tabla principal para los eventos jQuery
	 */
	 $("#table-main")

	/**
	 * Element: <a.edit>
	 * Action: click
	 * Description: Envía a un nuevo formmulario para editar los datos del personal
	 */
	.on('click', 'a.edit', function(e){
		var data = $(this).closest('tr').data(),
			url  = base_url("admin/update-personal");
		form_send(data, url);
		e.preventDefault();
	})

	/**
	 * Element: <a.drop>
	 * Action: click
	 * Description: desactiva el personal seleccionado
	 */
	.on('click', 'a.drop', function(e){
		var tr 	= $(this).closest('tr');
		var data = tr.data();
		data.id_usuario = $(this).data('id_usuario');
		swal({
			title: general_lang.esta_seguro,
			text: general_lang.no_reversible,
			type: 'warning',
			showCancelButton: true,
			confirmButtonText: general_lang.si_borralo,
		}).then(function () {
			var url = base_url('admin/administracion/personales/process_drop');
			var form = form_send(data, url, true);

			$(form).sendRequestAjax({
				success: function(response){
					swal( response.title, response.msg, response.type);
					if (response.success) {
						$('.datatables').DataTable().row(tr).remove().draw();
					}
				}
			});
		}, function () {});
		
		e.preventDefault();
	})

	/**
	 * Element: <a.enable-user>
	 * Action: click
	 * Description: activamos la cuenta del usuario
	 **/
	.on('click', 'a.enable-user', function(e) {
		var link = $(this);
		var data = $(this).data();
		swal({
			title: general_lang.esta_seguro,
			text: personal_lang.enable_account,
			type: 'warning',
			showCancelButton: true,
			confirmButtonText: general_lang.aceptar,
		}).then(function () {
			var url = base_url('admin/administracion/personales/enable_user');
			var form = form_send(data, url, true);

			$(form).sendRequestAjax({
				success: function(response){
					swal( response.title, response.msg, response.type);
					if (response.success) {
						$(link).remove();
					}
				}
			});
		}, function () {});
		
		e.preventDefault();
	})

	/**
	 * Element: <a.new-user>
	 * Event: Click
	 * Description: abrimos el modal los datos del personal
	 **/
	.on('click', 'a.new-user', function(e) {
		var tr 	 = $(this).closest('tr');
		var url  = base_url("general/get_data_personal"),
			data = tr.data();
			link = $(this);

		$("#new-account select").val('').selectpicker('refresh');
		$('form').sendRequestAjax({
			url: url
			,data: data
			,success: function(response) {
				$("#id_personal").val(response.id_personal);
				$("#nombre").val(response.nombre);
				$("#paterno").val(response.paterno);
				$("#materno").val(response.materno);
				$("#area").val(response.area);
				$("#correo").val(response.correo_emp);
				$("#tel_emp").val(response.tel_emp);

				$("#new-account").modal({
					backdrop: false
					,keyboard: true
					,show: true
				});
			}
		});
		e.preventDefault();
	});

	/** 
	 * Element: <form.form-validate>
	 * Action: submit
	 * Description: validacion del formulario para la creación de la cuenta del personal
	 **/
	$("#form-validate").validate({
		submitHandler: function(form) {
			$(form).sendRequestAjax({
				url: base_url('admin/administracion/personales/create_account')
				,success: function(response) {
		    		if (response.success) {
		    			$(link).remove();
		    			$("#new-account").modal('hide');
			    	}
					swal(response.title, response.msg, response.type);
				}
			});
		}
	});
});