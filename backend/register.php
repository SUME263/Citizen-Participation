<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


// Database connection
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$dbname = "citizendb"; 

// connection to database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check for connection errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "connected successfully";

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize form inputs to prevent SQL injection
    $firstName = $conn->real_escape_string($_POST['firstName']);
    $lastName = $conn->real_escape_string($_POST['lastName']);
    $email = $conn->real_escape_string($_POST['email']);
    $password = $_POST['password'];
    $role = $conn->real_escape_string($_POST['role']);

    // Password hashing
    $passwordHash = password_hash($password, PASSWORD_DEFAULT); // Hash the password

    // SQL query to insert data into the Users table
    $sql = "INSERT INTO Users (firstName, lastName, email, password_hash, role)
            VALUES ('$firstName', '$lastName', '$email', '$passwordHash', '$role')";
            echo $sql;

    // Execute the query
    if ($conn->query($sql) === TRUE) {
        echo "Registration successful!";
        // Optionally, redirect to login page after successful registration
        header("Location: login.html");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$result = $conn->query("SELECT 1");
if (!$result) {
    die("Database test query failed: " . $conn->error);
}


// Close the connection
$conn->close();
?>
