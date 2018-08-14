$('li a#inicio').removeClass('selected');
$('li a#acerca-de').addClass('selected');


	$('a[href="#mision"').on('click', function(event){ 
		$('div#vision').fadeOut('fast');
		$('div#valores').fadeOut('fast'); 
		var href = $(this).attr('href');
		$('div'+href).fadeIn('slow');
	    $('html, body').stop(true,true).animate({scrollTop: $('.descripcion-content').offset().top -120 }, 800,"swing");
		setTimeout(function(){scroll_navigation=true},800);		
		
	});
	$('a[href="#vision"').on('click', function(event){  
		$('div#mision').fadeOut('fast');
		$('div#valores').fadeOut('fast');
		var href = $(this).attr('href');
		$('div'+href).fadeIn('slow');
	    $('html, body').stop(true,true).animate({scrollTop: $('.descripcion-content').offset().top -120 }, 800,"swing");
		setTimeout(function(){scroll_navigation=true},800);		
	});
	$('a[href="#valores"').on('click', function(event){  
		$('div#mision').fadeOut('fast');
		$('div#vision').fadeOut('fast');
		var href = $(this).attr('href');
		$('div'+href).fadeIn('slow');
	    $('html, body').stop(true,true).animate({scrollTop: $('.descripcion-content').offset().top -120 }, 800,"swing");
		setTimeout(function(){scroll_navigation=true},800);		
	});