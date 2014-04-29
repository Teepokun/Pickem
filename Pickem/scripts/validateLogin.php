<?php
$name=$_POST["name"];
$password=$_POST["password"];


$con=mysqli_connect("127.0.0.1","dlindem3","T@R63dis","dlindem3");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$query = "Select * from useraccount where Email = '" . $name . "'";
print($name . "<br>");
$result = mysqli_query($con, $query);

$row = mysqli_fetch_array($result);

if(! ($row['Email'] == $name && $row['Password'] == $password)) 
{ 
	print("Invalid");
}
else {
	print("Valid");
}


mysqli_close($con);

?>