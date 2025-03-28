<?php
$servername = "16.171.151.38";
$username = "bloodbank_user";
$password = "bloodbank_password";
$dbname = "bloodbank";
$conn = new mysqli($servername, $username, $password, $dbname);
if(!$conn){
 die('Could not Connect MySql:' .mysql_error());
}
?>