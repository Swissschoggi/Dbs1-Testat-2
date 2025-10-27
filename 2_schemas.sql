CREATE TABLE auto (
    fahrzeugID INTEGER  PRIMARY KEY,
    kennzeichen VARCHAR (20) NOT NULL,
    raeder INTEGER NOT NULL,
    sitze INTEGER,
    gewicht DECIMAL,
    maximallast DECIMAL,
    typ TEXT NOT NULL
);

CREATE TABLE kunde (
    kundenID INTEGER  PRIMARY KEY,
    name VARCHAR (20),
    vorname VARCHAR (20),
    geburtsdatum DATE    
);

CREATE TABLE ausleihe (
    ausleiheID INTEGER  PRIMARY KEY,
    fahrzeugID INTEGER NOT NULL,
    kundenID INTEGER NOT NULL,    
    datumausleihe DATE,
    datumruekgabe DATE
);

CREATE TABLE schaden (
    schadenID INTEGER  PRIMARY KEY,
    ausleiheID INTEGER NOT NULL,
    meldung DATE,
    kosten DECIMAL,
    versicherung VARCHAR (20) NOT NULL
);

CREATE TABLE fuehrerscheintyp (
    fuehrerscheintypID INTEGER  PRIMARY KEY,
    klasse VARCHAR (20) NOT NULL
);

CREATE TABLE kundefuehrerscheintyp (
    fuehrerscheintypID INTEGER NOT NULL,
    kundenID INTEGER NOT NULL
);