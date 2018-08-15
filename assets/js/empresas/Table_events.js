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
		swal({
			title: general_lang.esta_seguro,
			text: general_lang.no_reversible,
			type: 'warning',
			showCancelButton: true,
			confirmButtonText: general_lang.si_borralo,
		}).then(function () {
			$('form.tmp').sendRequestAjax({
				 url: base_url('admin/empresas/process_drop_empresa')
				,data: data
				,success: function(response){
					swal( response.title, response.msg, response.type);
					response.success && $('.datatables').DataTable().row(tr).remove().draw();
				}
			});
		}, function () {});
		
		e.preventDefault();
	});
});