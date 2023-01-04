<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
 $database = "charity_hope_db";

$connection = new mysqli($servername, $username, $password,$database);
    

if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}

            $connection->set_charset("utf8");
            
            
            



	 	$id = $_POST['id'];
		$name = $_POST["name"];
		$event_date = $_POST["event_date"];
		$event_time = $_POST["event_time"];
		$description = $_POST["description"];




     $name=mysqli_real_escape_string($connection,$name);
	  $event_date=mysqli_real_escape_string($connection,$event_date);
	   $event_time=mysqli_real_escape_string($connection,$event_time);
	     $description=mysqli_real_escape_string($connection,$description);


  
     
     	


	$connection->query("UPDATE  event SET name='".$name."',event_date='".$event_date."',
	event_time='".$event_time."',description='".$description."' WHERE id=".$id);




	



    	
	$result = array();
	$result['msg'] = "Successfully Edited..";
	echo json_encode($result);

?>



