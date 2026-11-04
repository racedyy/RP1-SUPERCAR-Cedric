<?php

include 'connexion.php';
include_once 'config.php';   // fournit img_url() et IMG_BASE_URL

/* fonction pour récupérer tous les détails d'une voiture (avec sa marque) */
function getFullVoiture($id)
{

    global $bdd;

    $sql = "SELECT v.*, m.nom_marque 
                FROM voiture v 
                JOIN marques m ON v.id_marque = m.id_marque 
                WHERE v.idvoiture = ?";
    $stmt = mysqli_prepare($bdd, $sql);
    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    return mysqli_fetch_assoc($result);

}

/* fonction pour récupérer les chemins d'images (image principale en premier) */
function getImagesArray($id)
{

    global $bdd;

    $sql = "SELECT url_image FROM image 
            WHERE idvoiture = ? 
            ORDER BY priorite DESC, id_image ASC";
    $stmt = mysqli_prepare($bdd, $sql);
    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $images = [];

    while ($img = mysqli_fetch_assoc($result)) {
        $images[] = $img['url_image'];   // chemin brut : l'URL complète est construite avec img_url()
    }

    return $images;

}

/* fonction pour récupérer les voitures similaires avec leurs marques et images */
function getSimilairesData($id_marque, $id_actuelle)
{

    global $bdd;

    $sql = "SELECT v.*, m.nom_marque, 
                (SELECT i.url_image FROM image i 
                 WHERE i.idvoiture = v.idvoiture 
                 ORDER BY i.priorite DESC, i.id_image ASC 
                 LIMIT 1) AS main_image
                FROM voiture v 
                JOIN marques m ON v.id_marque = m.id_marque 
                WHERE v.id_marque = ? AND v.idvoiture != ? 
                LIMIT 3";
    $stmt = mysqli_prepare($bdd, $sql);
    mysqli_stmt_bind_param($stmt, "ii", $id_marque, $id_actuelle);
    mysqli_stmt_execute($stmt);

    return mysqli_stmt_get_result($stmt);

}

/* fonction pour formater le prix */
function formatPrix($prix)
{

    return number_format($prix, 0, ',', ' ') . ' RS';

}

/* fonction pour formater le kilométrage */
function formatKm($km)
{

    return number_format($km, 0, ',', ' ') . ' km';

}

/* fonction pour extraire l'année d'une date */
function formatAnnee($date)
{

    return date('Y', strtotime($date));

}

/* fonction pour formater la disponibilité */
function formatDispo($dispo)
{

    return $dispo ? 'Disponible' : 'Indisponible';

}

function getAllVoiture() {
    global $bdd;
    $sql = "SELECT idvoiture, modele FROM voiture ORDER BY modele ASC";
    return mysqli_query($bdd, $sql);
}
