<?php
    /*
     * Configuration des images.
     * La base ne contient que le chemin relatif (ex: mercedes/c63_amg_noir/avant.jfif).
     * Pour changer d'hébergeur d'images, il suffit de modifier IMG_BASE_URL.
     */

    // 1) Mode local (fonctionne tout de suite) : adapte le dossier si besoin
    define('IMG_BASE_URL', 'assets/images/');

    // 2) Mode Cloudinary (décommente et remplace TON_CLOUD_NAME) :
    //    -> n'oublie pas d'enlever l'extension en base : UPDATE image SET url_image = REPLACE(url_image, '.jfif', '');
    // define('IMG_BASE_URL', 'https://res.cloudinary.com/TON_CLOUD_NAME/image/upload/f_auto,q_auto,w_800/supercar/');

    // Image affichée si une voiture n'a aucune photo
    define('IMG_PLACEHOLDER', 'assets/images/placeholder.jpg');

    /* Construit l'URL complète d'une image à partir du chemin stocké en base */
    function img_url($path)
    {
        if (empty($path)) {
            return IMG_PLACEHOLDER;
        }
        if (preg_match('#^https?://#', $path)) {   // déjà une URL complète
            return $path;
        }
        return IMG_BASE_URL . ltrim($path, '/');
    }
?>
