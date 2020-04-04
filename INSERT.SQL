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

INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (1,'neuf','pret',1);
INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (2,'bon','disponible',1);
INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (3,'neuf','pret',2);
INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (4,'bon','pret',1);
INSERT INTO Exemplaire(id,etat,disponibilite,codeFilm) VALUES (5,'neuf','pret',5);
INSERT INTO Exemplaire(id,etat,disponibilite,codeFilm) VALUES (6,'bon','pret',5);
INSERT INTO Exemplaire(id,etat,disponibilite,codeFilm) VALUES (7,'bon','pret',6);
INSERT INTO Exemplaire(id,etat,disponibilite,codeEnregistrement) VALUES (8,'bon','pret',3);
INSERT INTO Exemplaire(id,etat,disponibilite,codeEnregistrement) VALUES (9,'bon','pret',3);
INSERT INTO Exemplaire(id,etat,disponibilite,codeLivre) VALUES (10,'abime','disponible',1);

INSERT INTO Realisation VALUES (5,'Anglais');
INSERT INTO Realisation VALUES (5,'Francais');
INSERT INTO Realisation VALUES (5,'Espagnol');
INSERT INTO Realisation VALUES (6,'Anglais');
INSERT INTO Realisation VALUES (6,'Francais');

INSERT INTO Joue VALUES (8,5);
INSERT INTO Joue VALUES (9,5);
INSERT INTO Joue VALUES (10,5);
INSERT INTO Joue VALUES (11,5);


INSERT INTO Pret VALUES (1,TO_DATE('20200401','YYYYMMDD'),2,FALSE,1,1);
INSERT INTO Pret VALUES (2,TO_DATE('20200401','YYYYMMDD'),2,FALSE,3,1);
INSERT INTO Pret VALUES (3,TO_DATE('20200401','YYYYMMDD'),25,FALSE,4,1);
INSERT INTO Pret VALUES (4,TO_DATE('20200401','YYYYMMDD'),25,FALSE,5,1);
INSERT INTO Pret VALUES (5,TO_DATE('20200401','YYYYMMDD'),25,FALSE,7,1);
INSERT INTO Pret VALUES (6,TO_DATE('20200401','YYYYMMDD'),25,TRUE,8,1);
INSERT INTO Pret VALUES (7,TO_DATE('20190101','YYYYMMDD'),25,TRUE,2,2);
INSERT INTO Pret VALUES (8,TO_DATE('20200401','YYYYMMDD'),25,FALSE,8,2);
INSERT INTO Pret VALUES (9,TO_DATE('20200320','YYYYMMDD'),25,FALSE,9,4);
INSERT INTO Pret VALUES (10,TO_DATE('20200320','YYYYMMDD'),25,FALSE,6,4);

INSERT INTO Sanction (id,description,type,datefinsanction,membre,adherent,pret) VALUES (1,'Hopela Un retard pour toi de la part de PassePartout','Retard',TO_DATE('20200405','YYYYMMDD'),'PassePar',1,1);
INSERT INTO Sanction (id,description,type,datefinsanction,membre,adherent,pret) VALUES (2,'"Hopela Un retard pour toi de la part de PassePartout"','Retard',TO_DATE('20200405','YYYYMMDD'),'PassePar',1,2);
