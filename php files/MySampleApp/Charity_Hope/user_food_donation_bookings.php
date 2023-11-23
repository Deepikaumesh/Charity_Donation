<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

          if( !empty($_POST["date"])and !empty($_POST["donor"])
			  and !empty($_POST["food"]) and !empty($_POST["uid"]))
{

      $date = $_POST["date"];
    $donor= $_POST["donor"];
    $food= $_POST["food"];
	 $uid= $_POST["uid"];

    
               
      
      $date=mysqli_real_escape_string($connection,$date);
     $donor=mysqli_real_escape_string($connection,$donor);
      $food=mysqli_real_escape_string($connection,$food);
	  $uid=mysqli_real_escape_string($connection,$uid);
	 
	   
	    $findexist="select * from  food_donation where date = '".$date."' AND food = '".$food."'";


        $resultsearch=mysqli_query($connection,$findexist);
        
  
    if(mysqli_num_rows($resultsearch)>0)
    {
          while($row=mysqli_fetch_array($resultsearch))
          {
            
			    $result["error"] = true;
              $result["message"] = "$food is already booked on $date";

              echo json_encode($result);
              //mysqli_close($connection);
          }}
  
else{

      

 
 



    $sql = "INSERT INTO   food_donation (date,donor,food,uid) VALUES ('".$date."','".$donor."','".$food."','".$uid."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "food donation Registered successfully";
	}
	// else{
		// $result["error"] = true;
        // $result["message"] = "Registration not success";
	// }

        echo json_encode($result);
        mysqli_close($connection);

    

}
}
	   
	   
	 
 
 



    // $sql = "INSERT INTO   donation (name,place,phone,amount,bank,account) 
	// VALUES ('".$name."','".$place."','".$phone."','".$amount."','".$bank."','".$account."')";


    // if ( mysqli_query($connection, $sql) ) {
        // $result["error"] = false;
        // $result["message"] = "Money donated successfully";
	// }
	else{
		$result["error"] = true;
        $result["message"] = "donation not success";
	}

        // echo json_encode($result);
        // mysqli_close($connection);

    


// }

?>