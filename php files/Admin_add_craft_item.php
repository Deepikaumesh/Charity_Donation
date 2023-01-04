<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";

// // Create connection
$connection = new mysqli($servername, $username, $password,$database);
    
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}
 

   $craft_id= $_POST['craft_id'];
     $name = $_POST['name'];
	   $price = $_POST['price'];
	   $description = $_POST['description'];
	    

 $file_name1 = $_FILES['image']['name'];
 $file_tmp =$_FILES['image']['tmp_name'];
  move_uploaded_file($file_tmp,'image_uploaded/'.$file_name1);
 
 
 
 
 
 $file_name2="http://192.168.29.64/MySampleApp/Charity_Hope/image_uploaded/".$file_name1;


 $sql = "INSERT INTO `craft`( `craft_id`,`name`,`price`,`description`,`image`) VALUES 
 ( '$craft_id',' $name ','$price','$description','$file_name2')";

 if ($connection->query($sql) === TRUE)
{
  echo json_encode(array("statusCode=200","msg"=>"New record created successfully"));
} 
else 
{
  echo json_encode(array("statusCode=0","msg"=>$connection->error));
}
 
 
 
?>


