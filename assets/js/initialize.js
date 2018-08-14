(function ( $ ) {
    //inicializamos las variables del datatable
    $.extend( $.fn.dataTable.defaults, {
        oLanguage: {
        	sUrl: base_url() + '/assets/js/language/' + language + '/data-Tables.json'
        }
        ,oClasses: {
        	sFilterInput: 'form-control input-sm'
        	,sFilter: 'dataTables_filter'
        	,sFilterLabel: 'form-group'
        	,sFilterSelect: 'form-group'
        }
        ,responsive: true
    });

    $(document).ready(function($){
        /** Inicializamos la datatable **/
        $('.datatables').each(function(){
            $(this).DataTable();
        });
        
    	/** Inicializamos el selectpicker **/
        $(".selectpicker").each(function(){
            $(this).selectpicker();
        });

        /** Inicializamos el tooltip**/
        if ($('[data-toggle="tooltip"]').length) {
            $('[data-toggle="tooltip"]').tooltip()
        }

        /** Inicializamos el tags**/
        if ($('.tagsinput').length) {
            var tagClass = $('.tagsinput').data('color');

            $('.tagsinput').tagsinput({
                tagClass: ' tag-'+ tagClass +' '
            });
        }

        /** Inicializamos el datepicker**/
        if ($('.datepicker').length) {
            $('.datepicker').bootstrapMaterialDatePicker({ 
                weekStart: 0
                ,time: false 
                ,lang : 'es'
                ,format: 'YYYY/MM/DD'
                ,cancelText: 'Cancelar'
                ,okText: 'Aceptar'
                ,clearText: 'Limpiar'
                ,nowText: 'Hoy'
            });
        }

        /** inicializamos el froalaEditor */
        $(".editor-html").froalaEditor({
            heightMin: 150
            ,heightMax: 400
            ,toolbarBottom: true
            ,toolbarButtons: [
                 'fullscreen'
                ,'bold'
                ,'italic'
                ,'underline'
                ,'strikeThrough'
                ,'subscript'
                ,'superscript'
                ,'fontFamily'
                ,'fontSize'
                ,'|'
                ,'color'
                ,'emoticons'
                ,'inlineStyle'
                ,'paragraphStyle'
                ,'|'
                ,'paragraphFormat'
                ,'align'
                ,'formatOL'
                ,'formatUL'
                ,'outdent'
                ,'indent'
                ,'-'
                ,'insertLink'
                ,'insertImage'
                ,'insertTable'
                ,'|'
                ,'quote'
                ,'insertHR'
                ,'undo'
                ,'redo'
                ,'clearFormatting'
                ,'selectAll'
                ,'html'
            ]
            ,imageAllowedTypes : [ 'jpeg' , 'jpg' , 'png' ]
            ,imageUploadURL: base_url('general/upload_img')
            ,imageUploadMethod: 'POST'
        });

        /** inicializamos el fileinput */
        $(".fileinput").fileinput({name:'file'});

        /** Asignamos valores por default al swelt alert**/
        swal.setDefaults({
            cancelButtonText: general_lang.cancelar,
            confirmButtonText: general_lang.aceptar,
            buttonsStyling: false,
            confirmButtonClass: 'btn btn-success',
            cancelButtonClass: 'btn btn-danger'
        });
    });
}(jQuery));