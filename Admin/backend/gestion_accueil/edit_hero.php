<?php
session_start();
include 'FonctionContenu.php';

if (isset($_POST['id_contenu'])) {
    $id    = $_POST['id_contenu'];
    $ligne = $_POST['lignecontenu'];
    $titre = $_POST['titre'];
    $texte = $_POST['texte'];
    
    // Garde l'ancienne image par défaut
    $data = get_contenu_by_id($id);
    $image = $data['image'];

    // Si une nouvelle image est envoyée
    if (!empty($_FILES['image']['name']) && $_FILES['image']['error'] === 0) {
        $target_dir = __DIR__ . "/../../../SiteWeb/assets/images/background/";
        if (!is_dir($target_dir)) {
            mkdir($target_dir, 0777, true);
        }
        $new_image = time() . "_" . basename($_FILES['image']['name']);
        if (move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $new_image)) {
            $image = $new_image;
        } else {
            $_SESSION['msg'] = "Erreur : Impossible d'enregistrer l'image. Vérifiez les permissions du dossier sur le serveur.";
            header("Location: ../../section_hero.php");
            exit();
        }
    }

    // Mise à jour en base de données
    if (modifier_contenu($id, $ligne, $titre, $texte, $image)) {
        $_SESSION['msg'] = "Mise à jour réussie.";
    } else {
        $_SESSION['msg'] = "Erreur lors de la modification.";
    }
}

header("Location: ../../section_hero.php");
exit();
?>
