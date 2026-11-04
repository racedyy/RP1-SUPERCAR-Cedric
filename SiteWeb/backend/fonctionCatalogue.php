<?php

    /*
     * Fonction commune : récupère les voitures avec leur image principale.
     * $where  : condition SQL avec des "?" (requête préparée)
     * $types  : types des paramètres ("s" = texte, "i" = entier)
     * $params : valeurs des paramètres
     */
    function requete_voitures($conn, $where = '', $types = '', $params = []) {

        $sql = "SELECT
                    v.idvoiture,
                    v.modele,
                    v.prix,
                    v.datesortie,
                    v.kilometrage,
                    v.carburant,
                    m.nom_marque,
                    (SELECT i.url_image
                     FROM image i
                     WHERE i.idvoiture = v.idvoiture
                     ORDER BY i.priorite DESC, i.id_image ASC
                     LIMIT 1) AS url_img
                FROM voiture v
                JOIN marques m ON v.id_marque = m.id_marque
                $where";

        $stmt = mysqli_prepare($conn, $sql);

        if (!empty($params)) {
            mysqli_stmt_bind_param($stmt, $types, ...$params);
        }

        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    function get_all_voiture($conn) {
        return requete_voitures($conn);
    }

    function get_voiture_by_marque($conn, $marque) {
        return requete_voitures($conn, "WHERE v.id_marque = ?", "i", [(int)$marque]);
    }

    function get_voiture_by_indice($conn, $indice) {
        $like = '%' . $indice . '%';
        return requete_voitures(
            $conn,
            "WHERE v.modele LIKE ? OR m.nom_marque LIKE ?",
            "ss",
            [$like, $like]
        );
    }

    function get_all_marque($conn) {

        $marque_all = [];

        $query_all = mysqli_query($conn, "SELECT * FROM marques");

        while ($marque_base = mysqli_fetch_assoc($query_all)) {
            $marque_all[] = $marque_base;
        }

        return $marque_all;
    }

    function get_all_modele($conn) {

        $modeles = [];

        $query = mysqli_query($conn, "SELECT modele FROM voiture");

        while ($row = mysqli_fetch_assoc($query)) {
            $modeles[] = $row['modele']; // juste la valeur
        }

        return $modeles;
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

?>
