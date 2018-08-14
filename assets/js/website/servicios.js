
$( document ).ready(function() {
	$('li a#servicios').addClass('selected');
	$('li a#inicio').removeClass('selected');
	var $lans = $('#list-servicios > div');
	$( 'a.selecciona-servicio' ).click(function() {
	    var $target = $lans.filter($(this).attr('href'));
	    $lans.not($target).fadeOut('fast');
	    $target.fadeIn();
	   		$('html, body').stop(true,true).animate({scrollTop: $('#list-servicios').offset().top -120 }, 800,"swing");
			setTimeout(function(){scroll_navigation=true},800)
	});
	$(".cerrar-detalles").click(function(){
		$(".mas-detalles").slideUp();
	});


});

