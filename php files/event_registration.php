<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

          if( !empty($_POST["name"])and !empty($_POST["event_date"])
			  and !empty($_POST["event_time"])and !empty($_POST["description"]))
{

      $name = $_POST["name"];
    $event_date= $_POST["event_date"];
    $event_time= $_POST["event_time"];
    $description = $_POST["description"];
    
               
      
      $name=mysqli_real_escape_string($connection,$name);
     $event_date=mysqli_real_escape_string($connection,$event_date);
      $event_time=mysqli_real_escape_string($connection,$event_time);
       $description=mysqli_real_escape_string($connection,$description);

      

 
 



    $sql = "INSERT INTO   event (name,event_date,event_time,description) VALUES ('".$name."','".$event_date."','".$event_time."','".$description."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "Event Registered successfully";
	}
	else{
		$result["error"] = true;
        $result["message"] = "Registration not success";
	}

        echo json_encode($result);
        mysqli_close($connection);

    

	}

?>