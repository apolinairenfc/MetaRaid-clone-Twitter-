
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
    <title>Page inscription</title>
</head>
<body class="bg-white text-black dark:bg-black dark:text-white">

<?php
if (isset($_SESSION['error_message'])) {
    echo "<p class='text-red-500 text-center mb-4'>" . $_SESSION['error_message'] . "</p>";
    unset($_SESSION['error_message']); 
}
?>

<button id="theme-toggle" class="fixed top-5 right-5 p-2 bg-gray-800 text-white rounded-full">
    🌙
</button>

<div class="flex flex-col lg:flex-row items-center justify-center min-h-screen p-6">

    <div class="mb-8 lg:mb-0 lg:mr-10 flex justify-center">
        <img src="../Assets/logo/metaraid.png" alt="logo" class="w-36 md:w-48 lg:w-64 object-contain">
    </div>

    <div class="w-full max-w-md p-6 md:p-10 border rounded-xl shadow-xl shadow-blue-400 bg-white dark:bg-black transition-all duration-700">
        <form id="Form_inscription" method="post" action="../Controllers/RegisterController.php" class="space-y-5">

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-user text-gray-500 dark:text-white mr-2"></i>
                <input type="text" id="firstname" name="firstname" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Prénom" required>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-user text-gray-500 dark:text-white mr-2"></i>
                <input type="text" id="lastname" name="lastname" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Nom" required>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-user-tag text-gray-500 dark:text-white mr-2"></i>
                <input type="text" id="pseudo" name="username" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Nom d'utilisateur" required>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-calendar text-gray-500 dark:text-white mr-2"></i>
                <input type="date" id="birthdate" name="birthdate" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" required>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-venus-mars text-gray-500 dark:text-white mr-2"></i>
                <select id="genre" name="genre" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" required>
                    <option value="" disabled selected>Genre</option>
                    <option value="Homme">Homme</option>
                    <option value="Femme">Femme</option>
                    <option value="Autre">Autre</option>
                </select>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-globe text-gray-500 dark:text-white mr-2"></i>
                <input type="text" id="country" name="country" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Pays" required>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-city text-gray-500 dark:text-white mr-2"></i>
                <input type="text" id="city" name="city" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Ville" required>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-envelope text-gray-500 dark:text-white mr-2"></i>
                <input type="email" id="email" name="email" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Adresse mail" required>
            </div>

            <div class="flex items-center border rounded-md p-2">
                <i class="fa-solid fa-lock text-gray-500 dark:text-white mr-2"></i>
                <input type="password" id="password" name="password" class="flex-1 outline-none bg-transparent text-black dark:text-white placeholder-gray-400" placeholder="Mot de passe" required>
            </div>

            <button type="submit" class="w-full border-2 border-blue-300 rounded-md p-2 bg-blue-400 hover:bg-gray-800 transition text-white text-sm md:text-base">
                S'inscrire
            </button>
        </form>

        <div class="mt-6 text-center">
            <p class="text-sm text-black dark:text-white mb-2">Déjà un compte ?</p>
            <a href="../Views/LoginView.php" class="inline-block border-2 border-blue-300 rounded-md p-2 bg-blue-400 hover:bg-gray-800 transition text-white text-sm md:text-base">
                Connecte-toi
            </a>
        </div>
    </div>
</div>

    <script src="../Assets/register.js"></script>
    <script src="../Assets/SwitchTheme.js"></script>
    </body>
</html>