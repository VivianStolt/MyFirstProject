<?php
// Database connection
$servername = "datasql7.westeurope.cloudapp.azure.com";
$username = "stoltvi";
$password = "73743";
$dbname = "supports";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>