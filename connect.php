<?php 
    $db = "simplenote"; //database name
    $dbuser = "root"; //database username
    $dbpassword = ""; //database password
    $dbhost = "localhost"; //database host

    $connect = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);

    if(!$connect)
	{
		echo json_encode("Connection Failed");
	}
?>