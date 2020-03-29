# Note De Clarification

## Liste des objets présents dans la base et leur propriétés :
    Dans la base de données, il y aura des ressources qui pourront être des livres, des films ou bien des enregistrements musicaux :
* Une ressource a un code, un titre, une date d'apparition, un genre et un code de classification
* Les livres ont un code isbn unique, un résumé et sont écrit dans une certaine langue
* Les films ont une longueur, un synopsis et sont tournés dans une ou plusieurs langues
* Les enregistrements musicaux ont une certaine longueur

    Dans la base de données, on trouvera aussi les différentes langues :
*  Ces  langues auront un nom 

    On trouvera aussi les contributeurs liés aux différentes ressources citées auparavant 
* les contributeurs ont un nom, un prénom, une date de naissance et une nationalité 

    La base de données est utilisée par des utilisateurs qui peuvent être des adhérents ou des membres du personnel de la bibliothèque :
* Les utilisateurs ont un nom, un prénom, une adresse et un mail
* Les adhérents ont un numéro de carte d'adhérent, un numéro de téléphone, une date de naissance, un login, un mot de passe et peuvent être blacklistés
* Les membres du personnel ont un login et un mot de passe

        
    Dans la base de données, on trouve aussi les différents exemplaires de chaque ressource appartenant à la bibliothèque :
* Un exemplaire a un état {neuf, bon, abîmé}, une disponibilité {disponible, prêté, perdu} 
        
    Dans la base de données, on trouvera aussi les sanctions des adhérents, qui peuvent être des retards, des déteriorations et des pertes :
* Les sanctions ont un identifiant et une description
* Les retards ont un nombre de jours de retard
* Les pertes et les déteriorations ont un booléen spécifiant si l'exemplaire a été remboursé ou non

        
    Dans la base de données, on trouvera les différents prêts faits par les adhérents :
* Les prêts ont une date et une durée 

## Liste des contraintes associées à ces objets et propriétés:
    - Les ressources pourront exister en plusieurs exemplaires mais un exemplaire ne pourra être lié qu'à une seule ressource.
    - Un adhérent pourra emprunter au maximum 5 exemplaires et un exemplaire pourra être emprunté par un seul utilisateur
    - Un adhérent pourra subir plusieurs sanctions mais une sanction ne peut être subi que par un adhérent (chaque cause est différente)
    - Un contributeur pourra être l'auteur de plusieurs livres et un livre pourra avoir plusieurs auteurs (?)
    - Un contributeur ...

## Liste des utilisateurs qui vont utiliser la base de données et leur rôle:
    - Adhérents en simple consultation et emprunt de livres
    - Membres du personnel qui vont consulter mais aussi modifier et ajouter du contenu, ils vont aussi gérer les retours des documents (sanctions)

## Hypothèses faites sur le sujet :
