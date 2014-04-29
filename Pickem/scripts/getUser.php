<?php
header('Content-type: application/json');
if(isset($_POST["email"])) {
	$email = $_POST["email"];
}

$con=mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query = "Select * from useraccount where Email = '" . $email . "'";

$result = mysqli_query($con, $query); 
$row = mysqli_fetch_array($result);
$json = array(	  'firstname' => $row['Firstname'],
				  'lastname' => $row['Lastname'],
				  'user' => $row['Name'],
				  'password' => $row['Password'],
				  'email' => $row['Email']);
				  


print(json_encode($json));

mysqli_close($con);
?> 