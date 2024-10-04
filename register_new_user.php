<?php
session_start(); // Start the session to store error and form data

// Initialize variables
$error_message = "";
$corrected_messages = "";
$isValid = true;
$username = "";
$email = "";

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include 'connect.php';

    // Fetching form data
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $confirm_password = $_POST["confirm_password"];

    // Check if username already exists
    $sql = "SELECT * FROM users WHERE username=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $num = $result->num_rows;

    // Check if email already exists
    $sql = "SELECT * FROM users WHERE email=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $num2 = $result->num_rows;

    if ($num == 0 && $num2 == 0) {
        // Validate email format
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $error_message .= "<div class='error'><svg class='error-icon'><use xlink:href='#error-icon'></use></svg>Täytä kelvollinen sähköposti.</div><br>";
            $isValid = false;
        } else {
            $corrected_messages .= "<div class='corrected'><svg class='corrected-icon'><use xlink:href='#corrected-icon'></use></svg>Täytä kelvollinen sähköposti.</div><br>";
        }
        // Validate password
        if (!preg_match('/[0-9]/', $password)) {
            $error_message .= "<div class='error'><svg class='error-icon'><use xlink:href='#error-icon'></use></svg>Salasanan täytyy sisältää vähintään yksi numero.</div><br>";
            $isValid = false;
        } else {
            $corrected_messages .= "<div class='corrected'><svg class='corrected-icon'><use xlink:href='#corrected-icon'></use></svg>Salasanan täytyy sisältää vähintään yksi numero.</div><br>";
        }
        if (strlen($password) < 8) {
            $error_message .= "<div class='error'><svg class='error-icon'><use xlink:href='#error-icon'></use></svg>Salasanassa täytyy olla vähintään kahdeksan merkkiä.</div><br>";
            $isValid = false;
        } else {
            $corrected_messages .= "<div class='corrected'><svg class='corrected-icon'><use xlink:href='#corrected-icon'></use></svg>Salasanassa täytyy olla vähintään kahdeksan merkkiä.</div><br>";
        }
        if ($password != $confirm_password || empty($confirm_password)) {
            $error_message .= "<div class='error'><svg class='error-icon'><use xlink:href='#error-icon'></use></svg>Salasanat eivät täsmää.</div><br>";
            $isValid = false;
        } else {
            $corrected_messages .= "<div class='corrected'><svg class='corrected-icon'><use xlink:href='#corrected-icon'></use></svg>Salasanat eivät täsmää.</div><br>";
        }
        if ($isValid) {
            // Hash the password
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $verification_code = bin2hex(random_bytes(16)); // Generate a verification code
            $sql = "INSERT INTO users (username, email, password, verification_code, created_at) VALUES (?, ?, ?, ?, current_timestamp())";
            
            // Prepare and bind
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssss", $username, $email, $hash, $verification_code);
            
            if ($stmt->execute()) {
                // Send verification email
                $verification_link = "http://yourdomain.com/verify_email.php?code=$verification_code";
                $subject = "Email Verification";
                $message = "Please click the following link to verify your email: $verification_link";
                $headers = "From: no-reply@yourdomain.com";
                mail($email, $subject, $message, $headers);

                // Registration successful
                $_SESSION['success_message'] = "Rekisteröityminen onnistui! Tarkista sähköpostisi vahvistaaksesi tilisi.";
                header("Location: registration_page.php?status=success");
                exit();
            } else {
                // Handle database insertion error
                $_SESSION['error_message'] = "Rekisteröitymis virhe: " . $stmt->error;
                $_SESSION['form_data'] = $_POST; // Save the form data
                header("Location: registration_page.php");
                exit();
            }
            
            // Close the statement
            $stmt->close();
        } else {
            // Passwords do not match
            $_SESSION['error_message'] = $error_message;
            $_SESSION['corrected_messages'] = $corrected_messages;
            $_SESSION['form_data'] = $_POST; // Save the form data
            header("Location: registration_page.php");
            exit();
        }
    } else {
        if ($num != 0){
            $error_message .= "<div class='error'><svg class='error-icon'><use xlink:href='#error-icon'></use></svg>Käyttäjänimi ei ole saatavilla!</div><br>";
        }
        if ($num2 != 0){
            $error_message .= "<div class='error'><svg class='error-icon'><use xlink:href='#error-icon'></use></svg>Sähköposti on jo käytössä!</div><br>";
        }
        // Username already exists
        $_SESSION['error_message'] = $error_message;
        header("Location: registration_page.php");
        exit();
    }

    // Close the connection
    $conn->close();
}
?>