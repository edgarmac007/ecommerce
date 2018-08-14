$(document).ready(function() {
	var row;

	/**
	 * Tabla principal para los eventos jQuery
	 */
	 $("#table-main")

	/**
	 * Element: <a.restart-password>
	 * Action: click
	 * Description: Envío de correo para la restauración de la contraseña
	 */
	.on('click', 'a.edit', function(e){
		var data = $(this).closest('tr').data();
		$.extend(data, $(this).data());
		row = $(this).closest('tr');
		
		$("#user-account #id_usuario").val(data.id_usuario);
		$("#user-account #username").val(data.username);
		$("#user-account #email").val(data.email);
		$("#user-account #id_lang").val(data.id_lang).selectpicker('refresh');
		$("#user-account #id_perfil").val(data.id_perfil).selectpicker('refresh');
		$("#user-account #id_rol").val(data.id_rol).selectpicker('refresh');

		$("#user-account").modal('show');
		e.preventDefault();
	})

	/**
	 * Element: <a.drop>
	 * Action: click
	 * Description: desactiva la cuenta del personal seleccionado
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
			var url = base_url('admin/administracion/usuarios/process_drop');
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
		var a 	= $(this);
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
						$(a).remove();
					}
				}
			});
		}, function () {});
		
		e.preventDefault();
	});

	/**
	 * Element: <form>
	 * Event: Submit
	 * Description: Actualización de datos del usuario
	 **/
	 $("#form-validate").validate({
	 	submitHandler: function(form) {
	 		$(form).sendRequestAjax({
	 			url: base_url('admin/administracion/usuarios/process_update')
	 			,success: function(response) {
	 				swal({
	 					title: response.title
	 					,text: response.msg
	 					,type: response.type
	 					,onClose: function() {
			 				if (response.success) {
			 					var data = $("#table-main").DataTable().row(row).data();
			 					data[3] = response.row.rol;
			 					data[4] = response.row.perfil;
			 					data[5] = response.row.short_key;
			 					data[7] = response.row.actions;

			 					$("#table-main").DataTable().row(row).data(data).draw();
			 					$("#user-account").modal('hide');
			 				}
	 					}
	 				});
	 			}
	 		});
	 	}
	});
});