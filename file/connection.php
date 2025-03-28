<?php
$servername = "13.60.187.172";
$username = "bloodbank_user";
$password = "bloodbank_password";
$dbname = "bloodbank";
$conn = new mysqli($servername, $username, $password, $dbname);
if(!$conn){
 die('Could not Connect MySql:' .mysql_error());
}
?>