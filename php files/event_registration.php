<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

          if( !empty($_POST["name"])and !empty($_POST["event_date"])
			  and !empty($_POST["event_time"])and !empty($_POST["description"])and !empty($_POST["uid"]))
{

      $name = $_POST["name"];
    $event_date= $_POST["event_date"];
    $event_time= $_POST["event_time"];
    $description = $_POST["description"];
	 $uid = $_POST["uid"];
    
    
               
      
      $name=mysqli_real_escape_string($connection,$name);
     $event_date=mysqli_real_escape_string($connection,$event_date);
      $event_time=mysqli_real_escape_string($connection,$event_time);
       $description=mysqli_real_escape_string($connection,$description);
	    $uid=mysqli_real_escape_string($connection,$uid);
	   
	   
	   $findexist="select * from event where name = '".$name."' AND event_date = '".$event_date."'AND event_time = '".$event_time."'";


        $resultsearch=mysqli_query($connection,$findexist);
        
  
    if(mysqli_num_rows($resultsearch)>0)
    {
          while($row=mysqli_fetch_array($resultsearch))
          {
              // $result["success"] = "3";
              // $result["message"] = "user Already exist";
			    $result["error"] = true;
              $result["message"] = "$name already registered on $event_date at $event_time ";

              echo json_encode($result);
              //mysqli_close($connection);
          }}
  
else{

      

 
 



    $sql = "INSERT INTO   event (name,event_date,event_time,description,uid) VALUES ('".$name."','".$event_date."','".$event_time."',
	'".$description."','".$uid."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "Event Registered successfully";
	}
	// else{
		// $result["error"] = true;
        // $result["message"] = "Registration not success";
	// }

        echo json_encode($result);
        mysqli_close($connection);

    

}
}

?>