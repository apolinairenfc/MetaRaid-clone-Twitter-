<?php
include "../Config/dbconnect.php";
require_once '../Controllers/LoginController.php';


if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['logout'])) {
    $controller = new LoginController();
    $controller->logout();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
        };
    </script>
    <title>Connexion</title>
</head>
<body class="dark:bg-black dark:text-white">
    <button id="theme-toggle" class="fixed top-5 right-5 p-2 bg-gray-800 text-white rounded-full">
    🌙
    </button>   
    <div class="flex flex-col lg:flex-row items-center justify-center min-h-screen p-6 bg-white dark:bg-black">

    <div class="mb-8 lg:mb-0 lg:mr-10 flex justify-center">
        <img src="../Assets/logo/metaraid.png" alt="logo" class="w-40 md:w-56 lg:w-64 object-contain">
    </div>
      
    <!-- Formulaire -->
    <div class="w-full max-w-md p-6 md:p-10 border rounded-xl shadow-xl shadow-blue-400 bg-white dark:bg-black transition-all duration-700">
        <form action="../Controllers/LoginController.php" method="POST" class="space-y-6">
            <!-- Email -->

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-user text-gray-500 dark:text-white mr-2"></i>
                <input type="email" name="email" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Adresse mail" required>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-lock text-gray-500 dark:text-white mr-2"></i>
                <input type="password" name="password" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Mot de passe" required>
            </div>
          
            <button type="submit" class="w-full border-2 border-blue-300 rounded-md p-2 bg-blue-400 hover:bg-gray-800 transition text-white text-sm md:text-base">
                Se connecter
            </button>
        </form>

        <div class="mt-6 text-center">
            <p class="text-sm text-black dark:text-white mb-2">Pas encore de compte ?</p>
            <a href="RegisterView.php" class="inline-block border-2 border-blue-300 rounded-md p-2 bg-blue-400 hover:bg-gray-800 transition text-white text-sm md:text-base">
                S'inscrire
            </a>
        </div>
    </div>
</div>

    <script src="../Assets/SwitchTheme.js"></script>
    </body>
</html>
