--1) Slice
--Obtenir toutes les transactions effectu�es par les clients dans une ville sp�cifique Houston.

SELECT tf.Transaction_ID, tf.Total_Cost, c.Customer_Name
FROM Transaction_Fait tf
JOIN Customer c ON tf.Customer_ID = c.Customer_ID
WHERE c.City = 'Houston';

--Afficher les transactions avec un co�t total sup�rieur � 10

SELECT tf.Transaction_ID, tf.Total_Cost, tf.Total_Items
FROM Transaction_Fait tf
WHERE tf.Total_Cost > 10;

--Cette requ�te retourne toutes les transactions qui ont eu lieu pendant l �t�. Elle permet d'analyser les ventes durant cette saison sp�cifique et d'observer si les ventes sont plus �lev�es en �t�.

SELECT *
FROM Transaction_Fait tf
JOIN Times t ON tf.Times_ID = t.Times_ID
WHERE t.Season = 'Summer';

--2) Dice 
--Obtenir les transactions effectu�es par des clients ayant une cat�gorie "Regular" et ayant utilis� une m�thode de paiement "Carte de cr�dit".

SELECT tf.Transaction_ID, tf.Total_Cost, c.Customer_Name
FROM Transaction_Fait tf
JOIN Customer c ON tf.Customer_ID = c.Customer_ID
WHERE c.Customer_Category = 'Homemaker' AND c.Payment_Method = 'Cash';


--Cette requ�te identifie les transactions o� des clients de cat�gorie � Premium � ont retenu d'une remise. Cela aide � �valuer l'impact des promotions sur un segment particulier de client�le.

SELECT tf.Transaction_ID, tf.Total_Items, tf.Total_Cost, c.Customer_Category, p.Promotion
FROM Transaction_Fait tf
JOIN Customer c ON tf.Customer_ID = c.Customer_ID
JOIN Promotion p ON tf.Promotion_ID = p.Id_Promotion
WHERE c.Customer_Category = 'Professional' AND p.Discount_Applied = 1;

--3) Roll_up
-- Obtenir le total des ventes par ann�e.

SELECT t.Year, SUM(tf.Total_Cost) AS Total_Sales
FROM Transaction_Fait tf
JOIN Times t ON tf.Times_ID = t.Times_ID
GROUP BY t.Year
ORDER BY t.Year;

--Agr�ger les ventes par type de magasin.

SELECT m.Store_Type, SUM(tf.Total_Cost) AS Total_Sales
FROM Transaction_Fait tf
JOIN Magasin m ON tf.Magasin_ID = m.Id_Magasin
GROUP BY m.Store_Type
ORDER BY Total_Sales DESC;

--Cette requ�te retourne les ventes totales par mois, ce qui est utile pour analyser la tendance mensuelle des ventes et pour identifier les p�riodes de forte ou de faible activit�.


SELECT t.Month, SUM(tf.Total_Cost) AS Total_Sales
FROM Transaction_Fait tf
JOIN Times t ON tf.Times_ID = t.Times_ID
GROUP BY t.Month
ORDER BY t.Month;


--4)Drill-Down
--D�tails des ventes pour un magasin sp�cifique Convenience Store au cours d'une ann�e 2023

SELECT t.Date, tf.Total_Cost, tf.Total_Items
FROM Transaction_Fait tf
JOIN Times t ON tf.Times_ID = t.Times_ID
JOIN Magasin m ON tf.Magasin_ID = m.Id_Magasin
WHERE m.Store_Type = 'Convenience Store' AND t.Year = 2023
ORDER BY t.Date;

-- permet de descendre au niveau de d�tail le plus bas, par exemple, pour analyser les ventes journali�res dans un mois donn�.

SELECT t.Date, SUM(tf.Total_Cost) AS Daily_Sales
FROM Transaction_Fait tf
JOIN Times t ON tf.Times_ID = t.Times_ID
WHERE t.Month = '07'
GROUP BY t.Date
ORDER BY t.Date;





