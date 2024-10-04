<?php
session_start(); // Start the session to retrieve error and form data

// Retrieve form data and error message from the session
$error_message = isset($_SESSION['error_message']) ? $_SESSION['error_message'] : '';
$corrected_messages = isset($_SESSION['corrected_messages']) ? $_SESSION['corrected_messages'] : '';
$form_data = isset($_SESSION['form_data']) ? $_SESSION['form_data'] : array();
$success_message = isset($_SESSION['success_message']) ? $_SESSION['success_message'] : '';

// Clear session data after displaying it
unset($_SESSION['error_message']);
unset($_SESSION['corrected_messages']);
unset($_SESSION['form_data']);
unset($_SESSION['success_message']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Authentication</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="CSS.css">
</head>
<body>
<nav id="main-nav">
        <ul>
            <li><a href="Kukkakauppa.html">Etusivu</a></li>
            <li><a href="#">Tuotteet</a></li>
            <li><a href="#">Myymälät</a></li>
            <li><a href="#">Tietoa Meistä</a></li>
            <li><a href="#">Ota Yhteyttä</a></li>
        </ul>
        <div class="menu-icon" onclick="toggleMenu()">
            <div class="bar1"></div>
            <div class="bar2"></div>
        </div>        
    </div>
    <div class="main">
        <div class="container">
            <form action="register_new_user.php" method="post" novalidate>
                <h1>Rekisteröityminen</h1>

                <!-- Display success message if registration is successful -->
                <?php if (!empty($success_message)): ?>
                    <div style="color: green;"><?php echo htmlspecialchars($success_message); ?></div>
                <?php endif; ?>
                <div class="frame">
                    <input type="text" id="username" name="username" placeholder="Käyttäjänimi" value="<?php echo htmlspecialchars($form_data['username'] ?? ''); ?>">
                    <input type="email" id="email" name="email" placeholder="Sähköposti" value="<?php echo htmlspecialchars($form_data['email'] ?? ''); ?>">
                    <div class="sala">
                        <input type="password" id="password" name="password" placeholder="Salasana">
                        <input type="password" id="confirm_password" name="confirm_password" placeholder="Salasana uudelleen">
                    </div>
                    <div class="messages">
                        <?php if (!empty($error_message)): ?>
                            <div class="error2">
                                <?php echo $error_message;?>
                            </div>
                        <?php endif; ?>
                        <?php if (!empty($corrected_messages)): ?>
                            <div class="corrected2">
                                <?php echo $corrected_messages; ?></div>
                        <?php endif; ?>
                    </div>
                        <button class="submit" type="submit">Rekisteröidy</button>
                        <button class="google">Jatka google-tililläsi</button>
                </div>
            </form>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-inner">
            <!-- Footer content here -->
        </div>
    </footer>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var errorMessage = "<?php echo $error_message; ?>";
            var correctedMessages = "<?php echo $corrected_messages; ?>";
            var con2 = document.getElementById("con2");

            if (errorMessage || correctedMessages) {
                con2.classList.add("active");
            }
        });
    </script>
</body>
</html>