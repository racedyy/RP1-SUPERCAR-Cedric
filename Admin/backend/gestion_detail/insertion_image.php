<?php

include '../connexion.php';
include 'fonctionDetail.php';

$idvoiture = $_POST['idvoiture'];
$priorite  = $_POST['priorite'];


if (!empty($_FILES['new_image']['name']) && $_FILES['new_image']['error'] === 0) {

    $upload_dir = __DIR__ . "/../../../SiteWeb/assets/images/voiture/";

    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0777, true);
    }

    $extension = pathinfo($_FILES['new_image']['name'], PATHINFO_EXTENSION);

    $new_name = uniqid() . "." . $extension;

    if (move_uploaded_file($_FILES['new_image']['tmp_name'], $upload_dir . $new_name)) {
        insertImage($bdd, 'voiture/' . $new_name, $idvoiture, $priorite);
    }
}


header("Location: edit_voiture.php?id=" . $idvoiture);
exit;
?>