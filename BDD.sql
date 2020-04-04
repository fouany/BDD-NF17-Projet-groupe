DROP TABLE IF EXISTS Joue CASCADE;
DROP TABLE IF EXISTS Realisation CASCADE;
DROP TABLE IF EXISTS Sanction CASCADE;
DROP TABLE IF EXISTS Pret CASCADE;
DROP TABLE IF EXISTS Exemplaire CASCADE;
DROP TABLE IF EXISTS EnregistrementMusical CASCADE;
DROP TABLE IF EXISTS Film CASCADE;
DROP TABLE IF EXISTS Livre CASCADE;
DROP TABLE IF EXISTS Adhesion CASCADE;
DROP TABLE IF EXISTS Contributeur CASCADE;
DROP TABLE IF EXISTS Adherent CASCADE;
DROP TABLE IF EXISTS Langue CASCADE;
DROP TABLE IF EXISTS MembrePersonnel CASCADE;

CREATE TABLE  Adherent  (
  numCarte NUMERIC PRIMARY KEY,
  telephone NUMERIC UNIQUE,
  dateNaiss DATE,
  loginPret VARCHAR(10) NOT NULL,
  mdpPret VARCHAR NOT NULL,
  blacklist BOOLEAN NOT NULL,
  nom VARCHAR(30) NOT NULL,
  prenom VARCHAR(30) NOT NULL,
  adresse VARCHAR(30),
  mail VARCHAR(30) NOT NULL
);

CREATE TABLE MembrePersonnel (
  loginAdm VARCHAR(10) PRIMARY KEY,
  mdpAdm VARCHAR NOT NULL,
  nom VARCHAR(30) NOT NULL,
  prenom VARCHAR(30) NOT NULL,
  adresse VARCHAR(30),
  mail VARCHAR(30) NOT NULL
);

CREATE TABLE Adhesion (
  id NUMERIC PRIMARY KEY ,
  dateDebut DATE NOT NULL,
  dateFin DATE NOT NULL,
  adherent NUMERIC NOT NULL,
  FOREIGN KEY (adherent) REFERENCES Adherent(numCarte)
);


CREATE TABLE Contributeur(
  id NUMERIC PRIMARY KEY,
  nom VARCHAR NOT NULL,
  prenom VARCHAR NOT NULL,
  dateNaiss DATE,
  Nationalite VARCHAR NOT NULL
);

CREATE TABLE Langue(
  nom VARCHAR PRIMARY KEY
);


CREATE TABLE Livre(
  code NUMERIC PRIMARY KEY,
  titre VARCHAR NOT NULL,
  dateApparition DATE,
  editeur VARCHAR,
  genre VARCHAR,
  codeClassification VARCHAR UNIQUE NOT NULL,
  longueur NUMERIC,
  code_isbn NUMERIC UNIQUE NOT NULL,
  langue VARCHAR NOT NULL,
  auteur NUMERIC NOT NULL,
  editeurLivre NUMERIC NOT NULL,
  FOREIGN KEY (editeurLivre) REFERENCES Contributeur(id),
  FOREIGN KEY (auteur) REFERENCES Contributeur(id),
  FOREIGN KEY (langue) REFERENCES Langue(nom)
);

CREATE TABLE EnregistrementMusical(
  code NUMERIC PRIMARY KEY,
  titre VARCHAR NOT NULL,
  dateApparition DATE,
  editeur VARCHAR,
  genre VARCHAR,
  codeClassification VARCHAR UNIQUE NOT NULL,
  longueur NUMERIC,
  compositeur NUMERIC NOT NULL,
  interprete NUMERIC NOT NULL,
  FOREIGN KEY (compositeur) REFERENCES Contributeur(id),
  FOREIGN KEY (interprete) REFERENCES Contributeur(id)
);

CREATE TABLE Film(
  code NUMERIC PRIMARY KEY,
  titre VARCHAR NOT NULL,
  dateApparition DATE,
  editeur VARCHAR,
  genre VARCHAR,
  codeClassification VARCHAR UNIQUE NOT NULL,
  longueur NUMERIC,
  synopsis VARCHAR,
  realisateur NUMERIC NOT NULL,
  FOREIGN KEY (realisateur) REFERENCES Contributeur(id)
);

CREATE TABLE Exemplaire(
  id NUMERIC UNIQUE NOT NULL PRIMARY KEY,
  etat VARCHAR NOT NULL CHECK (etat IN ('neuf','bon','abime')),
  disponibilite VARCHAR NOT NULL CHECK (disponibilite IN ('pret','disponible','perdu')),
  codeLivre NUMERIC,
  codeFilm NUMERIC,
  codeEnregistrement NUMERIC ,
  FOREIGN KEY (codeLivre) REFERENCES Livre(code),
  FOREIGN KEY (codeFilm) REFERENCES Film(code),
  FOREIGN KEY (codeEnregistrement) REFERENCES EnregistrementMusical(code),
  CHECK ((Exemplaire.codeLivre IS NOT NULL AND Exemplaire.codeFilm IS NULL AND Exemplaire.codeEnregistrement IS NULL)
  OR
  (Exemplaire.codeLivre IS NULL AND Exemplaire.codeFilm IS NOT NULL AND Exemplaire.codeEnregistrement IS NULL)
  OR
  (Exemplaire.codeLivre IS NULL AND Exemplaire.codeFilm IS NULL AND Exemplaire.codeEnregistrement IS NOT NULL))
);
-- Le CHECK sert à vérifier qu'un exemplaire est forcément lié à une ressource
CREATE TABLE Realisation(
  codeFilm NUMERIC NOT NULL,
  langue VARCHAR NOT NULL,
  FOREIGN KEY (langue) REFERENCES Langue(nom),
  FOREIGN KEY (codeFilm) REFERENCES Film(code),
  PRIMARY KEY (codeFilm,langue)
);

CREATE TABLE Pret (
  id NUMERIC PRIMARY KEY,
  dateDebut DATE NOT NULL,
  duree NUMERIC NOT NULL,
  rendu BOOLEAN NOT NULL DEFAULT FALSE,
  exemplaire NUMERIC NOT NULL,
  adherent NUMERIC NOT NULL,
  FOREIGN KEY (exemplaire) REFERENCES Exemplaire(id),
  FOREIGN KEY (adherent) REFERENCES Adherent(numCarte)
);

CREATE TABLE Joue(
  acteur NUMERIC NOT NULL,
  codeFilm NUMERIC NOT NULL,
  FOREIGN KEY (codeFilm) REFERENCES Film(code),
  FOREIGN KEY (acteur) REFERENCES Contributeur(id),
  PRIMARY KEY (codeFilm,acteur)
);

CREATE TABLE Sanction(
  id NUMERIC PRIMARY KEY ,
  description VARCHAR,
  type VARCHAR NOT NULL CHECK (type IN ('Retard','Deterioration','Perte')),
  datefinsanction DATE,
  remboursement BOOLEAN,
  membre VARCHAR(10) NOT NULL,
  adherent NUMERIC NOT NULL,
  pret NUMERIC NOT NULL,
  FOREIGN KEY (adherent) REFERENCES Adherent(numCarte),
  FOREIGN KEY (membre) REFERENCES MembrePersonnel(loginAdm),
  FOREIGN KEY (pret) REFERENCES Pret(id),
  CHECK ((type = 'Retard' AND datefinsanction IS NOT NULL AND remboursement IS NULL) OR ((type ='Deterioration' OR type = 'Perte') AND datefinsanction IS NULL AND remboursement IS NOT NULL))
);

INSERT INTO Adherent VALUES (1,'0123456789',to_date('19990520','YYYYMMDD'),'Micrapau','mdp1',FALSE,'Richard','Jean','28 rue Roger Couttolenc','Jean.Richard@mail.com');
INSERT INTO Adherent VALUES (2,'0987654321',TO_DATE('19710623','YYYYMMDD'),'MathKoal','mdp2',FALSE,'Koala','Mathieu','12 rue Roger Vivenel','Mathieu.Koala@mail.com');
INSERT INTO Adherent VALUES (3,'0425653869',TO_DATE('19580914','YYYYMMDD'),'BenoLuca','mdp3',FALSE,'Benoit','Lucas','15 rue de Paris','Benoit.Lucas@mail.com');
INSERT INTO Adherent VALUES (4,'0523232323',TO_DATE('19580914','YYYYMMDD'),'Duboisju','mdp4',FALSE,'Dubois','Jules','1 rue des Sablons','Dubois.Jules@mail.com');
INSERT INTO Adherent VALUES (5,'0171568926',TO_DATE('20110214','YYYYMMDD'),'FranPatr','mdp5',FALSE,'Francis','Patrick','126 rue Winston Churchill','Francis.Patrick@mail.com');

INSERT INTO MembrePersonnel VALUES ('PassePar','mdp1','Partout','Passe','1 Rue du Port à bateaux','Partout.Passe@mail.com');
INSERT INTO MembrePersonnel VALUES ('PereFour','mdp2','Fourras','Pere','2 Rue du Port à bateaux','Fourras.Pere@mail.com');
INSERT INTO MembrePersonnel VALUES ('MoniqueF','mdp3','Monique','Felindra','3 Rue du Port à bateaux','Monique.Felindra@mail.com');
INSERT INTO MembrePersonnel VALUES ('PasseMur','mdp4','Muraille','Passe','4 Rue du Port à bateaux','Muraille.Passe@mail.com');

INSERT INTO Adhesion VALUES (1,TO_DATE('20180101','YYYYMMDD'),TO_DATE('20190101','YYYYMMDD'),1);
INSERT INTO Adhesion VALUES (2,TO_DATE('20180101','YYYYMMDD'),TO_DATE('20190101','YYYYMMDD'),2);
INSERT INTO Adhesion VALUES (3,TO_DATE('20180101','YYYYMMDD'),TO_DATE('20190101','YYYYMMDD'),3);
INSERT INTO Adhesion VALUES (4,TO_DATE('20190101','YYYYMMDD'),TO_DATE('20200101','YYYYMMDD'),1);
INSERT INTO Adhesion VALUES (5,TO_DATE('20190101','YYYYMMDD'),TO_DATE('20200101','YYYYMMDD'),2);
INSERT INTO Adhesion VALUES (6,TO_DATE('20190101','YYYYMMDD'),TO_DATE('20200101','YYYYMMDD'),1);
INSERT INTO Adhesion VALUES (7,TO_DATE('20170101','YYYYMMDD'),TO_DATE('20180101','YYYYMMDD'),1);
INSERT INTO Adhesion VALUES (8,TO_DATE('20190101','YYYYMMDD'),TO_DATE('20200101','YYYYMMDD'),4);
INSERT INTO Adhesion VALUES (9,TO_DATE('20200101','YYYYMMDD'),TO_DATE('2021101','YYYYMMDD'),1);
INSERT INTO Adhesion VALUES (10,TO_DATE('20200101','YYYYMMDD'),TO_DATE('20210101','YYYYMMDD'),3);
INSERT INTO Adhesion VALUES (11,TO_DATE('20200101','YYYYMMDD'),TO_DATE('20210101','YYYYMMDD'),4);

INSERT INTO Contributeur VALUES (1,'Zola','Emile',TO_DATE('19020929','YYYYMMDD'),'Francais');
INSERT INTO Contributeur VALUES (2,'De Balzac','Honore',TO_DATE('17990101','YYYYMMDD'),'Francais');
INSERT INTO Contributeur VALUES (3,'DAnnunzio','Gabriele',TO_DATE('18630101','YYYYMMDD'),'Italien');
INSERT INTO Contributeur VALUES (4,'Hugo','Victor',TO_DATE('18700101','YYYYMMDD'),'Francais');
INSERT INTO Contributeur VALUES (5,'M','Black',TO_DATE('19841227','YYYYMMDD'),'Francais');
INSERT INTO Contributeur VALUES (6,'SpielBerg','Steven',TO_DATE('19900114','YYYYMMDD'),'Américain');
INSERT INTO Contributeur VALUES (7,'Cameron','James',TO_DATE('19880228','YYYYMMDD'),'Américain');
INSERT INTO Contributeur VALUES (8,'Goldblum','Jeff',TO_DATE('19521022','YYYYMMDD'),'Américain');
INSERT INTO Contributeur VALUES (9,'Dern','Laura',TO_DATE('19740212','YYYYMMDD'),'Américain');
INSERT INTO Contributeur VALUES (10,'Peck','Bob',TO_DATE('19751114','YYYYMMDD'),'Américain');
INSERT INTO Contributeur VALUES (11,'Richards','Ariana',TO_DATE('19650531','YYYYMMDD'),'Américain');
INSERT INTO Contributeur VALUES (12,'Larousse','Dictionnaire',TO_DATE('18000101','YYYYMMDD'),'Francais');

INSERT INTO Langue VALUES('Francais');
INSERT INTO Langue VALUES('Anglais');
INSERT INTO Langue VALUES('Italien');
INSERT INTO Langue VALUES('Espagnol');


INSERT INTO Livre(code,titre,dateApparition,genre,codeClassification,code_isbn,langue,auteur,editeurLivre) VALUES (1,'Germinal',TO_DATE('18850101','YYYYMMDD'),'Roman','14226',1,'Francais',1,12);
INSERT INTO Livre(code,titre,dateApparition,genre,codeClassification,code_isbn,langue,auteur,editeurLivre) VALUES (2,'Lassomoir',TO_DATE('18760101','YYYYMMDD'),'Roman','14227',2,'Francais',1,12);

INSERT INTO ENREGISTREMENTMUSICAL(code,titre,dateApparition,codeClassification,longueur,compositeur,interprete) VALUES (3,'Sur ma route',TO_DATE('20140324','YYYYMMDD'),'24226',192,5,5);
INSERT INTO ENREGISTREMENTMUSICAL(code,titre,dateApparition,codeClassification,longueur,compositeur,interprete) VALUES (4,'Je suis chez moi',TO_DATE('20170814','YYYYMMDD'),'24227',216,5,5);

INSERT INTO Film(code,titre,dateApparition,codeClassification,longueur,synopsis,realisateur) VALUES (5,'JurassicPark',TO_DATE('19930228','YYYYMMDD'),'34226',127,'Un film avec des dinosaures',6);
INSERT INTO Film(code,titre,dateApparition,codeClassification,longueur,synopsis,realisateur) VALUES (6,'Laguerredesmondes',TO_DATE('20050228','YYYYMMDD'),'34227',118,'Un film avec des mondes',6);
INSERT INTO Film(code,titre,dateApparition,codeClassification,longueur,synopsis,realisateur) VALUES (1,'Laguerredesmondes',TO_DATE('20050228','YYYYMMDD'),'34228',126,'Un film avec des mondes',6);

INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (1,'neuf','disponible',1);
INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (2,'bon','disponible',1);
INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (3,'neuf','disponible',2);
INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (4,'bon','perdu',1);

INSERT INTO Exemplaire(id,etat,disponibilite,codeFilm) VALUES (5,'neuf','disponible',5);
INSERT INTO Exemplaire(id,etat,disponibilite,codeFilm) VALUES (6,'bon','disponible',5);
INSERT INTO Exemplaire(id,etat,disponibilite,codeFilm) VALUES (7,'bon','disponible',6);

INSERT INTO Exemplaire(id,etat,disponibilite,codeEnregistrement) VALUES (8,'bon','disponible',3);
INSERT INTO Exemplaire(id,etat,disponibilite,codeEnregistrement) VALUES (9,'bon','disponible',3);


INSERT INTO Realisation VALUES (5,'Anglais');
INSERT INTO Realisation VALUES (5,'Francais');
INSERT INTO Realisation VALUES (5,'Espagnol');
INSERT INTO Realisation VALUES (6,'Anglais');
INSERT INTO Realisation VALUES (6,'Francais');

INSERT INTO Joue VALUES (8,5);
INSERT INTO Joue VALUES (9,5);
INSERT INTO Joue VALUES (10,5);
INSERT INTO Joue VALUES (11,5);


INSERT INTO Pret VALUES (1,TO_DATE('20200401','YYYYMMDD'),25,FALSE,1,1);
INSERT INTO Pret VALUES (2,TO_DATE('20200401','YYYYMMDD'),25,FALSE,3,1);
INSERT INTO Pret VALUES (3,TO_DATE('20200401','YYYYMMDD'),25,FALSE,4,1);
INSERT INTO Pret VALUES (4,TO_DATE('20200401','YYYYMMDD'),25,FALSE,5,1);
INSERT INTO Pret VALUES (5,TO_DATE('20200401','YYYYMMDD'),25,FALSE,7,1);
INSERT INTO Pret VALUES (6,TO_DATE('20200401','YYYYMMDD'),25,TRUE,8,1);
INSERT INTO Pret VALUES (7,TO_DATE('20190101','YYYYMMDD'),25,FALSE,2,2);
INSERT INTO Pret VALUES (8,TO_DATE('20200401','YYYYMMDD'),25,FALSE,8,2);
INSERT INTO Pret VALUES (9,TO_DATE('20200320','YYYYMMDD'),25,FALSE,9,4);
INSERT INTO Pret VALUES (10,TO_DATE('20200320','YYYYMMDD'),25,FALSE,6,4);

INSERT INTO Sanction (id,description,type,datefinsanction,membre,adherent,pret) VALUES (1,'Hopela Un retard pour toi de la part de PassePartout','Retard',TO_DATE('20200405','YYYYMMDD'),'PassePar',1,1);
INSERT INTO Sanction (id,description,type,datefinsanction,membre,adherent,pret) VALUES (2,'"Hopela Un retard pour toi de la part de PassePartout"','Retard',TO_DATE('20200405','YYYYMMDD'),'PassePar',1,1);
INSERT INTO Sanction (id,description,type,datefinsanction,membre,adherent,pret) VALUES (3,'"Hopela Un retard pour toi de la part de PassePartout','Retard',TO_DATE('20200405','YYYYMMDD'),'PassePar',1,1);

--Vue pour vérifier que les adhérents peuvent emprunter
CREATE VIEW Nb_Pret (numCarte, nb)
AS
SELECT Adherent.numCarte, COUNT(*) AS Nb_Pret FROM Adherent, Pret
WHERE Adherent.numCarte=Pret.adherent
AND Pret.rendu=false
GROUP BY Adherent.numCarte;

CREATE VIEW adhe_ok (numcarte) AS
SELECT a.numcarte FROM  (((adherent a LEFT JOIN sanction s ON a.numCarte=s.adherent)
LEFT JOIN pret p ON a.numCarte=p.adherent) JOIN adhesion ad ON a.numCarte=ad.adherent)LEFT JOIN  Nb_pret n ON  a.numCarte=n.numCarte
WHERE a.blacklist=false
AND (s.remboursement IS NULL OR s.remboursement=true )
AND (s.datefinsanction IS NULL OR s.datefinsanction<current_date)
AND ad.datefin>current_date
AND (n.nb IS NULL OR n.nb<5)
GROUP BY a.numCarte;


-- Vue pour vérifier qu'il y a au plus deux sanctions par prêt :
CREATE VIEW nbSanctionsTropEleve(idPret,Nombre) AS
SELECT p.id,count(s.id) AS Nombre FROM Pret p LEFT JOIN Sanction s ON p.id = s.Pret GROUP BY p.id HAVING count(s.id) > 2;


-- créer une vue pour vérifier que les adhérents qui subissent des sanctions sont bien ceux qui le méritent dans Sanction -> pret . adherent  = Sanction -> Adherent
CREATE VIEW adherentSanctionAucuneRaison(idAdherent)AS
SELECT Sanction.adherent FROM Pret,Sanction WHERE Sanction.pret = Pret.id AND Sanction.adherent <> Pret.adherent GROUP BY Sanction.adherent;


-- C1, C2 ET C3 sont trois vues qui doivent être vides
CREATE VIEW LivreFilmMemeCode(codeLivre) AS
SELECT Livre.code FROM Livre, Film WHERE Livre.code = Film.code GROUP BY Livre.code;
CREATE VIEW FilmEnregistrementMemeCode(codeFilm) AS
SELECT Film.code FROM EnregistrementMusical, Film WHERE EnregistrementMusical.code = Film.code GROUP BY Film.code;
CREATE VIEW EnregistrementLivreMemeCode(codeEnregistrementMusical) AS
SELECT EnregistrementMusical.code FROM Livre, EnregistrementMusical WHERE EnregistrementMusical.code = Livre.code GROUP BY EnregistrementMusical.code ;

-- Ces 3 vues servent à compter le nombre d'emptunts d'une ressource
CREATE VIEW nbEmpruntsLivre AS
SELECT codeLivre, COUNT(*) AS NbEmprunts FROM Exemplaire,Pret
WHERE Exemplaire.codeLivre IS NOT NULL
AND Exemplaire.id=Pret.exemplaire
GROUP BY Exemplaire.codeLivre;

CREATE VIEW nbEmpruntsFilm AS
SELECT codeFilm, COUNT(*) AS NbEmprunts FROM Exemplaire,Pret
WHERE Exemplaire.codeFilm IS NOT NULL
AND Exemplaire.id=Pret.exemplaire
GROUP BY Exemplaire.codeFilm;

CREATE VIEW nbEmpruntsEnregistrement AS
SELECT codeEnregistrement, COUNT(*) AS NbEmprunts FROM Exemplaire,Pret
WHERE Exemplaire.codeEnregistrement IS NOT NULL
AND Exemplaire.id=Pret.exemplaire
GROUP BY Exemplaire.codeEnregistrement;
