 -------------La base exo1---------
------------------------------------
----eval --script d'implémentation base sous sql--- 
------------------------------------------------------
----------------------debut-eval-sql-----------------------------------------
----------------------------------------------------------------------------
------------------------1er-prt----------------------------------------------
--------------------------------------------------------------

--Créez le script d'implémentation des différentes tables sous MySQL--

DROP DATABASE IF EXISTS  base1;
CREATE DATABASE base1;
USE base1;
CREATE TABLE Client
(
    cli_num INT NOT NULL
    AUTO_INCREMENT PRIMARY KEY ,
cli_nom    	  VARCHAR
    (50),
cli_adresse	  VARCHAR
    (50),
cli_tel  		VARCHAR
    (30)
);
    CREATE TABLE Produit
    (
        pro_num INT NOT NULL
        AUTO_INCREMENT PRIMARY KEY,
pro_libelle  		  VARCHAR
        (50),
pro_description	 	 VARCHAR
        (50)
);
        CREATE TABLE Commande
        (
            com_num INT NOT NULL
            AUTO_INCREMENT PRIMARY KEY,
cli_num	 	 INT NOT NULL,
 CONSTRAINT `Commande_ibfk` FOREIGN KEY
            (`com_num`) REFERENCES est_compose
            (`com_num`),
com_date	DATETIME NOT NULL,
com_obs 	VARCHAR
            (50)
);
            CREATE TABLE est_compose (
com_num INT NOT NULL  ,
pro_num INT NOT NULL,
est_qte INT NOT NULL,
PRIMARY KEY (com_num, pro_num),
CONSTRAINT `est_compose_ibfk_1` FOREIGN KEY
            (com_num) REFERENCES Commande
            (com_num),
CONSTRAINT `est_compose_ibfk_2` FOREIGN KEY
            (pro_num) REFERENCES Produit
            (pro_num)
);
1.1
            CREATE INDEX ‘cli-nom’ ON ‘client’ ;
-------------------2eme-prt--------------------------------------
-----eval table  northwind------
-----------------------------------------
1 Liste des contacts français :
            SELECT
                companyName,
                contactName,
                contactTitle,
                phone
            FROM
                customers
            WHERE
    country = 'france'
            ---------------------------------------------------------------------
            2  - Produits vendus par le fournisseur « Exotic Liquids » :
            SELECT
                productName,
                unitPrice
            FROM
                products
            WHERE
    productName = 'Chai' OR productName = 'Chang' OR productName = 'Aniseed Syrup'
            ---------------------------------------------------------------------------
            3  Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :

            SELECT
                CompanyName,
                COUNT(productName) AS nbr_products
            FROM
                suppliers
                JOIN products ON suppliers.SupplierID = products.SupplierID
            WHERE
    country = 'france'
            GROUP BY
    CompanyName
            ORDER BY
    nbr_products
DESC
            --------------------------------------------------------------------------------------
            4 - Liste des clients Français ayant plus de 10 commandes :
            SELECT
                shipname,
                COUNT(shipvia) AS nbr_commandes
            FROM
                orders
            WHERE
    shipcountry = 'france'
            GROUP BY
    shipname
            HAVING
    nbr_commandes > 10
            ------------------------------------------------------------------------------------
            5- Liste des clients ayant un chiffre d’affaires > 30.000 :
            SELECT
                shipname,
                SUM(quantity * unitprice) AS CA,
                shipcountry
            FROM
                order_details
                JOIN orders ON orders.OrderID = order_details.OrderID
            GROUP BY
    shipname
            HAVING
    CA > 30000
            ORDER BY CA DESC
            ;
----------------------------------------------------------------------------------------------
6- – Liste des pays dont les clients ont passé commande de produits fournis par « Exotic 
Liquids » :
            SELECT
                Country
            FROM
                suppliers
                JOIN products ON products.SupplierID = suppliers.SupplierID
            WHERE
    unitsonorder = 'exotic liquid'
            GROUP BY
    Country
            ORDER BY 
     country
            ;
-----------------------------------------------------------------------------------------------
7- Montant des ventes de 1997 :
            SELECT
                SUM(Unitprice * Quantity) AS "Montant des ventes 97"
            FROM
                order_details
                JOIN orders ON orders.OrderID = order_details.OrderID
            WHERE
    YEAR(orders.OrderDate) = 1997
            --------------------------------------------------------------------------------
            8- Montant des ventes de 1997 mois par mois :
            SELECT
                MONTHNAME(orders.OrderDate) AS mois, SUM(Unitprice * Quantity) AS "Montant des ventes 97"
            FROM
                order_details
                JOIN orders ON orders.OrderID = order_details.OrderID
            WHERE
    YEAR(orders.OrderDate) = 1997
            GROUP BY
    MONTH(orders.OrderDate)
            -----------------------------------------------------------------------------------------
            9 - Depuis quelle date le client « Du monde entier » n’a plus commandé ?
            SELECT
                MAX(OrderDate) AS "Date de derniére commande"
            FROM
                orders
            
WHERE
    shipname = "du monde entier"
---------------------------------------------------------------------------------------------
10 - Quel est le délai moyen de livraison en jours ?
            SELECT
                ROUND(
        AVG(
            DATEDIFF(shippeddate, orderdate)
        )
    ) AS "Délai moyen de livraison en jours"
            FROM
                orders
            ORDER BY
    orderdate,
    shippeddate
---------------------------------fin-eval-sql-------------------