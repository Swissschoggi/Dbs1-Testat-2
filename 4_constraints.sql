ALTER TABLE ausleihe
ADD CONSTRAINT fk_auto_ausleihe
    FOREIGN KEY (fahrzeugID) REFERENCES auto (fahrzeugID)
;

ALTER TABLE ausleihe
ADD CONSTRAINT fk_kunde_ausleihe
    FOREIGN KEY (kundenID) REFERENCES kunde (kundenID)
;

ALTER TABLE schaden
ADD CONSTRAINT fk_ausleihe_schaden
    FOREIGN KEY (ausleiheID) REFERENCES ausleihe (ausleiheID)
;

ALTER TABLE kundefuehrerscheintyp
ADD CONSTRAINT fk_fuehrerscheintyp_kundefuehrerscheintyp
    FOREIGN KEY (fuehrerscheintypID) REFERENCES fuehrerscheintyp (fuehrerscheintypID)
;

ALTER TABLE kundefuehrerscheintyp
ADD CONSTRAINT fk_kunde_kundefuehrerscheintyp
    FOREIGN KEY (kundenID) REFERENCES kunde (kundenID)
;