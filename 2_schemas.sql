CREATE TABLE auto (
    fahrzeugID INTEGER PRIMARY KEY,
    kennzeichen STRING,
    raeder INTEGER
);

CREATE TABLE pkw (
    sitze INTEGER,
    gewicht DECIMAL,
    PRIMARY KEY (fahrzeugID)
);

CREATE TABLE transporter (
    maximallast DECIMAL,
    PRIMARY KEY (fahrzeugID)
);

CREATE TABLE kunde (
    kundenID PRIMARY KEY,
    name STRING,
    vorname STRING,
    geburtsdatum DATE    
);

CREATE TABLE ausleihe (
    ausleiheID INTEGER PRIMARY KEY,
    datumausleihe DATE,
    datumruekgabe DATE,
    PRIMARY KEY (fahrzeugID, kundenID)
);

CREATE TABLE schaden (
    schadenID PRIMARY KEY,
    meldung DATE,
    kosten DECIMAL,
    versicherung STRING,
    PRIMARY KEY (ausleiheID)
);

CREATE TABLE fuehrerscheintyp (
    fuehrerscheintypID INTEGER PRIMARY KEY,
    klasse STRING
);

CREATE TABLE kundefuehrerscheintyp (
    PRIMARY KEY (fuehrerscheintypID, kundenID)
)