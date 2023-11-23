<?php
$servername = 'localhost';
$username = 'root';
$password ='';
$database = "charity_hope_db";

$connection = new mysqli($servername,$username,$password,$database);

if($connection -> connect_error ) {
	die("connection failed:" . $connection->connect_error);
}
$connection->set_charset("utf8");

$id = $_POST['id'];

 
$connection -> query("DELETE From `event` WHERE id=" .$id);


$result=array("success"=>'Successfully Deleted');
echo json_encode($result);





?>