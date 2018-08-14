$( document ).ready(function() {
	$(' .da-thumbs > li').each( function() { $(this).hoverdir(); } );
	$('#language-select a.lang').each(function(key,value){
		var lenguage = $(value).attr('lang');
		var pathname = window.location.pathname.split( '/' );
		if(pathname[2] == ''){
			$("#inicio").addClass('selected');
		}else{
            $("#"+pathname[2]).addClass('selected');
        }
		pathname = pathname[0]+'/'+pathname[1]+'/'+pathname[2]+'/'+lenguage;
		$(value).attr('href',pathname);
		
	});



});

function formData(selector, template){
    /**
    * Descripcion:  Crea un objeto recuperando los valores ingresados en los campos INPUT
    * Comentario:   Los elementos html deben estar dentro de un mismo <div> y tiene que 
    *               tener el atributo:data-campo="[nombre_campo]"
    * Ejemplo:      <div id="formulario"><input id="id_orden" type="hidden" data-campo="id_orden" value="{id_orden}" /></div>
    *               <script> var objData = formData('#formulario'); </script>
    * @author:      Oscar Maldonado - O3M
    */
    var data = template ? template : {}; // Valores predeterminados - Opcional
    var c, f, r, v, m, $e, $elements = jQuery(selector).find("input, select, textarea");
    for (var i = 0; i < $elements.length; i++){
        $e = jQuery($elements[i]);
        // alert($elements[i]['id']);  
        f = $e.data("campo");
        r = $e.attr("required") ? true: false;  
        // validación de que exista un elemento
        if (!f) continue;  
        // Recolección datos por tipo de elemento
        v = undefined;
        switch ($e[0].nodeName.toUpperCase()){
            case "LABEL":
                v = $e.text();
                break;
            case "INPUT":
                var type = $e.attr("type").toUpperCase();
                if (type == "TEXT" || type == "HIDDEN" || type=="COLOR"){
                    v = jQuery.trim($e.val());
                }
                else if (type == "CHECKBOX"){
                    v = $e.prop("checked");
                }
                else if (type == "RADIO"){
                    if ($e.prop("checked"))
                        v = $e.val();
                }
                else if ($e.datepicker){
                    v = $e.datepicker("getDate");
                }
                else{
                    v = jQuery.trim($e.val());
                }
                break;
            case "SELECT":
                v = jQuery.trim($e.val());
                break;
            case "TEXTAREA":
            default:
                v = jQuery.trim($e.val());
        }  
        // Guarda el valor en el objeto
        if (r && (v == undefined || v == "")){
            m = $e.data("mensaje");
            if (m)
                alert(m);
            else
                alert("Es necesario especificar un valor para el campo \"" + f + "\".");
            $e.focus();
            return null;
        }
        else if (v != undefined)            
            data[i] = v;  
            data[f] = v; 
    }// next  
    return data;
}