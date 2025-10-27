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
(1, 1, 1, '2025-01-05', '2025-01-12'),
(2, 2, 2, '2025-02-10', '2025-02-17'),
(3, 3, 3, '2025-03-01', '2025-03-07'),
(4, 4, 1, '2025-04-15', '2025-04-20'),
(5, 5, 2, '2025-05-01', '2025-05-06'),
(6, 1, 3, '2025-06-10', '2025-06-18');

-- TABLE schaden

INSERT INTO schaden (schadenID, ausleiheID, meldung, kosten, versicherung) VALUES
(1, 1, '2025-01-10', 350.00, 'Mobiliar'),
(2, 3, '2025-03-05', 1200.50, 'AXA'),
(3, 5, '2025-05-06', 800.00, 'Zurich');

-- TABLE fuehrerscheintyp

INSERT INTO fuehrerscheintyp (fuehrerscheintypID, klasse) VALUES
(1, 'B'),
(2, 'BE'),
(3, 'C'),
(4, 'CE');

-- TABLE kundefuehrerscheintyp

INSERT INTO kundefuehrerscheintyp (fuehrerscheintypID, kundenID) VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 3),
(4, 3);
