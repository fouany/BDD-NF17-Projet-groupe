# Note De Clarification

## Liste des objets présents dans la base et leur propriétés 
Dans la base de données, il y aura des ressources qui pourront être des livres, des films ou bien des enregistrements musicaux :
* Une ressource a un code, un titre, une date d'apparition, un genre et un code de classification
* Les livres ont un code isbn unique et un résumé 
* Les films ont une longueur et un synopsis
* Les enregistrements musicaux ont une certaine longueur

On trouvera aussi les différentes langues des ressources :
*  Ces  langues auront un nom 

Il y aura les contributeurs liés aux différentes ressources citées auparavant 
* les contributeurs ont un nom, un prénom, une date de naissance et une nationalité 

La base de données est utilisée par des utilisateurs qui peuvent être des adhérents ou des membres du personnel de la bibliothèque :
* Les utilisateurs ont un nom, un prénom, une adresse et un mail
* Les adhérents ont un numéro de carte d'adhérent, un numéro de téléphone, une date de naissance, un login, un mot de passe et peuvent être blacklistés
* Les membres du personnel ont un login et un mot de passe

Les adhésions actuelles et passées des adhérents seront recensées : 
* Elles auront une date de début et une date de fin 

Dans la base de données, on trouvera aussi les différents exemplaires de chaque ressource appartenant à la bibliothèque :
* Un exemplaire a un état {neuf, bon, abîmé}, une disponibilité {disponible, prêté, perdu} et un identifiant

Les sanctions des adhérents seront recensés, elles peuvent être liées à des retards, des déteriorations et/ou des pertes :
* Les sanctions ont un identifiant et une description
* Les retards seront caractérisés par un nombre de jours
* Les pertes et les déteriorations ont un booléen spécifiant si l'exemplaire a été remboursé ou non

Dans la base de données, on trouvera les différents prêts faits par les adhérents :
* Les prêts ont une date, une durée et peuvent être terminé/rendus. On pourra déterminer si l'emprunteur à dépasser le délai pour rendre l'exemplaire

## Liste des contraintes associées à ces objets et propriétés
Les ressources pourront exister en plusieurs exemplaires mais un exemplaire ne pourra être lié qu'à une seule ressource. <br>
Un livre est écrit en une seule langue mais une langue peut être associée à plusieurs livres.<br>
Un film peut être réalisé en plusieurs langues et une langue peut être associé à plusieurs films.<br>
Un contributeur pourra réalisé plusieurs films mais un film ne pourra être réalisé que par un réalisateur.<br>
Un contributeur pourra être acteur dans plusieurs films et un film pourra avoir plusieurs acteurs.<br>
Un contributeur pourra être l'auteur et/ou l'éditeur de plusieurs livres et un livre pourra avoir au plus un auteur et un éditeur. <br>
Un contributeur pourra composé et/ou interprété un enregistrement musical et un enregistrement musical pourra être composé et interprété par un seul contributeur.<br>
Un exemplaire pourra être associé à plusieurs prêts mais un prêt ne sera associé qu'à un seul exemplaire.<br>
Un adhérent pourra faire au plus 5 prêts à la fois et un prêt ne sera lié qu'à un seul utilisateur.<br>
Un adhérent pourra souscrire à plusieurs adhésions au cours de sa vie mais une adhésion ne sera lié quà un seul adhérent.<br>
Un adhérent pourra subir plusieurs sanctions mais une sanction ne peut être subi que par un adhérent (chaque cause est différente).<br>
Un membre du personnel pourra donner plusieurs sanctions mais une sanction ne sera donner que par un membre.<br>
Un prêt pourra être lié à aucune, une ou deux sanctions et une sanction ne sera lié qu'à un seul prêt.<br>

## Liste des utilisateurs qui vont utiliser la base de données et leur rôle
Les adhérents à la bibliothèques auront le droit de consulter les exemplaires existans et d'emprunter des livres à condition que l'adhésion soit à jour et qu'il soit authentifier.
Les membres du personnel vont consulter mais aussi modifier et ajouter du contenu, ils vont aussi gérer les retours des documents. Ils pourront apporter des sanctions aux adhérents et même les blacklister.

## Hypothèses faites sur le sujet 
On émet les hypothèses suivantes: <br>
Un livre n'est écrit qu'en une seule langue , les langues ont un nom unique. <br>
Chaque exemplaire d'une ressource a un identifiant pour distinguer les exemplaires d'une même ressource.<br>
Chaque exemplaire est nécessairement liée à une ressource. Un exemplaire n'existe pas sans ressource.<br>
Il y a au plus un auteur par livre et au plus un interprète par enregistrements musicaux.<br>
Les login et mdp des adhérents et des membres du personnel sont différents et permettent d'accéder à deux interfaces différentes.<br>
Un adhérent ne pourra souscrire qu'à une nouvelle adhésion que si la sienne en'est plus valide.<br>
Un adhérent pourra faire plus de 5 emprunts dans sa vie à condition qu'il rende les exemplaires empruntés et qu'il en ait 5 au maximum au même moment.<br>
Un adhérent pourra faire un emprunt uniquement si son adhésion est à jour, s'il est authentifié et s'il n'est pas blacklisté.<br>
