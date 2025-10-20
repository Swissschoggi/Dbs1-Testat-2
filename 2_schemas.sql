CREATE TABLE auto (
    fahrzeugID INTEGER PRIMARY KEY,
    kennzeichen VARCHAR (20) NOT NULL,
    raeder INTEGER
);

CREATE TABLE pkw (
    fahrzeugID INTEGER NOT NULL,
    sitze INTEGER,
    gewicht DECIMAL,
    PRIMARY KEY (fahrzeugID)
);

CREATE TABLE transporter (
    fahrzeugID INTEGER NOT NULL,
    maximallast DECIMAL,
    PRIMARY KEY (fahrzeugID)
);

CREATE TABLE kunde (
    kundenID PRIMARY KEY,
    name VARCHAR (20),
    vorname VARCHAR (20),
    geburtsdatum DATE    
);

CREATE TABLE ausleihe (
    ausleiheID INTEGER PRIMARY KEY,
    fahrzeugID INTEGER NOT NULL,
    kundenID INTEGER NOT NULL,    
    datumausleihe DATE,
    datumruekgabe DATE,
    PRIMARY KEY (fahrzeugID, kundenID)
);

CREATE TABLE schaden (
    schadenID PRIMARY KEY,
    ausleiheID INTEGER NOT NULL,
    meldung DATE,
    kosten DECIMAL,
    versicherung VARCHAR (20) NOT NULL,
    PRIMARY KEY (ausleiheID)
);

CREATE TABLE fuehrerscheintyp (
    fuehrerscheintypID INTEGER PRIMARY KEY,
    klasse VARCHAR (20) NOT NULL
);

CREATE TABLE kundefuehrerscheintyp (
    fuehrerscheintypID INTEGER NOT NULL,
    kundenID INTEGER NOT NULL,
    PRIMARY KEY (fuehrerscheintypID, kundenID)
);