----Cas Papyrus-- Aouadi khraief----
1.1
Quelles sont les commandes du fournisseur 09120?

SELECT numfou, numcom
from entcom
WHERE numfou= 09120
-----------------------------------
1.2
Afficher le code des fournisseurs pour lesquels des commandes ont Ã©tÃ© passÃ©es.

SELECT numfou, delliv
FROM `vente
` WHERE delliv>0
------------------------
1.3
Afficher le nombre de commandes fournisseurs passÃ©es, et le nombre de fournisseur concernÃ©s.

SELECT qtecde, qteliv
from ligcom
--------------------------------------------
1.4
Editer les produits ayant un stock infÃ©rieur ou Ã©gal au stock d'alerte et dont la quantitÃ© annuelle est infÃ©rieur est infÃ©rieure Ã 1000 (informations Ã  fournir : nÂ° produit, libellÃ©produit, stock, stockactuel d'alerte, quantitÃ©annuelle)

SELECT *
FROM produit
where stkphy<=stkale AND qteann<1000;
--------------------------------------------
1.5
Quels sont les fournisseurs situÃ©s dans les dÃ©partements 75 78 92 77 ? Lâ€™affichage
(dÃ©partement, nom fournisseur) sera effectuÃ© par dÃ©partement dÃ©croissant, puis par ordre alphabÃ©tique

SELECT posfou, nomfou
FROM fournis
WHERE posfou LIKE'75%'
    OR posfou LIKE '78%'
    OR posfou LIKE '92%'
    OR posfou LIKE '77%'
GROUP BY posfou
ASC
ORDER BY nomfou ASC
----------------------------------------------------
1.6
Quelles sont les commandes passÃ©es au mois de mars et avril?

SELECT datcom
FROM entcom
WHERE datcom BETWEEN '2018-04-01' AND '2018-05-31'
-----------------------------
1.7
Quelles sont les commandes du jourqui ont des observations particuliÃ¨res ?
(Affichage numÃ©ro de commande, date de commande)

SELECT numcom, datcom
FROM entcom
WHERE obscom !=''
---------------------------------------------------
1.8
Listerle total de chaque commande par total dÃ©croissant
(Affichage numÃ©ro de commande et total)

SELECT
    numcom,
    qtecde * priuni AS total
FROM
    ligcom
GROUP BY
    total
DESC
-----------------------------------------
1.9
Lister les commandesdont le total est supÃ©rieur Ã  10000â‚¬;
on exclura dans le calcul du total les articles commandÃ©s en quantitÃ© supÃ©rieure ou Ã©gale Ã  1000.
(Affichage numÃ©ro de commande et total)

SELECT
    numcom,
    priuni * qtecde AS total
FROM
    ligcom
WHERE
    (priuni * qtecde) > 10000 AND qtecde > 1000
-----------------------------------------------------
1.10
Lister les commandes par nom fournisseur
(Afficher le nom du fournisseur, le numÃ©ro de commande et la date)

SELECT numfou, numcom, datcom
from entcom
------------------------------------
1.11
SELECT ligcom.numcom, obscom, nomfou, libart, qtecde*priuni AS total
FROM produit
    JOIN ligcom ON ligcom.codart=produit.codart
    JOIN entcom ON ligcom.numcom=entcom.numcom
    JOIN fournis ON fournis.numfou=entcom.numfou
WHERE obscom LIKE '%urgent%'
-----------------------------------------------------
1.12
Coder de 2maniÃ¨res diffÃ©rentes la requÃªte
suivante:
Lister lenom desfournisseurs susceptibles de livrer au moins un article

SELECT
    fournis.nomfou,
    qte1,
    qte2,
    qte3
FROM
    vente
    JOIN fournis ON fournis.numfou = vente.numfou
WHERE
    qte1 != 0 AND qte2 != 0 AND qte3 != 0

---------2eme meth---
SELECT
    fournis.nomfou,
    qte1,
    qte2,
    qte3
FROM
    vente
    JOIN fournis ON fournis.numfou = vente.numfou
WHERE
    qte1 > 0 AND qte2 > 0 AND qte3 > 0
---------------------------------------------------------
1.13
Coder de 2 maniÃ¨res diffÃ©rentes la requÃªte suivanteLister les commandes
(NumÃ©ro et date) dont le fournisseur est celui de la commande 70210

SELECT numcom, datcom
FROM entcom
WHERE numcom='70210'

----------2eme meth---
SELECT numcom, datcom
FROM entcom
WHERE numcom LIKE '%70210%'
---------------------------------------------
1.14
Dans les articles susceptibles dâ€™Ãªtre vendus, lister les articles moins chers
(basÃ©s sur Prix1) que le moins cher des rubans
(article dont le premier caractÃ¨re commence par R). On affichera le libellÃ© de lâ€™article et prix1

SELECT
    prix1,
    libart
FROM
    produit
    JOIN vente ON produit.codart = vente.codart
WHERE
    prix1 < 120 AND vente.codart LIKE 'R%'
-------------------------------------------------
1.15
Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est infÃ©rieur ou Ã©gal Ã  150 % du
stock dalerte. La liste est triÃ©e par produit puis fournisseur

----------------------------------------------
------"(100 x valeur partielle) / valeur Totale"---------
----------------------------------------------
SELECT
    nomfou,
    stkale,
    stkphy
FROM
    fournis
    JOIN vente ON fournis.numfou = vente.numfou
    JOIN produit ON vente.codart = produit.codart
WHERE
    stkphy <=((100 * stkale) / qteann)
----------------------------------------------

1.17.
SELECT
    nomfou,
    SUM((100 * stkphy) / qteann) AS total
FROM
    produit
    JOIN vente ON produit.codart = vente.codart
    JOIN fournis ON vente.numfou = fournis.numfou
GROUP BY
    ((100 * stkphy) / qteann)
DESC

-----------------------------------------------

1.18.
SELECT
    libart,
    SUM((90 * qtecde) / qteann) AS qterecom
FROM
    ligcom
    JOIN produit ON ligcom.codart = produit.codart
GROUP BY
    libart
---------------------------------------------------


1.19.

SELECT
    YEAR(1993),
    nomfou,
    SUM((prix1 * qtecde) *(1 +0.2)) AS CHDA
FROM
    vente
    JOIN fournis ON vente.numfou = fournis.numfou
    JOIN produit ON produit.codart = vente.codart
    JOIN ligcom ON ligcom.codart = produit.codart
GROUP BY nomfou
-------------------------------------------------
-- LES BESOINS DE MAJ

--1.1
UPDATE VENTE
SET PRIX1 = PRIX1*1.04, PRIX2 = PRIX2 *1.02
WHERE NUMFOU = 9180

--1.2
UPDATE VENTE
SET PRIX2=PRIX1
WHERE PRIX2 is null

--1.3
UPDATE ENTCOM 
SET OBSCOM = '*****'
FROM entcom
    JOIN FOURNIS
    ON ENTCOM.NUMFOU = FOURNIS.NUMFOU 
WHERE SATISF <5


--1.4

DELETE from VENTE
FROM VENTE
    JOIN PRODUIT
    on PRODUIT.CODART = VENTE.CODART
WHERE produit.CODART = 'l110'

DELETE from LIGCOM
FROM LIGCOM
    JOIN PRODUIT
    on PRODUIT.CODART = ligcom.CODART
WHERE produit.CODART = 'l110'

DELETE from produit
FROM produit
WHERE produit.CODART = 'l110'

--1.5

DELETE FROM ENTCOM
FROM ENTCOM
    JOIN LIGCOM
    ON LIGCOM.NUMCOM = ENTCOM.NUMCOM
WHERE ENTCOM.NUMCOM in (SELECT LIGCOM.NUMCOM
FROM .LIGCOM, .ENTCOM
WHERE ENTCOM.NUMCOM <> LIGCOM.NUMCOM)
----------------------------------------------------------------------------------------------------------