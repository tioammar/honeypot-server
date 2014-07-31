<?php

class dionaea {

	// Memasukkan data ke database utama

	function dionaea_connections($data, $mysqli) {
		
		foreach($data as $data1) {
			$T = "'" . $data1[0] . "',INET_ATON('" . $_SERVER['REMOTE_ADDR'] . "'),'" . $data1[1] . "','" . $data1[2] . "','" . $data1[3] . "',FROM_UNIXTIME('" . $data1[4] . "'),'" . $data1[5] . "','" . $data1[6] . "','" . $data1[7] . "','" . $data1[8] . "','" . $data1[9] . "','" . $data1[10] . "','" . $data1[11] . "'";
			$Q = "INSERT IGNORE INTO dionaea_connections VALUES (" . $T . ")";
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();			
			echo json_encode(array("status"=>"gagal"));
			die();
		}
	}

	function dionaea_downloads($data, $mysqli) {
		
		foreach($data as $data1) {
			$T = "'" . $data1[0] . "','" . $data1[1] . "','" . $data1[2] . "','" . $data1[3] . "'";
			$Q = "INSERT IGNORE INTO dionaea_downloads VALUES (" . $T . ")";
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();			
			echo json_encode(array("status"=>"gagal"));
			die();
		}
	}	
}

?>