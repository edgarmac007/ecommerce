$( document ).ready(function() {

	function path(Folder){
// Obtiene Carpeta raiz
    if(!Folder){Folder='v2';}
    Folder = Folder + '/';
    var dominio = document.domain;
    var raiz = window.location.pathname.split(Folder);
    var ruta = raiz[0] + Folder;
    return ruta;
	}


	$("#inputEnviar").click(function(){
		var data = {
			'nombre_contacto'   :$('input[name="nombre"').val(),
			'correo_electronico':$('input[name="correo"').val(),
			'num_telefono'      :$('input[name="telefono"').val(),
			'empresa'           :$('input[name="empresa"').val(),
			'asunto'            :$('input[name="asunto"').val(),
			'mensaje'           :$('input[name="comentarios"').val()
		}
		jQuery.ajax({
        type: "POST",
        url: path()+"guardarContacto",
        dataType: 'json',
        data     :data,
        success: function(data){
        	console.log(data);
            if(data.success>0){
            	swal("gracias por su interés. en breve nos pondremos en contacto con usted!");
            	$('input[name="nombre"').val("");
				$('input[name="correo"').val("");
				$('input[name="telefono"').val("");
				$('input[name="empresa"').val("");
				$('input[name="asunto"').val("");
				$('input[name="comentarios"').val("");
				location.reload();
            
            }else{
            	swal("Ocurrio un problema intentar de nuevo!");
            }
        },
        complete: function(){
            
        }
    });



    });
	
	
});

