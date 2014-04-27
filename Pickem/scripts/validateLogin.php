<?php
$name=$_POST["name"];
$password=$_POST["password"];

$con=mysqli_connect("127.0.0.1","root","T@R63dis","pickem");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query = "Select * from UserAccount where name = '" . $name . "'";

$result = mysqli_query($con, $query);

$row = mysqli_fetch_array($result);

if(! ($row['Name'] == $name && $row['Password'] == $password)) 
{ 
	print("Invalid");
}
else {
	print("Valid");
}


mysqli_close($con);

?>