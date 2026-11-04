-- Insertion des marques
INSERT INTO marques (nom_marque)
VALUES ('Mercedes'),
    ('Audi'),
    ('Porsche');
INSERT INTO service (
        nom_service,
        titre_service,
        description_service,
        image_service
    )
VALUES (
        'Entretien',
        'Révision complète',
        'Vérification générale du véhicule',
        'entretien.jpg'
    ),
    (
        'Nettoyage',
        'Nettoyage premium',
        'Nettoyage intérieur et extérieur',
        'nettoyage.jpg'
    ),
    (
        'Garantie',
        'Extension de garantie',
        'Extension de garantie 2 ans',
        'garantie.jpg'
    );
-- Insertion du contenu pour la Section Hero (Ligne 1)
INSERT INTO contenu (lignecontenu, titre, texte, page)
VALUES (
        1,
        'Votre partenaire de confiance<br>pour les voitures d''occasion<br>depuis 2009',
        'Importation mondiale, essai à notre siège social et livraison directe depuis nos entrepôts : trouvez le véhicule qu''il vous faut, en toute confiance.',
        'accueil'
    );
-- Insertion du contenu pour la Section À propos
INSERT INTO contenu (lignecontenu, titre, texte, page)
VALUES (
        1,
        'À propos de SuperCar',
        'Depuis 2009, SuperCar est votre partenaire de confiance dans l\'acquisition de voitures d\'occasionss. Nous importons des véhicules de qualité supérieure en provenance des plus grands marchés automobiles mondiaux.',
        'apropos'
    ),
    (
        2,
        'Importation mondiale',
        'Véhicules d\'occasionss en provenance du Japon, Singapour, Afrique du Sud, États-Unis, Chine, Allemagne et France',
        'apropos'
    ),
    (
        3,
        '4 Entrepôts',
        'Nos 4 entrepôts stratégiquement placés nous permettent de stocker un large inventaire et d\'assurer des livraisons rapides.',
        'apropos'
    ),
    (
        4,
        'Siège Social',
        'Essayez tous nos modèles dans notre showroom principal',
        'apropos'
    );
-- Insertion du contenu pour la Section Processus
INSERT INTO contenu (lignecontenu, titre, texte, page)
VALUES (
        1,
        'Découverte',
        'Explorez notre catalogue et sélectionnez le modèle qui vous intéresse parmi notre large sélection de véhicules d''occasions importés.',
        'processus'
    ),
    (
        2,
        'Essai au Siège Social',
        'Testez une voiture d''essai de chaque modèle dans notre showroom. Nos conseillers vous accompagnent pour trouver le véhicule idéal.',
        'processus'
    ),
    (
        3,
        'Livraison',
        'Recevez un véhicule d''occasions identique, livré directement depuis nos entrepôts. Rapide, sécurisé et sans surprises.',
        'processus'
    );
-- Insertion d'un compte Administrateur (Mot de passe: cedric123)
INSERT INTO admin (nom, prenom, mail, mot_de_passe)
VALUES (
        'Admin',
        'Cedric',
        'cedric@supercar.com',
        '$2y$10$507uRrxzJLNDCZK5PLq7l.MZE4YeM2AtrBKGFrSRw6DEdnrbDUaS6'
    );
-- Insertion du contenu pour la Section Contact
INSERT INTO contenu (lignecontenu, titre, texte, page)
VALUES (
        1,
        '0322 565 478',
        'Lun–Ven 08h–18h',
        'contact'
    ),
    (
        2,
        'supercar@gmail.com',
        'Réponse sous 24h',
        'contact'
    ),
    (
        3,
        'MCCI Business School, Ebene, Maurice',
        'Showroom principal',
        'contact'
    ),
    (
        4,
        'Lundi – Vendredi',
        '08h00 – 18h00',
        'contact'
    ),
    (
        5,
        'Samedi',
        '09h00 – 17h00',
        'contact'
    ),
    (
        6,
        'Dimanche',
        '10h00 – 15h00',
        'contact'
    ),
    (
        7,
        'MCCI Business School — Showroom principal SUPERCAR',
        'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1198.5492211244302!2d57.48494871408381!3d-20.24355594411807!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x217c5b16955dcd29%3A0xe6719b48c3b7a89a!2sMCCI%20Business%20School!5e0!3m2!1sfr!2smu!4v1700000000000!5m2!1sfr!2smu',
        'contact'
    );
-- Insertion de 10 voitures
INSERT INTO voiture (
        idvoiture,
        modele,
        prix,
        datesortie,
        kilometrage,
        disponibilite,
        boite_de_vitesse,
        carburant,
        puissance,
        couleur,
        provenance,
        details,
        id_marque
    )
VALUES (
        1,
        'C63 S AMG',
        6500000.00,
        '2022-05-10',
        15000,
        TRUE,
        'Automatique',
        'Essence',
        510,
        'Noir Obsidienne',
        'Allemagne',
        'Berline sportive dotee d un moteur V8 biturbo puissant. Finition haut de gamme avec sieges sport en cuir et pack carbone.',
        1
    ),
    (
        2,
        'Classe A 45 S AMG',
        3800000.00,
        '2021-09-15',
        22000,
        TRUE,
        'Automatique',
        'Essence',
        421,
        'Gris Selenite',
        'Allemagne',
        'Compacte sportive de reference equipee d un moteur 4 cylindres turbo tres performant et d une transmission integrale 4MATIC.',
        1
    ),
    (
        3,
        'AMG GT Black Series',
        9200000.00,
        '2023-03-20',
        5000,
        TRUE,
        'Automatique',
        'Essence',
        730,
        'Noir Magno',
        'Allemagne',
        'Supercar exclusive avec aerodynamisme actif et moteur V8 developpant une puissance exceptionnelle pour circuit et route.',
        1
    ),
    (
        4,
        'G63 AMG',
        8900000.00,
        '2022-11-01',
        12000,
        TRUE,
        'Automatique',
        'Essence',
        585,
        'Blanc Polaire',
        'Allemagne',
        'SUV tout-terrain de luxe combinant robustesse, puissance brute et confort moderne avec echappement sport lateral.',
        1
    ),
    (
        5,
        'RS6 Avant ABT',
        8100000.00,
        '2023-01-15',
        8000,
        TRUE,
        'Automatique S-Tronic',
        'Essence',
        600,
        'Noir Mythic',
        'Allemagne',
        'Break ultra-sportif prepare par ABT combinant puissance phenomenale, polyvalence au quotidien et transmission Quattro.',
        2
    ),
    (
        6,
        'R8 V10 Performance',
        7400000.00,
        '2020-07-12',
        18000,
        TRUE,
        'Automatique S-Tronic',
        'Essence',
        620,
        'Gris Nardo',
        'Allemagne',
        'Supercar mythique a moteur V10 atmospherique offrant une sonorite unique et des accelerations fulgurantes.',
        2
    ),
    (
        7,
        'RS3 Sportback',
        3500000.00,
        '2022-04-18',
        25000,
        TRUE,
        'Automatique S-Tronic',
        'Essence',
        400,
        'Bleu Navarre',
        'Allemagne',
        'Berline compacte dynamique avec son moteur 5 cylindres turbo caracteristique et son comportement agile sur route.',
        2
    ),
    (
        8,
        '911 GT2 RS',
        11500000.00,
        '2021-10-05',
        4500,
        TRUE,
        'Automatique PDK',
        'Essence',
        700,
        'Argent GT',
        'Allemagne',
        'Bete de circuit equipee d un moteur flat six biturbo delivrant des performances radicales et un appui aerodynamique massif.',
        3
    ),
    (
        9,
        'Macan GTS',
        4750000.00,
        '2023-02-14',
        14000,
        TRUE,
        'Automatique PDK',
        'Essence',
        380,
        'Rouge Carmin',
        'Allemagne',
        'SUV compact alliant le dynamisme sportif Porsche a un confort remarquable pour les trajets quotidiens.',
        3
    ),
    (
        10,
        '911 GT3 RS',
        10800000.00,
        '2023-06-30',
        3200,
        TRUE,
        'Automatique PDK',
        'Essence',
        525,
        'Blanc et Rouge',
        'Allemagne',
        'Voiture de sport concue pour le circuit avec moteur atmospherique a haut regime et aerodynamisme de competition.',
        3
    );
-- Insertion des images des voitures
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('mercedes/c63_amg_noir/avant.jpeg', 1, 1),
    ('mercedes/c63_amg_noir/interieur.jpeg', 1, 0),
    ('mercedes/c63_amg_noir/pneu.jpeg', 1, 0),
    ('mercedes/c63_amg_noir/arriere.jpeg', 1, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('mercedes/classe_a_45/avant.jpeg', 2, 1),
    ('mercedes/classe_a_45/interieur.jpeg', 2, 0),
    ('mercedes/classe_a_45/pneu.jpeg', 2, 0),
    ('mercedes/classe_a_45/arriere.jpeg', 2, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('mercedes/c63_black_series/avant.jpeg', 3, 1),
    ('mercedes/c63_black_series/interieur.jpeg', 3, 0),
    ('mercedes/c63_black_series/pneu.jpeg', 3, 0),
    ('mercedes/c63_black_series/arriere.jpeg', 3, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('mercedes/g63_amg/avant.jpeg', 4, 1),
    ('mercedes/g63_amg/interieur.jpeg', 4, 0),
    ('mercedes/g63_amg/pneu.jpeg', 4, 0),
    ('mercedes/g63_amg/arriere.jpeg', 4, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('audi/rs6_abt/avant.jpeg', 5, 1),
    ('audi/rs6_abt/interieur.jpeg', 5, 0),
    ('audi/rs6_abt/pneu.jpeg', 5, 0),
    ('audi/rs6_abt/arriere.jpeg', 5, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('audi/r8_v10/avant.jpeg', 6, 1),
    ('audi/r8_v10/interieur.jpeg', 6, 0),
    ('audi/r8_v10/pneu.jpeg', 6, 0),
    ('audi/r8_v10/arriere.jpeg', 6, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('audi/rs3_sportback/avant.jpeg', 7, 1),
    ('audi/rs3_sportback/interieur.jpeg', 7, 0),
    ('audi/rs3_sportback/pneu.jpeg', 7, 0),
    ('audi/rs3_sportback/arriere.jpeg', 7, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('porsche/911_gt2_rs/avant.jpeg', 8, 1),
    ('porsche/911_gt2_rs/interieur.jpeg', 8, 0),
    ('porsche/911_gt2_rs/pneu.jpeg', 8, 0),
    ('porsche/911_gt2_rs/arriere.jpeg', 8, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('porsche/macan_gts/avant.jpeg', 9, 1),
    ('porsche/macan_gts/interieur.jpeg', 9, 0),
    ('porsche/macan_gts/pneu.jpeg', 9, 0),
    ('porsche/macan_gts/arriere.jpeg', 9, 0);
INSERT INTO image (url_image, idvoiture, priorite)
VALUES ('porsche/911_gt3_rs/avant.jpeg', 10, 1),
    ('porsche/911_gt3_rs/interieur.jpeg', 10, 0),
    ('porsche/911_gt3_rs/pneu.jpeg', 10, 0),
    ('porsche/911_gt3_rs/arriere.jpeg', 10, 0);