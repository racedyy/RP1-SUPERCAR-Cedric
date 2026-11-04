<?php

    /* Toutes les prestations, dans l'ordre de création */
    function get_all_service($conn) {

        $sql = "SELECT id_service, nom_service, titre_service, description_service, prix_service, image_service
                FROM service
                ORDER BY id_service ASC";

        $result = mysqli_query($conn, $sql);

        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    /* "1 prestation" / "8 prestations" */
    function libelle_prestations($n) {
        $n = (int) $n;
        return $n . ' prestation' . ($n > 1 ? 's' : '');
    }

    /* fonction pour formater le prix (déjà définie dans d'autres fichiers de fonctions) */
    if (!function_exists('formatPrix')) {
        function formatPrix($prix)
        {
            return number_format($prix, 0, ',', ' ') . ' RS';
        }
    }
