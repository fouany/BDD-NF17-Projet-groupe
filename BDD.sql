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
  numCarte NUMERIC(10) PRIMARY KEY,
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
  acteur NUMERIC UNIQUE NOT NULL,
  codeFilm NUMERIC UNIQUE NOT NULL,
  FOREIGN KEY (codeFilm) REFERENCES Film(code),
  FOREIGN KEY (acteur) REFERENCES Contributeur(id),
  PRIMARY KEY (codeFilm,acteur)
);

CREATE TABLE Sanction(
  id NUMERIC PRIMARY KEY ,
  description VARCHAR,
  type VARCHAR NOT NULL CHECK (type IN ('Retard','Deterioration','Perte')),
  nbJours NUMERIC,
  remboursement BOOLEAN,
  membre VARCHAR(10) NOT NULL,
  adherent NUMERIC NOT NULL,
  pret NUMERIC NOT NULL,
  FOREIGN KEY (adherent) REFERENCES Adherent(numCarte),
  FOREIGN KEY (membre) REFERENCES MembrePersonnel(loginAdm),
  FOREIGN KEY (pret) REFERENCES Pret(id),
  CHECK ((type = 'Retard' AND nbJours IS NOT NULL AND nbJours>=0 AND remboursement IS NULL) OR ((type ='Deterioration' OR type = 'Perte') AND nbJours IS NULL AND remboursement IS NOT NULL))
);
