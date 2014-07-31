<?php

// MySQL
$host = 'localhost';
$user = '';
$pass = '';
$name = 'dbhoneypot';

$sensors = array(
	'127.0.0.1',
	'::1',
	);

// Stop jika request tidak datang dari sensor
$stop = true;

foreach ($sensors as $sensor) {
	if ($sensor == $_SERVER['REMOTE_ADDR']) {
		$stop = false;
	}
}

if ($stop) {
	echo json_encode(array("status"=>"gagal"));
	die();
}

// Menghubungkan ke database
$mysqli = new mysqli($host, $user, $pass, $name);

if ($mysqli->connect_error) {
	die('Connect Error ('.$mysqli->connect_errno.') '.$mysqli->connect_error);
}

$mysqli->autocommit(FALSE);

?>