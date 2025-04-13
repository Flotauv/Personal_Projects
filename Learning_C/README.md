# Definition of use 

Le but de ce dossier est d'implémenter toutes sortes de fonctions , bouts de projets que je peux rencontrer dans mes études ou dans des environnements professionnels en C ou C++ 

Toutes les données sont anonymisées conservant ainsi le secret professionnel. 
## Le language C
- Pas de domaine spécifique pour le langage C , scientifique , gestion ...
- Utilise l'assembleur, pres de la machine mais aussi indépendant de la machine  donc on peut l'utiliser sur Linux / windows
- On peut utiliser le même programme sous Windows que sur Linux ou autre machine
- Extensible : on peut ajouter des modules des extensions 
- Très rapide !!!!

## Informations
Quelques informations importantes : 

- int : (4 bytes %d pour afficher)
- double (8 bytes %lf pour afficher)
- float (4 bytes %f pour afficher)
- char (1 byte %c pour afficher) 

Le double permet d'afficher un nombre avec plus de précision et ils peuvent stocker plus d'informations étant codés sur plus de bytes. 

### Operators

- // Addition  +
- // Subsitution -
- // Division    /
- // Multiplication *
- // Remainder %
- // Increment ++  ( à mettre avant la variable)
- // Decrement --   (à mettre avant la variable)
- // &&  - AND
- // ||  -- OR 
- // !   -- NOT


## Compilation 

Télécharger une application de compilation qui permet une première lecture du code 
Des dizaines de compilateurs (gcc , Visual C++, Intel C++, Clang ....)

La compilation c'est la traduction de votre code en plusieurs étapes


## Linkage 

Les librairies dynamiques 

Les librairies statiques 

## Makefile 

Pour lancer la commande 'make' et compiler un programme proprement.
Pour cela, il faut créer un fichier Makefile.
### Exemple d'un fichier Makefile

cible : dependance
        commandes

Le fichier Makefile peut être enrichi pour mettre des commandes plus complexes, ajouter des conditions, des listes , des sous fichiers makefile si notre code est un peu trop volumineux...


#### Fichier exécutable 

En soit le code du programme au format .c n'est pas à proprement lancé, il doit être compilé auparavant, comme expliqué plus haut, c'est par l'intermédiaire d'un exécutable que celui ci se lance
Pour cela on utilise un compilateur ( gcc par exemple avec la commande gcc programme.c).
Un fichier .out apparait et ainsi on peut l'exécuter avec la commande ./a.out dans le terminal de commande 


## Fichier CMake

Famille d'outils open-source multiplate form conçue pour construire tester et intégrer des logiciels.
On peut générer facilement des fichiers Makefile ainsi que des fichiers projets pour Codeblocks ou autre environnement. 


## Fonctions rencontrées 
scanf() : permet à l'utilisateur de rentrer une valeur qui est assignée à une variable
