---------------------------------
-- Fynn Gächter, Andretta Filippo
---------------------------------
-- TABLE auto

INSERT INTO auto (fahrzeugID, kennzeichen, raeder, sitze, gewicht, maximallast, typ) VALUES
(1, 'AI123', 4, 4, 1200, NULL, 'pkw'),
(2, 'AI234', 4, NULL, NULL, 2000, 'transporter'),
(3, 'AI6969', 4, NULL, NULL, 750, 'transporter'),
(4, 'AI1244', 4, 7, 2000, NULL, 'pkw'),
(5, 'AI420', 4, 5, 1500, NULL, 'pkw'),
(6, 'AI777', 4, 5, 1800, 400, 'SUV'),
(7, 'AI888', 2, 2, 180, 50, 'Motorrad'),
(8, 'AI999', 4, 5, 1600, 300, 'Kombi'),
(9, 'AI111', 4, 2, 1400, 150, 'Cabrio'),
(10, 'AI222', 4, 9, 2200, 800, 'Van');

-- TABLE kunde

INSERT INTO kunde (kundenID, name, vorname, geburtsdatum) VALUES
(1, 'Wurst', 'Hans', to_date('2003-02-12', 'YYYY-MM-DD')),
(2, 'Muster', 'Max', to_date('2004-11-02', 'YYYY-MM-DD')),
(3, 'Müller', 'Peter', to_date('1957-05-14', 'YYYY-MM-DD'))
(4, 'Huber', 'Lea', to_date('1990-03-25', 'YYYY-MM-DD')),
(5, 'Keller', 'Jonas', to_date('1988-08-10', 'YYYY-MM-DD')),
(6, 'Steiner', 'Laura', to_date('1995-07-09', 'YYYY-MM-DD')),
(7, 'Weber', 'Simon', to_date('1980-01-19', 'YYYY-MM-DD')),
(8, 'Fischer', 'Nina', to_date('2001-12-01', 'YYYY-MM-DD')),
(9, 'Zimmermann', 'Luca', to_date('1999-09-23', 'YYYY-MM-DD')),
(10, 'Baumann', 'Sophie', to_date('1985-11-13', 'YYYY-MM-DD'));

-- TABLE ausleihe

INSERT INTO ausleihe (ausleiheID, fahrzeugID, kundenID, datumausleihe, datumruekgabe) VALUES
(1, 1, 1, '2025-01-05', '2025-01-12'),
(2, 2, 2, '2025-02-10', '2025-02-17'),
(3, 3, 3, '2025-03-01', '2025-03-07'),
(4, 4, 4, '2025-04-15', '2025-04-20'),
(5, 5, 5, '2025-05-01', '2025-05-06'),
(6, 6, 6, '2025-06-10', '2025-06-18'),
(7, 7, 7, '2025-05-15', '2025-05-20'),
(8, 8, 8, '2025-06-01', '2025-06-06'),
(9, 9, 9, '2025-06-15', '2025-06-22'),
(10, 10, 10, '2025-07-01', '2025-07-08');

-- TABLE schaden

INSERT INTO schaden (schadenID, ausleiheID, meldung, kosten, versicherung) VALUES
(1, 1, '2025-01-10', 350.00, 'Mobiliar'),
(2, 3, '2025-03-05', 1200.50, 'AXA'),
(3, 5, '2025-05-06', 800.00, 'Zurich'),
(4, 6, '2025-05-07', 200.00, 'Mobiliar'),
(5, 7, '2025-04-12', 550.00, 'AXA'),
(6, 8, '2025-07-28', 180.00, 'Mobiliar'),
(7, 9, '2025-08-12', 400.00, 'Zurich'),
(8, 10, '2025-05-23', 900.00, 'AXA'),
(9, 2, '2025-03-12', 220.00, 'Zurich'),
(10, 4, '2025-01-31', 150.00, 'Mobiliar');

-- TABLE fuehrerscheintyp

INSERT INTO fuehrerscheintyp (fuehrerscheintypID, klasse) VALUES
(1, 'B'),
(2, 'BE'),
(3, 'C'),
(4, 'CE'),
(5, 'B'),
(6, 'B'),
(7, 'B'),
(8, 'B'),
(9, 'B'),
(10, 'B');

-- TABLE kundefuehrerscheintyp

INSERT INTO kundefuehrerscheintyp (fuehrerscheintypID, kundenID) VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 3),
(4, 3),
(1, 4),
(3, 5),
(2, 6),
(1, 7),
(5, 10);
