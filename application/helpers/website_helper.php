<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 5H2
 * @version 1.0.1
 */

/**
 * Función para la construcción de menus navagacion website
 * @param $data Array datos para la construccion menus webiste
 * @return $content HTML
 */

if (!function_exists('build_menu_website')) {
	
	function build_menu_website($data = array(),$base_url= ''){
		
		$size = count($data);
		$content = '';
		if(is_array($data) && $size>0) {
			foreach ($data as $menu) :
				$content .= "<li><a id='".$menu['url']."' href='".$base_url.$menu['url'].'/'.$menu['lang']."' class='opc-menu'>".$menu["titulo"]."</a></li>";	
			endforeach;
		}
		return $content;
	}
}

if (!function_exists('build_menu_lenguajes')) {
	function build_menu_lenguajes($data = array()){
		$html      = '';
		$html_body = '';
		if(is_array($data)) {
			$html_header = "<ul class='pull-right'>";
			foreach ($data as $key => $lenguage) {
				$html_body .= "<li><a href='#' class='lang' lang='".$lenguage['lang']."'>".$lenguage['language']."</a</li>";
            }
            $html_footer = "</ul>";
            $html = $html_header.$html_body.$html_footer;
		}
		return $html;
	}
	
}




/**
 * Función para la construcción de los slider 
 * @param $data Array datos para la construccion menus webiste
 * @return $content HTML
 */

if (!function_exists('slider_web')) {
	function slider_web($data = array()){

		$size = count($data);
		$html = '';
		
		if(is_array($data) && $size){
			$slider_header = "<div class='row slider'>
			              <div id='slideshow' class='slideshow module-slider'>
						  <div class='cycle-slideshow' 
						  data-cycle-swipe=true
						  data-cycle-swipe-fx=scrollHorz
		                  data-cycle-prev='.cycle-prev'
		                  data-cycle-next='.cycle-next'
		                  data-cycle-timeout='2000'
		                  data-cycle-slides='img'
						  > ";
			$image = '';
			foreach ($data as $key => $img) {
				$url_img =(isset($img['ruta_img']) && file_exists($img['ruta_img']))?base_url().$img['ruta_img']:'http://www.arbibe.com.mx/media/Galery/2-banner-oficinas-apq.jpg';
				//$url_img = isset($img['ruta_img'])?$img['ruta_img']:'http://www.arbibe.com.mx/media/Galery/2-banner-oficinas-apq.jpg';
				$title =isset($img['titulo']) ? $img['titulo'] : '';
				$image.="<img src='".$url_img."' class='img-responsive img-res' title='".$title ."' alt='".$title ."' class='img-responsive'>";
			}
			$slider_footer = "</div></div></div>";
			$html =$slider_header.$image.$slider_footer;
		}

		return $html;
	}
}

/**
 * Función para construir el thumb en linea
 * @param $data
 * @return $ HTML
 */
if (!function_exists('container_thumbs_inline')) {
	function container_thumbs_inline($data = array()){
		$html            = '';
		$html_body       = '';
		$class_seccion   = isset($data['class'])?$data['class']:'bgcolor-verdegris projects-container';			
		$html_header     = "<div class='row ".$class_seccion."'>
			               <div class='container-fluid sinmargen sinpadding'>
			               <ul class='da-thumbs lista-de-proyectos'>";

		$size = count($data['proyectos']);

		if($size>0 && isset($data['proyectos'])) {
			foreach ($data['proyectos'] as $key => $proyecto) {
				$img_url    = isset($proyecto['i'])?$proyecto['i']:'http://www.arbibe.com.mx/media/Imagenes/Portadas/Proyectos/aeropuerto-cancun.jpg';				
				$html_body .= "<li class='col-md-4 col-sm-4 col-xs-12 sinpadding '>
							   <a href='#' data-toggle='modal' data-target='#myModal".$proyecto['id_proyecto']."'>
							   <img src='".$img_url."' class='img-responsive' alt='".$proyecto['nombre']."' title='".$proyecto['nombre']."' >
							   <div class='over text-center'>
							   <span class='flaticon flaticon-people'></span>
							   <hr class='hr-proyecto'>
							   <p class='fs16'><strong>".$proyecto['nombre']."</strong></p>
							   </div>
						       </a>
					           </li>";
			}
			$html_footer = "</ul></div></div>";
			$html        = $html_header.$html_body.$html_footer;
		}
		return $html;
	}
}/**
 * Función para construir el thumb en linea
 * @param $data
 * @return $ HTML
 */
// if (!function_exists('container_thumbs_inline_servicio')) {
// 	function container_thumbs_inline_servicio($data = array()){

// 		$html            = '';
// 		$html_body       = '';
// 		$class_seccion   = isset($data['class'])?$data['class']:'bgcolor-verdegris projects-container';			
		
// 		$servicio_for_slider = array();
// 		if(is_array($data['servicios_item'])){
// 			foreach ($data['servicios_item'] as $key_servicio => $servicio) {
// 				foreach ($data['servicios'] as $key => $slider) {
// 					if($servicio == $slider['id_servicio']){
// 						$servicio_for_slider[$slider['id_servicio']][] = $slider;
// 					}
// 				}
// 			}
// 		}
// 		$datax = array();
// 		foreach ($servicio_for_slider as $id_servicio => $servicio_sliders) {
// 			$html_header     = "<div class='row ".$class_seccion."'>
// 							<div class='container-fluid sinmargen sinpadding'>
// 							<ul class='da-thumbs'>";
// 			foreach ($servicio_sliders as $slider) {
// 				$img_url    = isset($slider['i'])?$slider['i']:'http://www.arbibe.com.mx/media/Imagenes/Portadas/Proyectos/aeropuerto-cancun.jpg';				

// 				$html_body .= "<li class='col-md-4 col-sm-4 col-xs-12 sinpadding '>
// 							   <a href='#' data-toggle='modal' data-target='#myModal".$slider['id_servicio']."'>
// 							   <img src='".$img_url."' class='img-responsive' alt='".$slider['titulo']."' title='".$slider['titulo']."' >
// 							   <div class='over text-center'>
// 							   <span class='flaticon flaticon-people'></span>
// 							   <hr class='hr-proyecto'>
// 							   <p class='fs16'><strong>".$slider['titulo']."</strong></p>
// 							   </div>
// 						       </a>
// 					           </li>";
// 			}
// 			$html_footer = "</ul></div></div>";
// 			$html        = $html_header.$html_body.$html_footer;
// 			$datax[$id_servicio] = $html; 
// 			$html_body   = "";
				
// 		}



// 		// $html_header     = "<div class='row ".$class_seccion."'>
// 		// <div class='container-fluid sinmargen sinpadding'>
// 		// <ul class='da-thumbs'>";
// 		// $size = count($data['servicios']);
// 		// if($size>0 && isset($data['servicios'])) {
// 		// 	foreach ($data['servicios'] as $key => $servicio) {
// 		// 		$img_url    = isset($servicio['i'])?$servicio['i']:'http://www.arbibe.com.mx/media/Imagenes/Portadas/Proyectos/aeropuerto-cancun.jpg';				
// 		// 		$html_body .= "<li class='col-md-4 col-sm-4 col-xs-12 sinpadding '>
// 		// 					   <a href='#' data-toggle='modal' data-target='#myModal".$servicio['id_servicio']."'>
// 		// 					   <img src='".$img_url."' class='img-responsive' alt='".$servicio['titulo']."' title='".$servicio['titulo']."' >
// 		// 					   <div class='over text-center'>
// 		// 					   <span class='flaticon flaticon-people'></span>
// 		// 					   <hr class='hr-proyecto'>
// 		// 					   <p class='fs16'><strong>".$servicio['titulo']."</strong></p>
// 		// 					   </div>
// 		// 				       </a>
// 		// 			           </li>";
// 		// 	}
// 		// 	$html_footer = "</ul></div></div>";
// 		// 	$html        = $html_header.$html_body.$html_footer;
// 		// 	$html_body   = "";

// 		// }
// 		return $datax;
// 	}
// }
if (!function_exists('container_thumbs_inline_servicio')) {
	function container_thumbs_inline_servicio($data = array()){

		$html            = '';
		$html_body       = '';
		$class_seccion   = isset($data['class'])?$data['class']:'bgcolor-verdegris projects-container';			
		
		$servicio_for_slider = array();
		if(is_array($data['servicios_item'])){
			foreach ($data['servicios_item'] as $key_servicio => $servicio) {
				foreach ($data['servicios'] as $key => $slider) {
					if($servicio == $slider['id_servicio']){
						$servicio_for_slider[$slider['id_servicio']][] = $slider;
					}
				}
			}
		}

		// debug($servicio_for_slider);
		// foreach ($proyectos as $key => $proyecto) {
		// 		foreach ($slider_proyectos as $key => $slider) {
		// 			if($proyecto['id_proyecto'] == $slider['id_proyecto']) {
		// 				$proyecto_for_slider[$proyecto['id_proyecto']][] = $slider;
		// 			}

		// 		}
		// }	
			  
		$size = count($data['servicios']);
		if($size>0 && isset($data['servicios'])) {
		$datax = array();
		foreach ($servicio_for_slider as $id_servicio => $servicio_sliders) {
			$html_header     = "<div class='row ".$class_seccion."'>
							<div class='container-fluid sinmargen sinpadding'>
							<ul class='da-thumbs'>";
			foreach ($servicio_sliders as $slider) {
				$img_url    = isset($slider['ruta_img'])?base_url().$slider['ruta_img']:'http://www.arbibe.com.mx/media/Imagenes/Portadas/Proyectos/aeropuerto-cancun.jpg';				
				$html_body .= "<li class='col-md-4 col-sm-4 col-xs-12 sinpadding '>
							   <a href='#' data-toggle='modal' data-target='#myModal".$slider['id_servicio']."'>
							   <img src='".$img_url."' class='img-responsive' alt='".$slider['titulo']."' title='".$slider['titulo']."' >
							   <div class='over text-center'>
							   <span class='flaticon flaticon-people'></span>
							   <hr class='hr-proyecto'>
							   <p class='fs16'><strong>".$slider['titulo']."</strong></p>
							   </div>
						       </a>
					           </li>";
			}
			$html_footer = "</ul></div></div>";
			$html        = $html_header.$html_body.$html_footer;
			$datax[$id_servicio] = $html; 
			$html_body   = "";
				
		}



		// $html_header     = "<div class='row ".$class_seccion."'>
		// <div class='container-fluid sinmargen sinpadding'>
		// <ul class='da-thumbs'>";
		// $size = count($data['servicios']);
		// if($size>0 && isset($data['servicios'])) {
		// 	foreach ($data['servicios'] as $key => $servicio) {
		// 		$img_url    = isset($servicio['i'])?$servicio['i']:'http://www.arbibe.com.mx/media/Imagenes/Portadas/Proyectos/aeropuerto-cancun.jpg';				
		// 		$html_body .= "<li class='col-md-4 col-sm-4 col-xs-12 sinpadding '>
		// 					   <a href='#' data-toggle='modal' data-target='#myModal".$servicio['id_servicio']."'>
		// 					   <img src='".$img_url."' class='img-responsive' alt='".$servicio['titulo']."' title='".$servicio['titulo']."' >
		// 					   <div class='over text-center'>
		// 					   <span class='flaticon flaticon-people'></span>
		// 					   <hr class='hr-proyecto'>
		// 					   <p class='fs16'><strong>".$servicio['titulo']."</strong></p>
		// 					   </div>
		// 				       </a>
		// 			           </li>";
		// 	}
		// 	$html_footer = "</ul></div></div>";
		// 	$html        = $html_header.$html_body.$html_footer;
		// 	$html_body   = "";

		}
		return $datax;
	}
}

if (!function_exists('thumbs_modal')) {
	function thumbs_modal($data = array()){

		$proyectos         = isset($data['proyectos'])?$data['proyectos']:'';
		$slider_proyectos  = isset($data['slider_proyectos'])?$data['slider_proyectos']:'';
		$modal_header      = "<div class='row'>";
		$modal_body        = "";
		$proyecto_for_slider = array();
		$modal_he          = '';
		$modal_bo          = '';
		$modal_fo          = '';
		$modal             = '';
		$des_pro           = '';
		
		if(is_array($proyectos)){

			foreach ($proyectos as $key => $proyecto) {
				foreach ($slider_proyectos as $key => $slider) {
					if($proyecto['id_proyecto'] == $slider['id_proyecto']) {
						$proyecto_for_slider[$proyecto['id_proyecto']][] = $slider;
					}

				}
			}	

			//debug($proyecto_for_slider);
			foreach ($proyecto_for_slider as $key_1 => $slider_gl) {
					$id_proyecto = $key_1;

					foreach ($slider_gl as $key => $slider[$key_1]) {
						$modal_bo .= "
				                    <div class='img cycle-slide'>
				                    <img src='".base_url().$slider['ruta_img']."' class='img-responsive img-modal' title='' alt=''>
				                    </div>
					";	
					}


					$modal_he .= "<div class='modal fade' id='myModal".$id_proyecto."' role='dialog'>
    				  				<div class='table'>
    								<div class='table-cell'>
    								<div class='modal-dialog'>
			        				<!-- Modal content Tour-->
			        				<div class='modal-content'>
			          				<div class='modal-header'>
			            			<button type='button' class='close' data-dismiss='modal'>
			            			<i class='flaticon flaticon-delete'></i>
			        				</button>
			          				</div>
			          				<div class='row modal-body'>
			            			<div class='col-md-12 col-sm-12 col-xs-12'>
			              			<div id='slideshow-1'>

			                		 <div id='cycle-1' class='cycle-slideshow'
	                          data-cycle-slides='> div'
	                          data-cycle-timeout='3000'
	                          data-cycle-prev='#slideshow-1 .cycle-prev'
	                          data-cycle-next='#slideshow-1 .cycle-next'
	                          data-cycle-caption='#slideshow-1 .custom-caption'
	                          data-cycle-caption-template='Slide 0 of 10'
	                          data-cycle-fx='tileBlind'>
							 
			                        ".$modal_bo."
			                         <a href=# class='cycle-prev controls'>
			                  <span class='glyphicon glyphicon-chevron-left'></span>
			                  </a>
			                   <a href=# class='cycle-next controls'>
			                        <span class='glyphicon glyphicon-chevron-right'></span>
			                        </a>
	                          		</div>
			              			</div>
			            			</div>";

					

					foreach ($proyectos as $key => $proyecto) {
						if($proyecto['id_proyecto'] == $id_proyecto ){
							$des_pro .= "<h5 class='>".$proyecto['nombre']."</h5>
			            				<span class=''>".$proyecto['descripcion']."</span>
			            				<br>";
						}	
					}
					$modal_fo .= "<div class='col-md-10 col-md-offset-1 col-sm-offset-1 col-sm-10 col-xs-12 proyecto-desc text-center'>
			            			".$des_pro."
			            			<br>
			            			</div></div></div>
			      				</div>
    							</div>
    							</div>
    							</div>";

    				$modal .= $modal_he.$modal_fo;
    				$modal_he = "";
    				$modal_bo = "";
    				$modal_fo = "";
    				$des_pro  = "";

								
			}
			
		}
	$modal_footer = "</div>";
	//debug($modal_body);
	return $modal;

	}
}


if (!function_exists('thumbs_modal_servicio')) {
	function thumbs_modal_servicio($data = array()){

		$servicios         = isset($data['servicios'])?$data['servicios']:'';
		$slider_servicios  = isset($data['slider_servicios'])?$data['slider_servicios']:'';
		$modal_header      = "<div class='row'>";
		$modal_body        = "";
		$proyecto_for_slider = array();
		$modal_he          = '';
		$modal_bo          = '';
		$modal_fo          = '';
		$modal             = '';
		$des_pro           = '';
		
		if(is_array($servicios)){

			foreach ($servicios as $key => $servicio) {
				foreach ($slider_servicios as $key => $slider) {
					if($servicio['id_servicio'] == $slider['id_servicio']) {
						$proyecto_for_slider[$servicio['id_servicio']][] = $slider;
					}

				}
			}	
			// debug($proyecto_for_slider);
			foreach ($proyecto_for_slider as $key_1 => $slider_gl) {
					$id_servicio = $key_1;

					foreach ($slider_gl as $key => $slider[$key_1]) {
						
						$modal_bo .= "
				                    <div class='img cycle-slide'>
				                    <img src='".base_url().$slider[$key_1]['ruta_img']."' class='img-responsive img-modal' title='".$slider[$key_1]['titulo']."' alt='".$slider[$key_1]['titulo']."'>
				                    </div>
						";	
					}
					$modal_he .= "<div class='modal fade' id='myModal".$id_servicio."' role='dialog'>
    				  				<div class='table'>
    								<div class='table-cell'>
    								<div class='modal-dialog'>
			        				<!-- Modal content Tour-->
			        				<div class='modal-content'>
			          				<div class='modal-header'>
			            			<button type='button' class='close' data-dismiss='modal'>
			            			<i class='flaticon flaticon-delete'></i>
			        				</button>
			          				</div>
			          				<div class='row modal-body'>
			            			<div class='col-md-12 col-sm-12 col-xs-12'>
			              			<div id='slideshow-1'>

			                		 <div id='cycle-1' class='cycle-slideshow'
	                          data-cycle-slides='> div'
	                          data-cycle-timeout='3000'
	                          data-cycle-prev='#slideshow-1 .cycle-prev'
	                          data-cycle-next='#slideshow-1 .cycle-next'
	                          data-cycle-caption='#slideshow-1 .custom-caption'
	                          data-cycle-caption-template='Slide 0 of 10'
	                          data-cycle-fx='tileBlind'>
							 
			                        ".$modal_bo."
			                         <a href=# class='cycle-prev controls'>
			                  <span class='glyphicon glyphicon-chevron-left'></span>
			                  </a>
			                   <a href=# class='cycle-next controls'>
			                        <span class='glyphicon glyphicon-chevron-right'></span>
			                        </a>
	                          		</div>
			              			</div>
			            			</div>";

					

					foreach ($servicios as $key => $servicio) {
						if($servicio['id_servicio'] == $id_servicio ){
							$des_pro .= "<h5 class='>".$servicio['titulo']."</h5>
			            				<span class=''>".$servicio['descripcion']."</span>
			            				<br>";
						}	
					}
					$modal_fo .= "<div class='col-md-10 col-md-offset-1 col-sm-offset-1 col-sm-10 col-xs-12 proyecto-desc text-center'>
			            			".$des_pro."
			            			<br>
			            			</div></div></div>
			      				</div>
    							</div>
    							</div>
    							</div>";

    				$modal .= $modal_he.$modal_fo;
    				$modal_he = "";
    				$modal_bo = "";
    				$modal_fo = "";
    				$des_pro  = "";

								
			}
			
		}
	$modal_footer = "</div>";
	
	return $modal;

	}
}
    				   



if (!function_exists('container_thumbs')) {
	function container_thumbs($data = array(),$data_extra = array()){
		
		$class_seccion   = isset($data['class'])        ?$data['class']          :'inicio-servicios';
		$lang            = isset($data_extra['lang'])   ?$data_extra['lang']     :'es';
		$base_url        = isset($data_extra['base_url'])?$data_extra['base_url']:'';
		$ancla           = (isset($data_extra['ancla']) && $data_extra['ancla'] == true)?true:false;
		
		// $title_seccion   = isset($data['title_seccion']) ?$data['title_seccion']   :'';
		// $detalle_seccion = isset($data['detalle_seccion'])?$data['detalle_seccion']:'';

		$size = count($data);
		$html = '';
		if(is_array($data) && $size) {
			$open =	"<div class='row'>
					<div class='container padding-top-bottom ".$class_seccion."'>
					<ul id'da-thumbs' class='da-thumbs'>";

			foreach ($data as $key => $thumbs) {
				$href    = ($ancla)?"#servicios-".$key:base_url()."servicios/".$lang;
				$img_url = isset($thumbs['portada'])?$thumbs['portada']:'http://www.arbibe.com.mx/media/Imagenes/Portadas/Servicios/imagen-proyectos-arbibe.jpg';
				$html .= "<li class='col-md-6 col-sm-6 col-xs-12 item'>
							 <a href='".$href."' class='selecciona-servicio'>
							 	<img src='".base_url().$img_url."' class='img-responsive' alt='".$thumbs['titulo']."' title='".$thumbs['titulo']."' >
							 	<div class='over text-center'>
							 		<span class='flaticon flaticon-people'></span>
							 	</div>
							 </a>
							 <div class='desc'>
							 	<p class='text-center'><strong>".$thumbs['titulo']."</strong></p>
							 	".$thumbs['descripcion']."
							 </div>
						 </li>";
			}
		$close = "</ul></div></div>";
		$html = $open.$html.$close;
		}

		return $html;
	}
}

if (!function_exists('detalle_servicio')) {
	function detalle_servicio($data = array()){
		$servicios = isset($data['servicio']) ?$data['servicio']:'';
		$proyectos = isset($data['proyectos'])?$data['proyectos']:'';
		$html      = '';
		if(is_array($servicios)) {
			foreach ($servicios as $key => $servicio) {

				$html .= "
				<div id='list-servicios'>
					<div id='servicios-".$key."' class='mas-detalles row bgcolor-verdegris padding-top-bottom hideContent'>
						<div class='container'>
							<div class='col-md-12 col-xs-12 col-sm-12'><p><i class='flaticon flaticon-delete pull-right fs30px cerrar-detalles'></i></p>
							</div>
							<div class='col-md-10 col-md-offset-1 col-xs-12'>
								".$servicio['descripcion']."
							</div>
						</div>
						<div class='container-fluid sinmargen sinpadding'>
						".$proyectos[$servicio['id_servicio']]."
				 		</div>
					</div>
					
				</div>
				 
				";

			}
			
		}
		return $html;
		
		
	}
}
if (!function_exists('noticias_in_blog')) {
	function noticias_in_blog($data){
		
		$html = "";
		if(is_array($data)) {
			foreach ($data as $key => $noticia) {
				$html .= "
  					<div class='row single-new'>
					<img src='".base_url().$noticia['imagen_noticia']."' class='img-responsive' alt='Arbibe' title='Arbibe'>	
					<a href='' class='text-center'><h2 class='subtitle'>".$noticia['titulo']."</h2></a>
	        		<p class='fecha-publicacion text-center'><i class='flaticon flaticon-clock'></i>".$noticia['timestamp']."</p>
	        		<div class='new-review text-justify'> 
	         		".$noticia['descripcion']."
	        		</div>
	        		<p class='text-center'>
	        		<a href='/blog/{{noticia.slug}}' class='btn btn-default btn-leer-mas'>".lang('leer_mas')."</a>
	        		</p>
	        		</div>";	
			}
			
		}
		return $html;
		
	}
}
if (!function_exists('lista_noticia')) {
	function lista_noticia($data){		
		$html = "";
		if(is_array($data)) {
			foreach ($data as $key => $noticia) {
				$html = "<li>
	          			<a href='".$noticia['slug']."'>
	          			<img src='".base_url().$noticia['imagen_noticia']."' class='img-responsive' alt='Arbibe' title='Arbibe'>	
	          			<p>".$noticia['titulo']."</p>
	          			</a>
	          			</li>";
			}

		}
		return $html;

	}
}





// <div class='container-fluid sinmargen sinpadding'>
// 						<ul class='da-thumbs'>
// 					  		{% for slideitem in servicio.slideservicio_set.all %}
// 					  			<li class='col-md-4 col-sm-4 col-xs-12 sinpadding '>
// 									<a href='#' data-toggle='modal' data-target='#myModal{{servicio.pk}}'>
// 										<img src='/media/{{slideitem.image}}' class='img-responsive' alt='{{slideitem.title}}' title='{{slideitem.title}}' >
// 										<div class='over text-center'>
// 											<span class='flaticon flaticon-people'></span>
// 											<hr class='hr-proyecto'>
// 											<p class='fs16'><strong>{{slideitem.title}}</strong></p>
// 										</div>
// 									</a>
// 									<p class='fs16 visible-xs text-center'><strong>{{slideitem.title}}</strong></p>
// 								</li>
// 		                    {% endfor %}
// 						</ul>
// 					</div>
// 					<div class='container-fluid text-center'>
// 						<a href='{% url 'proyectos' %}' class='btn btn-default btn-leer-mas'>{% trans 'CONOCER MÁS PROYECTOS' %}</a>
// 					</div>

if (!function_exists('title_container')) {
	function title_container($data = array()){

		$titulo     = isset($data['titulo'])    ? $data['titulo']    : '';
		$texto_btn  = isset($data['texto_btn']) ? $data['texto_btn'] : 'LEER MAS';
		$class_btn  = isset($data['class_btn']) ? $data['class_btn'] : '';
		$background = isset($data['background'])? $data['background']: '';
		$color_txt  = isset($data['color_txt']) ? $data['color_txt'] : 'font-color-white';
		$url        = isset($data['url'])       ? $data['url']       : '';
		$btn_hidden = (isset($data['btn_hidden']) && $data['btn_hidden'] == true )?'hidden': '';
		$html       = '';
		if($data) {
			$html = "
				<div class='row $background subtitle-container'>
				<div class='container $color_txt'>
				<div class='col-md-4 col-sm-4 col-xs-6 sub'>
				<h3 class='".$color_txt."'>".$titulo."</h3>
				</div>
				<div class='col_md-2 col-sm-2 pull-right text-right sub'>
				<a href='".$url."' class=' ".$btn_hidden." btn btn-default ".$class_btn."'>$texto_btn</a>
				</div>
				</div>
				</div>";
		}
		return $html;

	}
}


if (!function_exists('jumbotron_container')) {
	function jumbotron_container($data = array()){

		$title_pricipal  = isset($data['title_pricipal'])?  $data['title_pricipal'] :'';
		$title_secondary = isset($data['title_secondary'])? $data['title_secondary']:'';
		$detalle         = isset($data['detalle'])        ? $data['detalle']        :'';

		$html =	"<div class='row hometext'>
				 <div class='container padding-top-bottom'>
				 <div class='col-md-10 col-sm-10 col-xs-12 col-md-offset-1 col-sm-offset-1'>
					<h1 class='title text-center'>".$title_pricipal."</h1>
					<h2 class='text-center font-damion subtitle'><span>'".$title_secondary."'</span></h2>
					<br>		
					".$detalle."	
				 </div>
				 </div>
				 </div>";
		return $html;
	}
}


if (!function_exists('seccion_clientes')) {
	function seccion_clientes($data = array()){
		$html = '';
		$data['clientes'] = isset($data['clientes'])?$data['clientes']:'';
		$data['class']    = isset($data['class'])   ?$data['class']   :'';
		$rowsCliente      = count($data['clientes']);
		$html_header      = "<div class='row'>
							<div class='container inicio-servicios'>
							";
		if(is_array($data['clientes']) && $rowsCliente>0){
			$html_body = '';
			foreach ($data['clientes'] as $key => $clientes) {
				$ruta_img = isset($clientes['ruta_img'])?$clientes['ruta_img']:'http://www.arbibe.com.mx/static/images/2-Acerca-de/nuestros-clientes-0.jpg';
				$html_body .="<div class='col-md-2 col-sm-3 col-xs-4 logo-clientes'>
							  <img src='".base_url().$ruta_img."' alt='".$clientes['cliente']."' title='".$clientes['cliente']."' class='img-responsive'></div>";	
			}
			$html_footer = "</div></div>";
			$html = $html_header.$html_body.$html_footer;
		}
		return $html;
	}
}

/* End of file aplication_helper.php */
/* Location: ./application/helpers/aplication_helper.php */