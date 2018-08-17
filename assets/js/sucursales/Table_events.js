jQuery(function() {
	var link = '';

	/**
	 * Tabla principal para los eventos jQuery
	 */
	 $("#table-main")

	/**
	 * Element: <a.edit>
	 * Action: click
	 * Description: Envía a un nuevo formmulario para editar los datos de la sucursal
	 */
	.on('click', 'a.edit', function(e){
		var data = $(this).closest('tr').data(),
			url  = base_url("admin/update-sucursal");
		form_send(data, url);
		e.preventDefault();
	})

	/**
	 * Element: <a.empleados>
	 * Action: click
	 * Description: Enviamos a la lista de los empleados de la sucursal seleccionado
	 */
	.on('click', 'a.empleados', function(e){
		var data = $(this).closest('tr').data(),
			url  = base_url("admin/empleados-sucursal");
		form_send(data, url);
		e.preventDefault();
	})

	/**
	 * Element: <a.drop>
	 * Action: click
	 * Description: desactiva la sucursal seleccionada
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
				 url: base_url('admin/empresas/process_drop_sucursal')
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