(function ( $ ) {
	$.fn.extend({
		/**
		 * Función principal para realizar el envió de los datos via ajax a partir de un formulario
		 */
		sendRequestAjax: function(options) { 

			//DATOS QUE SE OBTIENE DEL FORMULARIO
			var $form 		= $(this);
				form_url 	= $form.prop('action'),
				form_data 	= $form.find(':not(.encript-md5)').serializeArray();

			//Se busca las contraseñas a encriptar
			$(this).find('.encript-md5').each(function(index) {
				form_data[form_data.length] = {
					'name': $(this).prop('name'), 
					'value':$.md5($(this).val())
				};
			});

			var settings = {
		         url: form_url					//ruta a enviar los datos
		        ,method: 'post'					//forma de enviar los datos del formulario.
		        ,data: form_data 				//datos a enviar ya sea un objeto o array, si no se recibe trata de obtener del form. example {data1: valor1, data2: valor2}
				,dataType: 'json' 				//dataType tipo de datos que se espera recibir del lado del servidor. xml | json | script | html
				,async: true
				,cache: true
				,contentType: 'application/x-www-form-urlencoded; charset=UTF-8'
				,processData: true
				,beforeSend: function(jqXHR) {} //función a realizar antes de procesar la petición al servidor
				,success: function(response) {} //script a ejecutar despues de procesar la petición al servidor
				,error: function(jqXHR) {} 		//función a realizar al generar un error en la petición al servidor
				,complete: function(jqXHR) {} 	//función a realizar al completar la petición al servidor
		    };
		    $.extend(settings, options);

			//SI NO SE HA DEFINIDO UNA RUTA DEL EVENTO AJAX, SE MANDA UNA ALERTA.
			if (!settings.url) {
				swal(general_lang.error, general_lang.ruta_no_definido, 'error');
				return false;
			}
			
			$.ajax({
				url: settings.url
				,method: settings.method
				,data: settings.data
				,dataType: settings.dataType
				,async: settings.async
				,cache: settings.cache
				,contentType: settings.contentType
				,processData: settings.processData
				,beforeSend: function(jqXHR, obj) {
					//DESACTIVAMOS EL BOTÓN DEL SUBMIT
					if($form.find('.submit').length) {
						$form.find('.submit').elDisable();
					}
					settings.beforeSend(jqXHR, obj);
				}
				,success: function(response, textStatus, jqXHR) {
					if(check_session(response)) {
						settings.success(response);
					}
				}
				,error: function(jqXHR, textStatus, errorThrown) {
					// console.log(jqXHR);				
					settings.error(jqXHR);
				}
				,statusCode: {
				    0: function() {
				      swal(general_lang.error, error_lang.error_0, 'error');
				    },
				    301: function() {
				      swal(general_lang.error, error_lang.error_301, 'error');
				    },
				    400: function() {
				      swal(general_lang.error, error_lang.error_400, 'error');
				    },
				    404: function() {
				      swal(general_lang.error, error_lang.error_404, 'error');
				    },
				    500: function() {
				      swal(general_lang.error, error_lang.error_500, 'error');
				    }
				}
				,complete: function(jqXHR) {
					//ACTIVAMOS EL BOTÓN DEL SUBMIT
					if($form.find('.submit').length) {
						$form.find('.submit').elEnable();
					}
					settings.complete(jqXHR)
				}
			});
		}
		/**
		 * Method para realizar una carga dinamica de un select
		 */
		,loadSelectForm: function(options) {
			// Default settings:
		    var settings = {
		        select: null, 	//Identidicador del select(id, class, etc)
		        content: null, 	//Identidicador del ontenedor del select(id, class, etc) para mostrar el loading
		        loading: '<div class="progress secondary-color-dark"><div class="indeterminate"></div></div>'
		    };
		    $.extend(settings, options);

			$(this).sendRequestAjax({
				dataType: 'html'
				,beforeSend: function(){
					$(settings.content).html(settings.loading);
				}
				,success: function(response){
					$(settings.content).html(response);
					$(settings.select).selectpicker();
				}
			});

			return this;
		}
		,serializeObject: function() {
			"use strict";
			var a = {};
			$.each(this.serializeArray(), function(b, c) {
				var d = a[c.name];
				"undefined"!= typeof d&&d!==null ? $.isArray(d) ? d.push(c.value) : a[c.name] = [d,c.value] : a[c.name] = c.value

			});

			return a;
		}
		,elDisable: function() {
			return $(this).addClass('disabled').prop('disabled', true);
		}
		,elEnable: function() {
			return $(this).removeClass('disabled').prop('disabled', false);
		}
		,addInputImg(options) {
			var settings = {
				contentClass: 'col-md-3 col-sm-3 text-center'
				,showCloseBtn: true
				,showInputSelectBtn: true
				,showInputChangeBtn: true
				,showInputRemoveBtn: true
				,inputFileName: 'file'
				,InputTextSelect: general_lang.general_select_img
				,InputTextChange: general_lang.general_cambiar
				,InputTextRemove: general_lang.general_quitar
				,inputBtnClose: '<a class="btn btn-primary btn-xs btn-round input-file-close">X</a>'
				,inputBtnSelect: '<span class="fileinput-new">{0}</span>'
				,inputBtnChange: '<span class="fileinput-exists">{0}</span>'
				,inputBtnRemove: '<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">{0}</a>'
				,template: [
					,'<div class="{0}">'
						,'' //Button close
			            ,'<div class="fileinput fileinput-new" data-provides="fileinput">'
			                ,'<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>'
			                ,'<div>'
			                    ,'<span class="btn btn-round btn-rose btn-file btn-sm">'
			                        ,'' //Button select
			                        ,'' //Button change
			                        ,'' //button remove
			                        ,'<input type="file" class="validate ignore" name="{0}" accept="image/*">'
			                    ,'</span>'
			                ,'</div>'
			            ,'</div>'
			        ,'</div>'
				]
			};

			$.extend(settings, options);

			//AGREGAMOS EL BOTÓN CERRAR
			settings.showCloseBtn 		? settings.template[1] = settings.inputBtnClose : false;
			//AGREGAMOS EL BOTÓN SELECT
			settings.showInputSelectBtn ? settings.template[6] = settings.inputBtnSelect : false;
			//AGREGAMOS EL BOTÓN CHANG
			settings.showInputChangeBtn ? settings.template[7] = settings.inputBtnChange : false;
			//AGREGAMOS EL BOTÓN CHANGE
			settings.showInputRemoveBtn ? settings.template[8] = settings.inputBtnRemove : false;
			
			//REQUIED VENDOR jQuery-validation TO REPLACE TEXT
			// http://jqueryvalidation.org/jQuery.validator.format/
			//AGREGAMOS LA CLASE AL CONTENIDO
			$.validator.format(settings.template[0], settings.contentClass);
			$.validator.format(settings.template[9], settings.inputFileName);

			settings.template[6] != '' 	? $.validator.format(settings.template[6], settings.InputTextSelect) : false;
			settings.template[7] != '' 	? $.validator.format(settings.template[7], settings.InputTextChange) : false;
			settings.template[8] != '' 	? $.validator.format(settings.template[8], settings.InputTextRemove) : false;

			//INSERT INPUT FILE
			$(settings.template.join()).insertAfter($(this));

			return $(this);
		}
	});
 
}(jQuery));
