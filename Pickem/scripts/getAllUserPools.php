<?php
header('Content-type: application/json');
if(isset($_POST["user"])) {
	$user = $_POST["user"];
}

$con=mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query = "Select * from pool_users where user = '" . $user . "'";

$json = array();
$result = mysqli_query($con, $query); 
while($row = mysqli_fetch_array($result)) {
	$temp = array('name' => $row['name'],
				  'pool_id' => $row['pool_id'],
				  'user' => $row['user']);
	array_push($json, $temp);
}

print(json_encode($json));

mysqli_close($con);
?> 