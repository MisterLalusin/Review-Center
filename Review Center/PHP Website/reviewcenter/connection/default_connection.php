<?php
	date_default_timezone_set('Asia/Manila');
	$connection = mysqli_connect('localhost', 'local_mamp', '12345678');
	if (!$connection){
		die("Database Connection Failed" . mysqli_error($connection));
	}
	$select_db = mysqli_select_db($connection, 'dbreviewcenter');
	if (!$select_db){
		die("Database Selection Failed" . mysqli_error($connection));
	}
?>