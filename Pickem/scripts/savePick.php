<?php
header('Content-type: application/json');


if(isset($_POST["pick"])) {
	$pick = $_POST["pick"];
}

$con = mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query =  "update picks set pick = '" . $pick . "' where user = 'Teepokun'";

$result = mysqli_query($con, $query); 

print(json_encode($result));

mysqli_close($con);
?> 