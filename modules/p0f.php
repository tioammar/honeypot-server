<?php

class p0f {

	// Memasukkan data ke database utama

	function p0f_fingerprint($data, $mysqli) {
		
		foreach($data as $data1) {
			$T = "'" . $data1[0] . "','" . $data1[1] . "'";
			$Q = "INSERT IGNORE INTO p0f_fingerprint VALUES (" . $T . ")";
			if ($data1[1] != "null") {
				$mysqli->query($Q);
			}

		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();			
			echo json_encode(array("status"=>"gagal"));
			die();
		}
	}	
}

?>