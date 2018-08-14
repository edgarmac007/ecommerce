<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
/** 
 * @author Saúl Hérnández Nicasio <shernandez_developer@outlook.com>
 * @copyright 2017 5H2
 * @version 1.0.1
 */

if (!function_exists('dropdown')) {
	/**
	 * Función para construir el dropdonw HTML
	 * @param $data Array todos los datos para la construcción del dropdown
	 * @return $dropdown HTML
	 */
	function dropdown($data = array()){
		$name 		= isset($data['name']) 		? $data['name'] 	: '';
		$id 		= isset($data['id']) 		? $data['id'] 		: '';
		$class 		= isset($data['class']) 	? $data['class'] 	: '';
		$multiple 	= isset($data['multiple']) 	? 'multiple' 		: '';
		$required 	= isset($data['required']) 	? 'required' 		: '';
		$selected 	= isset($data['selected']) 	? $data['selected'] : '';
		$title 		= isset($data['title']) 	? $data['title'] 	: '';
		$options 	= isset($data['option']) 	? $data['option'] 	: array();
		$value 		= isset($data['value'])		? $data['value'] 	: FALSE;
		$text 		= isset($data['text'])		? $data['text'] 	: FALSE;
		$select_data= isset($data['select_data']) ? $data['select_data'] 	: array();
		$option_data= isset($data['option_data']) ? $data['option_data'] 	: array();
		$live_search= isset($data['live_search'])? 'true' 			: 'false';
		
		$str_select_data= '';
		$str_option 	= '<option value="" disabled selected>'.lang('general_select').'</option>';

		//Get data attribute for select
		foreach ($select_data as $key => $val) {
			$str_select_data .= " data-$key='$val'";
		}

		//Build list option
		foreach ($options as $option) {
			$str_option_data= '';
			if (count($option_data)) {
				foreach ($option_data as $index) {
					$str_option_data .= " data-$index='$option[$index]'";
				}				
			}

			$is_selected =  $option[$value] == $selected ? 'selected' : '';
			$str_option.="<option value='$option[$value]' $str_option_data $is_selected>$option[$text]</option>";
		}

		$dropdown = "<select id='$id' name='$name' class='selectpicker $class' $multiple title='$title' data-style='select-with-transition' $str_select_data data-live-search='$live_search'>";
		$dropdown .= $str_option;
		$dropdown .= "</select>";

		return $dropdown;
	}
}

if (!function_exists('Datatable')) {
	/**
	 * Función para la construcción de la tabla HTML
	 * @param $data Array datos para la construcción de la tabla HTML
	 * @return $dataTable HTML
	 */
	function Datatable($data = array()) {
		$head 		= isset($data['head']) 		? $data['head'] 		: array('');
		$foot 		= isset($data['foot']) 		? $data['foot'] 		: array('');
		$rows 		= isset($data['rows']) 		? $data['rows'] 		: array(array(lang('general_emptyTable')));
		$id 		= isset($data['id']) 		? $data['id'] 			: '';
		$class 		= isset($data['class']) 	? $data['class'] 		: '';
		$attr_data 	= isset($data['attr_data']) ? $data['attr_data'] 	: array();

		//BUILD THEAD
		$thead = "<thead><tr><th>".implode('</th><th>', $head)."</th></tr></thead>";
		$tfoot = "<thead><tr><th>".implode('</th><th>', $foot)."</th></tr></thead>";
		$tbody = "<tbody>";
		foreach ($rows as $row) {
			$str_data = '';
			foreach ($attr_data as $attr_key) {

				if (array_key_exists($attr_key, $row)) {
				    $str_data.=" data-$attr_key='$row[$attr_key]'";
				}
			}
			$tbody .= "<tr $str_data><td>".implode('</td><td>', $row)."</td></tr>";

		}
		$tbody .= "</tbody>";

		$dataTable 	= '<div class="table-responsive material-datatables">';
        $dataTable .= '<table id='.$id.' class="datatables table table-striped table-no-bordered table-hover '.$class.'">';
        $dataTable .= $thead.$tbody.$tfoot;
        $dataTable .= '</table>';
        $dataTable .= '</div>';

		return $dataTable;
	}
}

if (!function_exists('build_actions')) {
	/**
	 * Función para la construcción de los botones de acciones de la tabla
	 * @param $data Array datos para la consstrucción de los botones HTML
	 * @return $actions HTML
	 */
	function build_actions($data = array()) {
		$actions = '<div class="btn-actions">';
		foreach ($data as $btn) {
			$placement 	= 'top';
			$tooltip 	= '';
			$data 		= '';
			//TOOLTIP
			if (isset($btn['tooltip'])) {
				$placement	= isset($data['placement']) ? $data['placement'] : $placement;
				$title 		= $btn['tooltip'];
				$tooltip 	= "data-toggle='tooltip' data-placement='$placement' title='$title'";
			}

			if (isset($btn['data'])) {
				foreach($btn['data'] as $key => $value) {
					$data .= " data-$key='$value'";
				}
			}

			$actions .= "<a href='#' $data class='btn btn-simple btn-icon $btn[class]' $tooltip>";
			$actions .= $btn['icon'];
			$actions .= '</a>';
		}
		$actions .= '</div>';

		return $actions;
	}
}

if (! function_exists('input_sliders')) {
	/**
	 * Función para la construcción de los input file HTML
	 * @param $data Array datos para la construcción de la tabla HTML
	 * @return $input files HTML
	 */
	function input_sliders($data=array(), $key='') {
		$CI 		=& get_instance();
		$input_file = '';
		$BASE_URL 	= $CI->config->item('base_url');

		foreach ($data as $row) {
			$input_file .= 
			'<div class="col-md-3 col-sm-12 content-input-slider">
                <div class="card card-pricing card-raised">
                    <div class="content">
						<a class="btn btn-danger btn-round btn-fab btn-fab-mini input-file-close" 
							data-'.$key.'="'.$row[$key].'">
							<i class="material-icons">close</i>
                            <input type="hidden" name="'.$key.'[]" value="'.$row[$key].'">
						</a>
                        <div class="form-group">
                            <label for="form-group label-floating has-success">'.lang('general_titulo').'</label>
                            <input type="text" class="form-control validate required" name="slider_titulo[]" value="'.$row['titulo'].'">
                        </div>
                        <div class="fileinput fileinput-exists" data-provides="fileinput">
                            <div class="fileinput-preview thumbnail" data-trigger="fileinput" 
                                style="width: 200px; height: 150px;">
                                	<img src="'.$BASE_URL.$row['ruta_img'].'">
                                </div>
                            <div>
                                <span class="btn btn-round btn-rose btn-file btn-sm">
                                    <span class="fileinput-new">'.lang('general_select_img').'</span>
                                    <span class="fileinput-exists">'.lang('general_cambiar').'</span>
                                    <input type="file" class="validate ignore" name="img-slider[]" accept="image/*">
                                </span>
                            </div>
                        </div>'. (isset($row['descripcion']) ? 
                        '<div class="form-group">
                            <label for="control-label">'.lang('general_descripcion').'</label>
                            <textarea class="form-control validate" rows="3" name="slider_descripcion[]">
                            '.$row['descripcion'].'
                            </textarea>
                        </div>':'').'
                    </div>
                </div>
            </div>';
		}

		return $input_file;
	}
}
/* End of file aplication_helper.php */
/* Location: ./application/helpers/aplication_helper.php */