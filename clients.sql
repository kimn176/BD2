
--Insertion des ages
INSERT INTO AGE(ID,Classification) VALUES
(1,'-10');
INSERT INTO AGE(ID,Classification) VALUES
(2,'-12');
INSERT INTO AGE(ID,Classification) VALUES
(3,'-16');
INSERT INTO AGE(ID,Classification) VALUES
(4,'-18')

--insertion des abonnements
INSERT INTO Abonnement (ID,nom,maxLocationSimul,prixMensuel,MaxJourCine,MaxJourSeries,MaxJourJeunesse,MaxJourDivertissement) VALUES
(1,'Basique',2,5.99,1,1,2,2);
INSERT INTO Abonnement (ID,nom,maxLocationSimul,prixMensuel,MaxJourCine,MaxJourSeries,MaxJourJeunesse,MaxJourDivertissement) VALUES
(2,'Prénium',5,9.99,4,4,5,5);
INSERT INTO Abonnement (ID,nom,maxLocationSimul,prixMensuel,MaxJourCine,MaxJourSeries,MaxJourJeunesse,MaxJourDivertissement) VALUES
(3,'VIP',10,29.99,10,10,10,10);

--insertion des formats
INSERT INTO Format(ID,Nom,extension) VALUES
(1,'MP4','.mp4,.m4a');
INSERT INTO Format(ID,Nom,extension) VALUES
(2,'Audio video interleave','.avi');
INSERT INTO Format(ID,Nom,extension) VALUES
(3,'Matroska','.mkv');

--Insertion des MIMES
INSERT INTO MIME(ID,nom,logiciel) VALUES
(1,'video/x-msvideo','VLC');


--Insertion des clients
INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(1, 'Dupont', 'Pierre', '10 rue des Lilas, 75010 Paris', 'pierre.dupont@mail.com', '+33 6 12 34 56 78', 'Password1!');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(2, 'Martin', 'Sophie', '12 avenue de la Gare, 69001 Lyon', 'sophie.martin@mail.com', '+33 6 23 45 67 89', 'Mypass123$');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(3, 'Lefevre', 'Julie', '7 rue des Champs, 31000 Toulouse', 'julie.lefevre@mail.com', '+33 6 34 56 78 90', 'Passw0rd!');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(4, 'Dumont', 'Francois', '14 boulevard Voltaire, 59000 Lille', 'francois.dumont@mail.com', '+33 6 45 67 89 01', 'Myp@ssword');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(5, 'Garcia', 'Manon', '20 avenue des Vignes, 13000 Marseille', 'manon.garcia@mail.com', '+33 6 56 78 90 12', 'Pa$$word123');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(6, 'Mercier', 'Luc', '5 rue de la Paix, 75001 Paris', 'luc.mercier@mail.com', '+33 6 67 89 01 23', 'MyP@ssw0rd');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(7, 'Durand', 'Sophie', '22 avenue des Roses, 69002 Lyon', 'sophie.durand@mail.com', '+33 6 78 90 12 34', 'P@ssword123');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(8, 'Moreau', 'Antoine', '8 rue des Acacias, 31000 Toulouse', 'antoine.moreau@mail.com', '+33 6 89 01 23 45', 'MyP@ssword123');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(9, 'Lecomte', 'Marie', '17 boulevard des Peupliers, 59000 Lille', 'marie.lecomte@mail.com', '+33 6 90 12 34 56', 'P@ssw0rd!');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(10, 'Faure', 'Nicolas', '30 rue des Oliviers, 13000 Marseille', 'nicolas.faure@mail.com', '+33 6 01 23 45 67', 'MyP@ssw0rd!');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(11, 'Lambert', 'Anne', '3 avenue des Tulipes, 75002 Paris', 'anne.lambert@mail.com', '+33 6 12 34 56 78', 'Passw0rd123$');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(12, 'Dupuis', 'Thomas', '15 rue des Cerisiers, 69001 Lyon', 'thomas.dupuis@mail.com', '+33 6 23 45 67 89', 'Mypassw0rd$');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(13, 'Lefebvre', 'Marie', '12 rue de la Paix, 75001 Paris', 'marie.lefebvre@mail.com', '01 23 45 67 89', 'Mdp1234$');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(14, 'Girard', 'Luc', '15 avenue des Champs-Élysées, 75008 Paris', 'luc.girard@mail.com', '01 23 45 67 90', 'Motdepasse1$');

INSERT INTO Client (ID, nom, prenom, AdressePostal, Mail, Telephone, MotdePasse) VALUES 
(15, 'Dubois', 'Sophie', '20 rue de Rivoli, 75001 Paris', 'sophie.dubois@mail.com', '01 23 45 67 91', 'Motdepasse2$');


--Insertion des souscriptions
INSERT INTO Souscription(ID,IdClient,IdAbonnement,DateDebSouscription,DateFinSouscription) 
VALUES (1,1,1,TO_DATE('2021-10-11', 'YYYY-MM-DD'),ADD_MONTHS(TO_DATE('2021-10-11', 'YYYY-MM-DD'), 1));

INSERT INTO Souscription(ID,IdClient,IdAbonnement,DateDebSouscription,DateFinSouscription) 
VALUES (2,4,3,TO_DATE('2022-01-01', 'YYYY-MM-DD'),ADD_MONTHS(TO_DATE('2021-10-11', 'YYYY-MM-DD'), 2));

INSERT INTO Souscription(ID,IdClient,IdAbonnement,DateDebSouscription,DateFinSouscription) 
VALUES (3,6,1,TO_DATE('2023-11-09', 'YYYY-MM-DD'),ADD_MONTHS(TO_DATE('2022-11-09', 'YYYY-MM-DD'), 1));

INSERT INTO Souscription(ID,IdClient,IdAbonnement,DateDebSouscription,DateFinSouscription) 
VALUES (4,8,3,TO_DATE('2023-07-21', 'YYYY-MM-DD'),ADD_MONTHS(TO_DATE('2023-07-21', 'YYYY-MM-DD'), 1));

INSERT INTO Souscription(ID,IdClient,IdAbonnement,DateDebSouscription,DateFinSouscription) 
VALUES (5,11,2,TO_DATE('2023-05-10', 'YYYY-MM-DD'),ADD_MONTHS(TO_DATE('2023-05-10', 'YYYY-MM-DD'), 1));

INSERT INTO Souscription(ID,IdClient,IdAbonnement,DateDebSouscription,DateFinSouscription) 
VALUES (6,13,2,TO_DATE('2023-06-30', 'YYYY-MM-DD'),ADD_MONTHS(TO_DATE('2023-06-30', 'YYYY-MM-DD'), 1));

INSERT INTO Souscription(ID,IdClient,IdAbonnement,DateDebSouscription,DateFinSouscription) 
VALUES (7,15,2,TO_DATE('2023-01-01', 'YYYY-MM-DD'),ADD_MONTHS(TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1));



--fais avant le insert.sql donc les données en lien avec le contenu ou les saisons sont purement fictives 
--ce sera corrigé quand le insert sera fini
--Insertion des achats

INSERT INTO Achat(id,IdClient,ReferenceContenu,IdFormat,IdMIME,Version,prix,dateAchat)
VALUE (1,5,'Contenu1',1,1,'HD',15.99,TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO Achat(id,IdClient,ReferenceContenu,IdFormat,IdMIME,Version,prix,dateAchat)
VALUE (2,10,'Contenu2',2,2,'SD',9.99,TO_DATE('2023-02-05', 'YYYY-MM-DD'));

INSERT INTO Achat(id,IdClient,ReferenceContenu,IdFormat,IdMIME,Version,prix,dateAchat)
VALUE (3,9,'Contenu3',1,1,'HD',19.99,TO_DATE('2023-03-15', 'YYYY-MM-DD'));

INSERT INTO Achat(id,IdClient,ReferenceContenu,IdFormat,IdMIME,Version,prix,dateAchat)
VALUE (4,14,'Contenu4',3,3,'SD',7.99,TO_DATE('2023-04-20', 'YYYY-MM-DD'));

--Insertion des achat de saisons
INSERT INTO AchatSaison (id, IdClient, IdSaison, IdFormat, IdMIME, Version, prix, dateAchat)
VALUES (1, 1, 3, 1, 1, 'HD', 25.99, TO_DATE('2023-04-30', 'YYYY-MM-DD'));

INSERT INTO AchatSaison (id, IdClient, IdSaison, IdFormat, IdMIME, Version, prix, dateAchat)
VALUES (2, 7, 3, 1, 1, 'SD', 19.99, TO_DATE('2023-05-01', 'YYYY-MM-DD'));

INSERT INTO AchatSaison (id, IdClient, IdSaison, IdFormat, IdMIME, Version, prix, dateAchat)
VALUES (3, 10, 1, 2, 2, 'SD', 14.99, TO_DATE('2023-05-02', 'YYYY-MM-DD'));


--Insertion des Locations
INSERT INTO Location(Id,IdClient,ReferenceContenu,Version,DateDeb,DateFin,Prix)
VALUES (1, 2, 'Contenu1', 'HD', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-31', 'YYYY-MM-DD'), 10.99);

INSERT INTO Location(Id,IdClient,ReferenceContenu,Version,DateDeb,DateFin,Prix)
VALUES (2, 3, 'Contenu2', 'SD', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), 5.99);

INSERT INTO Location(Id,IdClient,ReferenceContenu,Version,DateDeb,DateFin,Prix)
VALUES (3, 4, 'Contenu3', 'UHD', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'), 12.99);


--Insertion des Location Saison
INSERT INTO LocationSaison(Id, IdClient, saison_id, Version, DateDeb, DateFin, Prix)
VALUES (1, 12, 1, 'HD', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-08', 'YYYY-MM-DD'), 20.99);

INSERT INTO LocationSaison(Id, IdClient, saison_id, Version, DateDeb, DateFin, Prix)
VALUES (2, 11, 1, 'SD', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-22', 'YYYY-MM-DD'), 15.99);

INSERT INTO LocationSaison(Id, IdClient, saison_id, Version, DateDeb, DateFin, Prix)
VALUES (3, 3, 2, 'HD', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-08', 'YYYY-MM-DD'), 20.99);

INSERT INTO LocationSaison(Id, IdClient, saison_id, Version, DateDeb, DateFin, Prix)
VALUES (4, 10, 2, 'SD', TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2023-07-22', 'YYYY-MM-DD'), 15.99);


--Insertion des locations via abonnement
INSERT INTO ContenuAbonnement (Id, ReferenceContenu, IdSouscription, DateDebLoca, DateFinLoca)
VALUES (1, 'Contenu1', 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-31', 'YYYY-MM-DD'));

INSERT INTO ContenuAbonnement (Id, ReferenceContenu, IdSouscription, DateDebLoca, DateFinLoca)
VALUES (2, 'Contenu2', 2, TO_DATE('2023-01-11', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'));

INSERT INTO ContenuAbonnement (Id, ReferenceContenu, IdSouscription, DateDebLoca, DateFinLoca)
VALUES (3, 'Contenu3', 3, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-07-31', 'YYYY-MM-DD'));

INSERT INTO ContenuAbonnement (Id, ReferenceContenu, IdSouscription, DateDebLoca, DateFinLoca)
VALUES (4, 'Contenu4', 3, TO_DATE('2023-08-19', 'YYYY-MM-DD'), TO_DATE('2023-07-31', 'YYYY-MM-DD'));

INSERT INTO ContenuAbonnement (Id, ReferenceContenu, IdSouscription, DateDebLoca, DateFinLoca)
VALUES (5, 'Contenu5', 3, TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2023-07-31', 'YYYY-MM-DD'));
