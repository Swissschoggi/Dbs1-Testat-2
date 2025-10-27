-- TABLE auto

INSERT INTO auto (fahrzeugID, kennzeichen, raeder, sitze, gewicht, maximallast, typ) VALUES
(1, 'AI123', 4, 4, 1200, NULL, 'pkw'),
(2, 'AI234', 4, NULL, NULL, 2000, 'transporter'),
(3, 'AI6969', 4, NULL, NULL, 750, 'transporter'),
(4, 'AI1244', 4, 7, 2000, NULL, 'pkw'),
(5, 'AI420', 4, 5, 1500, NULL, 'pkw');

-- TABLE kunde
INSERT INTO kunde (kundenID, name, vorname, geburtsdatum) VALUES
(1, 'Wurst', 'Hans', to_date('2003-02-12', 'YYYY-MM-DD')),
(2, 'Muster', 'Max', to_date('2004-11-02', 'YYYY-MM-DD')),
(3, 'Müller', 'Peter', to_date('1957-05-14', 'YYYY-MM-DD'));

-- TABLE ausleihe
INSERT INTO ausleihe (ausleiheID, fahrzeugID, kundenID, datumausleihe, datumruekgabe) VALUES
(1, ),
(2, ),
(3, ),
(4, ),
(5, ),
(6, );

-- TABLE schaden

-- TABLE fuehrerscheintyp

-- TABLE kundefuehrerscheintyp