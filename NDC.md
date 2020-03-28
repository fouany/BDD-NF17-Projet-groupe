Note De Clarification

Liste des objets présents dans la base et leur propriétés:
    Dans la base de données, il y aura des ressources qui pourront être des livres, des films ou bien des enregistrements musicaux : 
        -> Une ressource aura un code, un titre, une date d'apparition, un genre et un code de clarification
        -> Les livres auront des codes isbn uniques, un résumé et seront écrit dans une certaine langue
        -> Les films auront une longueur, un synopsis et seront filmés dans une certaine langue
        -> Les enregistrements musicaux auront une certaine longueur
        
    On trouvera aussi les contributeurs liés aux différentes ressources citées auparavant :
        -> les contributeurs ont un nom, un prénom, une date de naissance et une nationalité
    
    La base de données sera utilisée par des utilisateurs qui pourront être des adhérents ou des membres du personnel de la bibliothèque : 
        -> Les utilisateurs ont un nom, un prénom, une adresse et un mail
        -> Les adhérents ont un numéro de carte d'adhérent, un numéro de téléphone, une date de naissance, un login, un mot de passe et pourront être blacklistés
        -> Les membres du personnel auront un login et un mot de passe 
    
    Dans la base de données, on trouvera aussi les différents exemplaires de chaque ressource appartenant à la bibliothèque : 
        -> Un exemplaire aura simplement un état {neuf, bon, abîmé, perdu}, **une disponibilité (booléen) et un id**
    
    Dans la base de données, on trouvera aussi les sanctions des adhérents :
        -> Les sanctions auront un type, un identifiant et une description
    
    Dans la base de données, on trouvera les différents prêts faits par les adhérents :
        -> Les prêts auront une date et une durée
    
Liste des contraintes associées à ces objets et propriétés:
    - Les ressources pourront exister en plusieurs exemplaires mais un exemplaire ne pourra être lié qu'à une seule ressource.
    - Un adhérent pourra emprunter au maximum 5 exemplaires et un exemplaire pourra être emprunter par un seul utilisateur
    - Un adhérent pourra subir plusieurs sanctions mais une sanction ne peut être subi que par un adhérent (chaque cause est différente)
    - Un contributeur pourra être l'auteur de plusieurs livres et un livre pourra avoir plusieurs auteurs
    - Un contributeur ...

Liste des utilisateurs qui vont utiliser la base de données et leur rôle:
    - Adhérents en simple consultation et emprunt de livres
    - Membres du personnel qui vont consulter mais aussi modifier et ajouter du contenu, ils vont aussi gérer les retours des documents (sanctions)
    
Hypothèses faites sur le sujet : 
