----hotel---Aouadi Khraief----

------lot1-----
Lot 1.1
SELECT hot_nom, hot_ville
FROM hotel
--------------------
Lot1
.2
SELECT cli_nom, cli_prenom, cli_adresse
FROM client
WHERE cli_nom='white'
-----------------------
Lot1.3
SELECT sta_nom, sta_altitude
FROM station
where sta_altitude<1000
-----------------------
Lot1.4
SELECT cha_numero, cha_capacite
FROM chambre
WHERE cha_capacite>1
-----------------------
1.5
SELECT cli_nom, cli_ville
from client
where cli_ville!='londre'
-----------------------
Lot1.6
SELECT
    hot_nom,
    hot_ville,
    hot_categorie
FROM
    hotel
WHERE
    hot_ville = "Bretou" AND hot_categorie > 3
------------------------------------------
--///////////////////////////////////////////////////// --
---------------------------------------------------------
---LOT 2--------
Lot2.7
SELECT
    station.sta_nom,
    hotel.hot_nom,
    hotel.hot_categorie,
    hotel.hot_ville
FROM
    station
    JOIN hotel ON station.sta_id = hotel.hot_id;
----------------------------
Lot 2.8
SELECT
    chambre.cha_numero,
    hotel.hot_nom,
    hotel.hot_categorie,
    hotel.hot_ville
FROM
    chambre
    JOIN hotel ON chambre.cha_id = hotel.hot_id;
-------------------
Lot 2.9
SELECT
    chambre.cha_numero,
    chambre.cha_capacite,
    hotel.hot_nom,
    hotel.hot_categorie,
    hotel.hot_ville
FROM
    chambre
    JOIN hotel ON chambre.cha_id = hotel.hot_id
WHERE hot_ville="Bretou";
------------------
Lot2.10
SELECT
    CLIENT.cli_nom,
    reservation.res_date,
    hotel.hot_nom
FROM CLIENT
    JOIN reservation ON CLIENT
    .cli_id = reservation.res_id
    JOIN hotel ON hotel.hot_id = CLIENT.cli_id;
-----------
Lot2.11
SELECT
    station.sta_nom,
    hotel.hot_nom,
    chambre.cha_numero,
    chambre.cha_capacite
FROM
    chambre
    JOIN hotel ON chambre.cha_id = hotel.hot_id
    JOIN station ON station.sta_id = hotel.hot_id;
------------
Lot2.12
SELECT
    client.cli_nom,
    hotel.hot_nom,
    reservation.res_date_debut,
    DATEDIFF(res_date_fin, res_date_debut)
FROM client
    JOIN reservation on client.cli_id = reservation.res_cli_id
    JOIN chambre on chambre.cha_id=reservation.res_cha_id
    JOIN hotel ON hotel.hot_id=chambre.cha_hot_id;
---------------------------------------------------------------
---//////////////////////////////////////////////////////////////--
------------------------------------------------------------------
-----LOT 3----
Lot3.13
SELECT COUNT('hotel')
FROM station;
------------------
Lot3.14
SELECT COUNT('chambre')
FROM station;
---------------
Lot3.15
SELECT COUNT('chambre')
FROM station
WHERE 'cha_capacite'>1
;
------------------------
Lot3.16
SELECT hotel.hot_nom, client.cli_nom
from client
    JOIN reservation ON client.cli_nom=reservation.res_cli_id
    JOIN chambre on reservation.res_cha_id=chambre.cha_id
    JOIN hotel ON hotel.hot_id=chambre.cha_hot_id
    JOIN station ON hotel.hot_id=hotel.hot_sta_id
WHERE client.cli_nom = "squire";
-----------------------------
Lot3.17
SELECT ROUND(AVG(DATEDIFF(res_date_fin, res_date_debut))) AS 'Moyenne'
FROM reservation;
----------------------------------------------------------------------
