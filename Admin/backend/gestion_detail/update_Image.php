<?php

include '../connexion.php';
include 'fonctionDetail.php';

$priority   = $_POST['priorite'];
$idvoiture  = $_POST['idvoiture'];
$id_image   = $_POST['id_image'];


$image_name = '';

if (!empty($_FILES['new_image']['name']) && $_FILES['new_image']['error'] === 0) {

    $upload_dir = __DIR__ . "/../../../SiteWeb/assets/images/voiture/";

    // créer dossier si inexistant
    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0777, true);
    }

    $extension = pathinfo(
        $_FILES['new_image']['name'],
        PATHINFO_EXTENSION
    );

    $file_only = uniqid() . '.' . $extension;

    if (move_uploaded_file($_FILES['new_image']['tmp_name'], $upload_dir . $file_only)) {
        $image_name = 'voiture/' . $file_only;
    }
}


UpdateImage(
    $bdd,
    $id_image,
    $image_name,
    $idvoiture,
    $priority
);

header("Location: edit_voiture.php?id=" . $idvoiture. "&idimage=" . $id_image);
exit;
?>