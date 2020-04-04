--Vue pour vérifier que les adhérents peuvent emprunter
CREATE VIEW vNb_Pret (numCarte, nb)
AS
SELECT Adherent.numCarte, COUNT(*) AS Nb_Pret FROM Adherent, Pret
WHERE Adherent.numCarte=Pret.adherent
AND Pret.rendu=false
GROUP BY Adherent.numCarte;

CREATE VIEW vadhe_ok (numcarte,nom,prenom) AS
SELECT a.numcarte,a.nom,a.prenom FROM  (((adherent a LEFT JOIN sanction s ON a.numCarte=s.adherent)
LEFT JOIN pret p ON a.numCarte=p.adherent) JOIN adhesion ad ON a.numCarte=ad.adherent)LEFT JOIN  vNb_pret n ON  a.numCarte=n.numCarte
WHERE a.blacklist=false
AND (s.remboursement IS NULL OR s.remboursement=true )
AND (s.datefinsanction IS NULL OR s.datefinsanction<current_date)
AND ad.datefin>current_date
AND (n.nb IS NULL OR n.nb<5)
GROUP BY a.numcarte,a.nom,a.prenom;


-- Vue pour vérifier qu'il y a au plus deux sanctions par prêt :
CREATE VIEW vnbSanctionsTropEleve(idPret,Nombre) AS
SELECT p.id,count(s.id) AS Nombre FROM Pret p LEFT JOIN Sanction s ON p.id = s.Pret GROUP BY p.id HAVING count(s.id) > 2;


-- créer une vue pour vérifier que les adhérents qui subissent des sanctions sont bien ceux qui le méritent dans Sanction -> pret . adherent  = Sanction -> Adherent
CREATE VIEW vadherentPbSanction(idAdherent)AS
SELECT Sanction.adherent FROM Pret,Sanction WHERE Sanction.pret = Pret.id AND Sanction.adherent <> Pret.adherent GROUP BY Sanction.adherent;

-- C1, C2 ET C3 sont trois vues qui doivent être vides
CREATE VIEW vLivreFilmMemeCode(codeLivre) AS
SELECT Livre.code FROM Livre, Film WHERE Livre.code = Film.code GROUP BY Livre.code;
CREATE VIEW vFilmEnregistrementMemeCode(codeFilm) AS
SELECT Film.code FROM EnregistrementMusical, Film WHERE EnregistrementMusical.code = Film.code GROUP BY Film.code;
CREATE VIEW vEnregistrementLivreMemeCode(codeEnregistrementMusical) AS
SELECT EnregistrementMusical.code FROM Livre, EnregistrementMusical WHERE EnregistrementMusical.code = Livre.code GROUP BY EnregistrementMusical.code ;

--Vues pour les statistiques
CREATE VIEW vnbEmprunts(nombre)AS
SELECT Count(*) FROM Pret;
-- Ces 3 vues servent à compter le nombre d'emptunts d'une ressource
CREATE VIEW vnbEmpruntsLivre(code,titre,NbEmpruntsDelivre,pourcentagetotal) AS
SELECT codeLivre,titre, COUNT(*) AS NbEmpruntsDelivre,(COUNT(*)*100/nombre) AS pourcentagetotal FROM Exemplaire,Pret,Livre,vnbEmprunts
WHERE Exemplaire.codeLivre IS NOT NULL
AND Exemplaire.id=Pret.exemplaire
AND Exemplaire.codeLivre = Livre.code
GROUP BY codeLivre,titre,nombre;

CREATE VIEW vnbEmpruntsFilm(code,titre,NbEmpruntsDeFilm,pourcentagetotal) AS
SELECT codeFilm, titre,COUNT(*) AS NbEmpruntsDeFilm ,(COUNT(*)*100/nombre) AS pourcentagetotal FROM Exemplaire,Pret,Film,vnbEmprunts
WHERE Exemplaire.codeFilm IS NOT NULL
AND Exemplaire.id=Pret.exemplaire
AND Exemplaire.codeFilm = Film.code
GROUP BY codeFilm,titre,nombre;

CREATE VIEW vnbEmpruntsEnregistrement(code,titre,NbEmpruntsDEnregistrement,pourcentagetotal) AS
SELECT codeEnregistrement,titre, COUNT(*) AS NbEmpruntsDEnregistrement,(COUNT(*)*100/nombre) AS pourcentagetotal FROM Exemplaire,Pret,EnregistrementMusical,vnbEmprunts
WHERE Exemplaire.codeEnregistrement IS NOT NULL
AND Exemplaire.id=Pret.exemplaire
AND Exemplaire.codeEnregistrement = EnregistrementMusical.code
GROUP BY codeEnregistrement,titre,nombre;


-- Vues pour les Exemplaires disponibles
CREATE VIEW vExemplaireDispo(code,ftitre,ltitre,etitre) AS
SELECT id, f.titre,l.titre,e.titre FROM ((Exemplaire LEFT JOIN Livre l ON Exemplaire.codeLivre = l.code) LEFT JOIN Film f ON Exemplaire.codeFilm = f.code) LEFT JOIN EnregistrementMusical e
ON Exemplaire.codeEnregistrement = e.code
WHERE disponibilite = 'disponible'
AND etat<>'abime'
GROUP BY id, f.titre,l.titre,e.titre ;