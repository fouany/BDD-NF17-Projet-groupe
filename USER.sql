--Creation des USERS
CREATE USER UnAdherent;
CREATE USER UnMembrePersonnel;

GRANT SELECT ON Livre,Film,EnregistrementMusical,vExemplaire TO UnAdherent;

GRANT ALL PRIVILEGES ON Livre TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Film TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON EnregistrementMusical TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Contributeur TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Langue TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Exemplaire TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Pret TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Sanction TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Joue TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Adhesion TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Adherent TO UnMembrePersonnel;
GRANT ALL PRIVILEGES ON Realisation TO UnMembrePersonnel;

GRANT SELECT ON vnbEmpruntsEnregistrement TO UnMembrePersonnel;
GRANT SELECT ON vnbEmpruntsFilm TO UnMembrePersonnel;
GRANT SELECT ON vnbEmpruntsLivre TO UnMembrePersonnel;
GRANT SELECT ON vLivreFilmMemeCode TO UnMembrePersonnel;
GRANT SELECT ON vFilmEnregistrementMemeCode TO UnMembrePersonnel;
GRANT SELECT ON vadherentPbSanction TO UnMembrePersonnel;
GRANT SELECT ON nbSanctionsTropEleve TO UnMembrePersonnel;
GRANT SELECT ON vEnregistrementLivreMemeCode TO UnMembrePersonnel;
GRANT SELECT ON vadhe_ok TO UnMembrePersonnel;