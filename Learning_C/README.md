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
- string (X bytes %zu pour afficher)

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

produit : source
    commandes

cible : dependance
    commandes 

Le fichier Makefile peut être enrichi pour mettre des commandes plus complexes, ajouter des conditions, des listes , des sous fichiers makefile si notre code est un peu trop volumineux...
Il va permettre de créer à partir du fichier source (le fichier .c) un fichier objet qui lui va s'exécuter.

*gcc -Wall -o result_compile -c results.c*

Cette commande permet de créer le fichier objet pour ensuite écire dans le makefile la commande à exécuter avec le fichier 

Note : gcc est le compilateur par excellence

On peut même rajouter des variables dans le fichier makefile


#### Fichier exécutable 

En soit le code du programme au format .c n'est pas à proprement lancé, il doit être compilé auparavant, comme expliqué plus haut, c'est par l'intermédiaire d'un exécutable que celui ci se lance
Pour cela on utilise un compilateur ( gcc par exemple avec la commande gcc programme.c).
Un fichier .out apparait et ainsi on peut l'exécuter avec la commande ./a.out dans le terminal de commande 
Le fichier est un .exe sur windows et sur mac ça n'est rien. 
### Fichiers format .h
Ce sont des fichiers qui contiennent la déclaration de fonctions, la définition de constantes , un exemple serait un fichier utils.h 
Ces fichiers peuvent être crées par le programmeur pour définir ses fonctions et les appelées dans les fichiers sources souhaités. 

## Fichier CMake

Famille d'outils open-source multiplate form conçue pour construire tester et intégrer des logiciels.
On peut générer facilement des fichiers Makefile ainsi que des fichiers projets pour Codeblocks ou autre environnement. 

## Librairies disponibles

*math.h* (La même librairie qu'en python pour les opérateurs mathématiques)
*ctype.h* (Pour des opérations sur des chaines de caracteres)
## Fonctions rencontrées 
scanf() : permet à l'utilisateur de rentrer une valeur qui est assignée à une variable
strlen(): permet de renvoyer la longueur d'une chaine de caractères
strpcpy(destination,variable) : permet d'assigner à destination la variable 'variable'
strcat(variable1;variable2) : permet de concatener var1 et var2 à partir de var1
strcmp(var1,var2) : retourne le nombre de caractères différent entre var1 et var2 , output est un entier
