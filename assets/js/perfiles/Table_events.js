$(document).ready(function() {

	/**
	 * Tabla principal para los eventos jQuery
	 */
	 $("#table-main")

	/**
	 * Element: <a.edit>
	 * Action: click
	 * Description: Envía a un nuevo formmulario para editar el perfil
	 */
	.on('click', 'a.edit', function(e){
		var data = $(this).closest('tr').data(),
			url  = base_url("admin/update-perfil");
		form_send(data, url, false);
		e.preventDefault();
	})

	/**
	 * Element: <a.drop>
	 * Action: click
	 * Description: Elimina el perfil seleccionado
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
			var url = base_url('admin/catalogos/perfiles/process_drop');
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
	});
});