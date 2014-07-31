<?php

require_once 'config.php';

if(isset($_POST['data']) && isset($_POST['medium'])) {
	
	if(is_array($_POST['data'] ) || is_array($_POST['medium'])) {
		oops();
	}
	
	// Decode!!
	$data = json_decode(base64_decode($_POST['data']));
	
	if($data) {
		
		// Memecah medium untuk mengetahui jenis Honeypot
		$medium = explode("_", $_POST['medium']);
		
		if(count($medium) < 2) { 
			oops(); 
		}

		// Memanggil class yang sesuai dengan medium/nama Honeypot
		if (file_exists('modules/' . basename($medium[0]) . '.php')) {
			require_once 'modules/' . basename($medium[0]) . '.php';
			
			// OOP!
			$object = new $medium[0]();
		
			// Memanggil fungsi dari class yang telah disesuaikan
			if( method_exists($object, implode("_", $medium))) {
				call_user_func(array($object, implode("_", $medium)), $data, $mysqli);				
				echo json_encode(array("status"=>"sukses"));
			} else {
				oops("Honeypot Belum Didukung");
			}
		} else {
			oops("Jenis Honeypot Tidak Dikenali");
		}
	} else {
		oops("JSON Kosong!");
	}
} else {
	oops("Input Kosong!");
}

function oops($pesan) {
	echo json_encode(array("status"=>"gagal", "message"=>$pesan));
	die();
}

?>