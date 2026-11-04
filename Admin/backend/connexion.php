<?php
//définir vos paramètres serveur de connexion avec la base de donnéesz
$host="mysql-csupercar.alwaysdata.net";
// nom utilisateur
$login="csupercar";
// mot de passe
$pass="AtaokoMilaminaIto23.";
// nom de la base de données
$dbname="csupercar_supercardb";



// établir la connexion avec la base de données
$bdd = mysqli_connect($host, $login, $pass, $dbname);
// vérification de la connexion avec la BD
if (!$bdd){
			echo "Connexion non-reussie à MySQL: " . mysqli_connect_error();
	} 
	else{
			echo "";
	}


 
// changer le jeu de caractères à utf8
mysqli_set_charset($bdd, "utf8mb4");
?>
