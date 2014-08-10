<?php

class kippo {

	// Memasukkan data ke database utama

	function kippo_auth($data, $mysqli) {
		
		foreach($data as $data1) {
			$T = "'" . $data1[0] . "','" . $data1[1] . "','" . $data1[2] . "',unhex('" . $data1[3] . "'),unhex('" . $data1[4] . "'),'" . $data1[5] . "'";
			$Q = "INSERT IGNORE INTO kippo_auth VALUES (" . $T . ")";
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();			
			echo json_encode(array("status"=>"gagal"));
			die();
		}
	}
	
	function kippo_clients($data, $mysqli) {
		
		foreach($data as $data1) {
			$T = "'" . $data1[0] . "','" . $data1[1] . "'";
			$Q = "INSERT IGNORE INTO kippo_clients VALUES (" . $T . ")";
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();			
			echo json_encode(array("status"=>"gagal"));
			die();
		}
	}
	
	function kippo_downloads($data, $mysqli) {
		
		foreach($data as $data1) {
			$T = "'" . $data1[0] . "','" . $data1[1] . "','" . $data1[2] . "','" . $data1[3] . "','" . $data1[4] . "'";
			$Q = "INSERT IGNORE INTO kippo_downloads VALUES (" . $T . ")";
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();			
			echo json_encode(array("status"=>"gagal"));
			die();
		}
	}
	
	function kippo_input($data, $mysqli) {
		
		foreach($data as $data1) {
			$T = "'" . $data1[0] . "','" . $data1[1] . "','" . $data1[2] . "','" . $data1[3] . "','" . $data1[4] . "','" . $data1[5] . "'";
			$Q = "INSERT IGNORE INTO kippo_input VALUES (" . $T . ")";
			$mysqli->query($Q);
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();			
			echo json_encode(array("status"=>"gagal"));
			die();
		}
	}
	
	function kippo_sessions($data, $mysqli) {
		
		foreach($data as $data1) {
			$port = 2222;
			$T = "'" . $data1[0] . "','" . $data1[1] . "','" . $data1[2] . "','" . $data1[4] . "','" . $data1[5] . "','" . $data1[6] . "','" . $port . "'";
			$Q = "INSERT IGNORE INTO kippo_sessions VALUES (" . $T . ")";
			$mysqli->query($Q);
			$record = geoip_record_by_name($data1[4]);
			if ($record) {
				$T1 = "'" . $data1[4] . "','" . $record['country_code3'] . "',lower('" . $record['country_code'] . "'),'" . $record['country_name'] . "','" . $record['city'] . "','" . $record['region'] . "'";
				$Q1 = "INSERT IGNORE INTO geoip VALUES (" . $T1 . ")";
				$mysqli->query($Q1);
			}
		}
		
		if (!$mysqli->commit()) {
			$mysqli->rollback();			
			echo json_encode(array("status"=>"gagal"));
			die();
		}
	}
	
	function kippo_ttylog($data, $mysqli) {
		
		foreach($data as $data1) {
			$T = "'" . $data1[0] . "','" . $data1[1] . "',unhex('" . $data1[2] . "')";
			$Q = "INSERT IGNORE INTO kippo_ttylog VALUES (" . $T . ")";
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