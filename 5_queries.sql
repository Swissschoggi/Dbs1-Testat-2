------------
-- Aufgabe 1
------------

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

------------
-- Aufgabe 2
------------

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

--------------------------------------------------------------------------------------
-- c) Schreiben Sie eine sinnvolle Query mit einer GROUP BY-Klausel.
-- Übersicht, welche Ausleihen als Nächstes zurückkommen, sortiert nach Rückgabedatum.
--------------------------------------------------------------------------------------
SELECT a.ausleiheID, k.name, k.vorname, a.datumruekgabe
FROM ausleihe a
JOIN kunde k ON a.kundenID = k.kundenID
ORDER BY a.datumruekgabe;

-------------------------------------------------------------------
-- d) Schreiben Sie eine sinnvolle Query mit einer Window-Funktion.
-- Top 3 Kunden mit meisten Ausleihen
-------------------------------------------------------------------
SELECT 
    name,
    vorname,
    COUNT(*) AS anzahl_ausleihen,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rang
FROM 
    kunde
JOIN 
    ausleihe USING (kundenID)
GROUP BY 
    name, vorname
ORDER BY 
    anzahl_ausleihen DESC
LIMIT 3;

------------
-- Aufgabe 3
------------

--------------------------------------------------------------------
-- a) Schreiben Sie eine View, die mindestens drei tabellen umfasst.
--------------------------------------------------------------------

CREATE VIEW ausleihe_uebersicht AS
SELECT a.ausleiheID, a.datumausleihe, a.datumruekgabe, k.kundenID, k.name, k.geburtsdatum, au.fahrzeugID, au.kennzeichen, au.typ, au.sitze, au.gewicht, s.schadenID, s.meldung, s.kosten, s.versicherung
FROM ausleihe a
JOIN kunde k ON a.kundenID = k.kundenID
JOIN auto au ON a.fahrzeugID = au.fahrzeugID
LEFT JOIN schaden s ON a.ausleiheID = s.ausleiheID
ORDER BY k.kundenID, a.ausleiheID;

-------------------------------------------------------
-- b) Schreiben Sie dann eine normale Query, welche diese View verwendet.
-- Abfrage aller Ausleihen mit Schäden und deren Kosten
-------------------------------------------------------
SELECT 
    name, kennzeichen, typ, datumausleihe, datumruekgabe, meldung, kosten, versicherung
FROM ausleihe_uebersicht
WHERE schadenID IS NOT NULL
    AND kosten > 1000
ORDER BY 
    kosten DESC,
    datumausleihe DESC;

--------------------------------------------------------------------------------------------------------
-- c) Schreiben Sie eine zweite, einfache View, die sich updaten lässt.
-- View erstellt für die Anpassung der Kunden, falls sich eine Name oder auch ein Vorname ändern sollte. 
--------------------------------------------------------------------------------------------------------
CREATE VIEW kundenAnpassung AS
SELECT kundenID, name, vorname
FROM kunde;

--------------------------------------------------------------------------------------------------------
-- d) Ändern Sie einen Datensatz über die zweite View mit einem UPDATE-Statement.
-- update für die view erstellt, die den Nachnamen von einem Nutzer ändert.
--------------------------------------------------------------------------------------------------------
UPDATE kundenAnpassung
SET name = 'Fritz'
WHERE kundenID = 2;
SELECT * FROM kundenAnpassung;

-------------------------------
-- Aufgabe 1 Lateral Join-Query
-------------------------------
SELECT
    k.kundenID, k.name, k.vorname, s.schadenID, s.kosten, s.meldung
FROM kunde k
JOIN LATERAL (
    SELECT
        s.schadenID, s.kosten, s.meldung
    FROM ausleihe a
    JOIN schaden s ON s.ausleiheID = a.ausleiheID
    WHERE a.kundenID = k.kundenID
    ORDER BY s.kosten DESC
) AS s ON true
ORDER BY k.kundenID, s.kosten DESC;
