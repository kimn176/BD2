
CREATE TABLE Age (
  ID INT PRIMARY KEY,
  Classification VARCHAR(10)
);


 CREATE TABLE Contenu (
  id VARCHAR(255) PRIMARY KEY,
  titre VARCHAR(100),
  Description VARCHAR(255),
  theme VARCHAR(50),
  mots_cles VARCHAR(255),
  lienBA VARCHAR(255) CHECK (lienBA LIKE 'http%'),
  evalutation FLOAT CHECK (evalutation<=5.0),
  age_id INT,
  paysprod VARCHAR(50),
  anneeprod varchar(20) CHECK (cast(anneeprod as integer ) > 1900),
  constraints fk_contenu_age FOREIGN KEY (age_id) REFERENCES Age(id)
);

  create table personne 
  (
  prenom_nom varchar(200) primary key 
  );



 create table realise 
 (
 contenu varchar(255) ,
 personne varchar (200) , 
 constraints fk_realise_contenu FOREIGN KEY (contenu) REFERENCES contenu(id),
 constraints fk_realise_personne FOREIGN KEY (personne) REFERENCES personne(prenom_nom),
 primary key (contenu,personne)
 );


create table jeunesse 
(contenu varchar(255) primary key  , 
duree varchar(26)  , 
constraints fk_jeunesse_contenu foreign key (contenu) references contenu(id)

);



create table serie 
(contenu varchar(255) primary key  , 
nb_saison varchar(26)  , 
constraints fk_serie_contenu foreign key (contenu) references contenu(id)

);




create table divertissement 
(contenu varchar(255) primary key  , 
duree varchar(26)  , 
constraints fk_divertissement_contenu foreign key (contenu) references contenu(id)

);



create table cinema 
(contenu varchar(255) primary key  , 
duree varchar(26)  , 
constraints fk_cinema_contenu foreign key (contenu) references contenu(id)

);




 create table acteurscinema 
 (
 contenu varchar(255) ,
 personne varchar (200) , 
 constraints fk_acteur_contenu FOREIGN KEY (contenu) REFERENCES cinema(contenu),
 constraints fk_acteur_personne FOREIGN KEY (personne) REFERENCES personne(prenom_nom),
 primary key (contenu,personne)
 );

 create table scenaristescinema
 (
 contenu varchar(255) ,
 personne varchar (200) , 
 FOREIGN KEY (contenu) REFERENCES cinema(contenu),
 FOREIGN KEY (personne) REFERENCES personne(prenom_nom),
 primary key (contenu,personne)
 );

create table compose
(
contenu varchar(255) , 
personne  varchar (255) ,
constraints fk_compose_jeunesse foreign key (contenu) references jeunesse(contenu),
constraints fk_compose_personne foreign key (personne) references personne(prenom_nom),
primary key (contenu , personne )
)
;
create table scenarise
(
contenu varchar(255) , 
personne  varchar (255) ,
constraints fk_scenarise_jeunesse foreign key (contenu) references jeunesse(contenu),
constraints fk_scenarise_personne foreign key (personne) references personne(prenom_nom),
primary key (contenu , personne )
)
;


create table acteursserie
(
contenu varchar(255) , 
personne  varchar (255) ,
constraints fk_acteursserie_serie foreign key (contenu) references serie(contenu),
constraints fk_acteursserie_personne foreign key (personne) references personne(prenom_nom),
primary key (contenu , personne )
)
;





create table interprete
(
contenu varchar(255) , 
personne  varchar (255) ,
constraints fk_interprete_divertissement foreign key (contenu) references divertissement(contenu),
constraints fk_interprete_personne foreign key (personne) references personne(prenom_nom),
primary key (contenu , personne )
);

create table metteursenscene
(
contenu varchar(255) , 
personne  varchar (255) ,
constraints fk_metsenscene_divertissement foreign key (contenu) references divertissement(contenu),
constraints fk_metsenscene_personne foreign key (personne) references personne(prenom_nom),
primary key (contenu , personne )
);
create table secnaristedivertissement
(
contenu varchar(255) , 
personne  varchar (255) ,
constraints fk_scenariste_divertissement foreign key (contenu) references divertissement(contenu),
constraints fk_scenariste_personne foreign key (personne) references personne(prenom_nom),
primary key (contenu , personne )
);


CREATE TABLE Client (
  ID INT PRIMARY KEY,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  AdressePostal VARCHAR(255),
  Mail VARCHAR(255),
  Telephone VARCHAR(255),
  MotdePasse VARCHAR(255) CONSTRAINT chk_MotdePasse CHECK (LENGTH(MotdePasse) >= 8 AND MotdePasse LIKE '%[0-9]%' AND MotdePasse LIKE '%[A-Z]%' AND MotdePasse LIKE '%[^a-zA-Z0-9]%')
);


CREATE TABLE Format (
  ID INT PRIMARY KEY,
  nom VARCHAR(255),
  extension VARCHAR(255)
);


 CREATE TABLE MIME (
  ID INT PRIMARY KEY,
  nom VARCHAR(255),
  logiciel VARCHAR(255)
);




  CREATE TABLE Achat (
  id INT,
  IdClient INT,
  ReferenceContenu VARCHAR(255),
  IdFormat INT,
  IdMIME INT,
  Version VARCHAR(255),
  prix FLOAT,
  dateAchat DATE,
  constraints pk_achat PRIMARY KEY (id,IdClient, ReferenceContenu, IdFormat, IdMIME),
  constraints fk_achat_client FOREIGN KEY (IdClient) REFERENCES Client(Id),
  constraints fk_achat_contenu FOREIGN KEY (ReferenceContenu) REFERENCES Contenu(id),
  constraints fk_achat_format FOREIGN KEY (IdFormat) REFERENCES Format(id),
  constraints fk_achat_mime FOREIGN KEY (IdMIME) REFERENCES MIME(id)
);



CREATE TABLE Saison 
(  
  idsaison VARCHAR(255) PRIMARY KEY,
  serie varchar(255),
  Description VARCHAR(255),  
  NbEpisode INT,  
  evalClient FLOAT CHECK(evalClient<=5),   
  FOREIGN KEY (serie) REFERENCES Serie(contenu)
);

    create table acteurssaison
(
saison varchar(255) , 
personne  varchar (255) ,
constraints fk_acteurssaison_saison foreign key (saison) references saison(idsaison ),
constraints fk_acteurssaison_personne foreign key (personne) references personne(prenom_nom),
primary key (saison , personne )
)
;

create table realisateurssaison
(
saison varchar(255) , 
personne  varchar (255) ,
constraints fk_realisateurssaison_saison foreign key (saison) references saison(idsaison ),
constraints fk_realisateurssaison_personne foreign key (personne) references personne(prenom_nom),
primary key (saison , personne )
)
;




CREATE TABLE AchatSaison 
(  
  ID INT,  
  IdClient INT,  
  IdSaison VARCHAR(255),  
  IdFormat INT,  
  IdMIME INT,  
  Version VARCHAR(255),  
  prix FLOAT,  
  dateAchat DATE,  
  PRIMARY KEY (ID,IdClient, IdSaison, IdFormat, IdMIME),  
  constraints fk_AchatSaison_client FOREIGN KEY (IdClient) REFERENCES Client(Id),  
  constraints fk_AchatSaison_saison FOREIGN KEY (IdSaison) REFERENCES Saison(idsaison ),  
  constraints fk_AchatSaison_format  FOREIGN KEY (IdFormat) REFERENCES Format(id),  
  constraints fk_AchatSaison_mime FOREIGN KEY (IdMIME) REFERENCES MIME(id)  
);



CREATE TABLE Location (
  ID INT NOT NULL,
  IdClient INT NOT NULL,
  ReferenceContenu VARCHAR(255) NOT NULL,
  Version VARCHAR(255),
  DateDeb DATE,
  DateFin DATE,
  Prix DECIMAL(10, 2),
  PRIMARY KEY (ID, IdClient, ReferenceContenu),
  constraints fk_Location_client FOREIGN KEY (IdClient) REFERENCES Client(Id),
  constraints fk_Location_contenu FOREIGN KEY (ReferenceContenu) REFERENCES Contenu(id)
);





CREATE TABLE LocationSaison (
  ID INT NOT NULL,
  IdClient INT NOT NULL,
  saison_id VARCHAR(255) NOT NULL,
  Reference VARCHAR(255),
  Version VARCHAR(255),
  DateDeb DATE,
  DateFin DATE,
  Prix DECIMAL(10, 2),
  PRIMARY KEY (ID, IdClient, saison_id),
  FOREIGN KEY (IdClient) REFERENCES Client(Id),
  FOREIGN KEY (saison_id) REFERENCES saison(idsaison)
);



CREATE TABLE Abonnement (
  ID INT NOT NULL PRIMARY KEY,
  nom VARCHAR(255),
  maxLocationSimul INT,
  prixMensuel FLOAT,
  MaxJourCine INT,
  MaxJourSeries INT,
  MaxJourJeunesse INT,
  MaxJourDivertissement INT
);


CREATE TABLE Souscription (
  ID INT NOT NULL PRIMARY KEY,
  IdClient INT NOT NULL,
  IdAbonnement INT NOT NULL,
  DateDebSouscription DATE,
  DateFinSouscription DATE,
  constraints fk_Souscription_client FOREIGN KEY (IdClient) REFERENCES Client(Id),
  constraints fk_Souscription_abonnement FOREIGN KEY (IdAbonnement) REFERENCES Abonnement(ID)
);



CREATE TABLE ContenuAbonnement (
  ID INT NOT NULL,
  ReferenceContenu VARCHAR(255) NOT NULL,
  IdSouscription INT NOT NULL,
  DateDebLoca DATE,
  DateFinLoca DATE,
  PRIMARY KEY (ID,ReferenceContenu, IdSouscription),
  constraints fk_ContenuAbonnement_contenu FOREIGN KEY (ReferenceContenu) REFERENCES Contenu(id),
  constraints fk_ContenuAbonnement_Souscription FOREIGN KEY (IdSouscription) REFERENCES Souscription(ID)
);



CREATE TABLE EvalClient (
  Id INT,
  ReferenceContenu VARCHAR(255),
  clientid INT,
  notes FLOAT CHECK (notes <= 5),
  PRIMARY KEY (Id,ReferenceContenu,clientid),
  constraints fk_EvalClient_contenu FOREIGN KEY (ReferenceContenu) REFERENCES Contenu(id),
  constraints fk_EvalClient_client FOREIGN KEY (clientid) REFERENCES Client(id)
);