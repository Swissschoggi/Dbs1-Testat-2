--------------------------------------------------------------
-- DISTINCT gibt alle autotypen aus ohne duplikate anzuzeigen.
--------------------------------------------------------------
SELECT DISTINCT typ FROM auto;

----------------------------------------------------------------------------------
-- Inner join verwendet um die Kunden abzubilden, die ein Fahrzeug gemietet haben.
----------------------------------------------------------------------------------
SELECT kunde.kundenid, ausleihe.ausleiheid, auto.fahrzeugid, kunde.name
FROM ausleihe
inner join kunde ON ausleihe.kundenid=kunde.kundenid
inner join auto ON ausleihe.fahrzeugid=auto.fahrzeugid;

-----------------------------------------------------------------------
-- Querry mit unkorreliertem Subquerry, das Subquerry läuft unabhängig.
-----------------------------------------------------------------------
SELECT name
FROM kunde
WHERE kundenid IN (
    SELECT kundenid
    FROM ausleihe
    WHERE fahrzeugid = 5
);

--------------------------------------
-- Querray mit der verwendung von ANY.
--------------------------------------
SELECT gewicht, fahrzeugid
FROM auto 
WHERE fahrzeugid = ANY (SELECT fahrzeugid FROM ausleihe WHERE gewicht > 1500);

--------------------------------------------------------------------------------------------------------
-- Querry mit einem Left outer join um alle Kunden abzufragen, die die auch kein Führerschein typ haben.
--------------------------------------------------------------------------------------------------------
SELECT kunde.kundenid, kunde.name, kundefuehrerscheintyp.fuehrerscheintypid
FROM kunde
LEFT OUTER JOIN kundefuehrerscheintyp
ON kunde.kundenid = kundefuehrerscheintyp.kundenid;

---------------------------------------------------
-- Filtert nach Kunden die älter wie 25 Jahre sind.
---------------------------------------------------
SELECT name, vorname, geburtsdatum
FROM kunde
WHERE geburtsdatum <= CURRENT_DATE - INTERVAL '25 years';


--------------------------------------------
-- Subquery unabhängig von der outter query.
--------------------------------------------
SELECT ausleihe.ausleiheid, kunde.name, kunde.vorname, schaden.anzahl_schaeden, schaden.durchschnittskosten
FROM ausleihe
INNER JOIN kunde ON ausleihe.kundenID = kunde.kundenid
INNER JOIN (
    SELECT ausleiheid,
    COUNT (schadenid) AS anzahl_schaeden,
    AVG(kosten) AS durchschnittskosten
    FROM schaden
    GROUP BY ausleiheid
)
schaden ON ausleihe.ausleiheID = schaden.ausleiheID
ORDER BY schaden.durchschnittskosten DESC;

-------
-- CTE.
-------
WITH kunden_mit_schaden AS (
	SELECT
		ausleihe.ausleiheid,
		kunde.kundenid,
		kunde.name,
		kunde.vorname,
		COUNT (schadenid) AS anzahl_schaeden,
    	AVG(kosten) AS durchschnittskosten
	FROM ausleihe
    JOIN kunde ON ausleihe.kundenID = kunde.kundenID
    JOIN schaden ON ausleihe.ausleiheID = schaden.ausleiheID
	GROUP BY ausleihe.ausleiheID, kunde.kundenID, kunde.name, kunde.vorname
) SELECT *
FROM kunden_mit_schaden
ORDER BY durchschnittskosten DESC;