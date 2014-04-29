<?php
header('Content-type: application/json');
$email = $_POST['email'];
$user = $_POST['user'];

$con=mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query = "Select count(*) as result from useraccount where Email = '" . $email . "'";
$result = mysqli_query($con, $query); 
$row = mysqli_fetch_array($result);
$count1 = $row['result'];

$query = "Select count(*) as result from useraccount where Name = '" . $user . "'";
$result = mysqli_query($con, $query); 
$row = mysqli_fetch_array($result);
$count2 = $row['result'];

$json = array('email' => $count1, 'user' => $count2);
print(json_encode($json));

mysqli_close($con);
?>