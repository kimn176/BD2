--Les contraintes 1 2 3 4 ont été faient directement à la création des tables 


--Contrainte 5 
CREATE OR REPLACE TRIGGER tr_check_jeunesse_age
BEFORE INSERT OR UPDATE ON Jeunesse
FOR EACH ROW
DECLARE
min_age INT;
BEGIN
SELECT Classification INTO min_age FROM Age WHERE ID = (SELECT age_id FROM Contenu WHERE id = :NEW.Contenu);
IF min_age = -16 THEN
RAISE_APPLICATION_ERROR(-20000, 'Ce contenu n''est pas adapté pour les jeunes de moins de 16 ans');
END IF;
IF min_age = -18 THEN
RAISE_APPLICATION_ERROR(-20000, 'Ce contenu n''est pas adapté pour les jeunes de moins de 18 ans');
END IF;
END;

--Contrainte 6 

CREATE OR REPLACE TRIGGER tr_check_max_locations 
BEFORE INSERT ON ContenuAbonnement
FOR EACH ROW
DECLARE
  nb_locations INT;
  maxLocations INT;
BEGIN
  SELECT COUNT(*) INTO nb_locations 
  FROM ContenuAbonnement 
  WHERE IdSouscription = :NEW.IdSouscription;
  
  SELECT maxLocationSimul 
  INTO maxLocations 
  FROM Abonnement 
  WHERE ID = (SELECT IdAbonnement FROM Souscription WHERE ID = :NEW.IdSouscription);

  IF nb_locations >= maxLocations THEN
    RAISE_APPLICATION_ERROR(-20001, 'Le nombre de locations simultanées pour cet abonnement est atteint.');
  END IF;
END;


--Contrainte 7
CREATE OR REPLACE TRIGGER tr_check_client_abonnement
BEFORE INSERT OR UPDATE ON Souscription
FOR EACH ROW
DECLARE
    nb_souscriptions INT;
BEGIN
    SELECT COUNT(*) INTO nb_souscriptions FROM Souscription WHERE IdClient = :NEW.IdClient AND :NEW.DateDebSouscription <= DateFinSouscription AND :NEW.DateFinSouscription >= DateDebSouscription;
    IF nb_souscriptions > 0 THEN
        raise_application_error(-20001, 'Le client a déjà une souscription en cours pendant cette période.');
    END IF;
END;

--Contrainte 8 
