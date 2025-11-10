SELECT DISTINCT typ FROM auto;

-- DISTINCT gibt alle autotypen aus ohne duplikate.

  SELECT gewicht, fahrzeugid
FROM auto WHERE fahrzeugid = ANY (SELECT fahrzeugid FROM ausleihe WHERE gewicht > 1500);
