// le compilateur permet de traduire le code pour notre machine 
// debug et release sont les modes de compilation
// debug il avance ligne pqr ligne
// release il enlève des variables , il essaye de l'optimiser 

// header pour utiliser les flux , et c'est un package qu on importe 
#include <stdio.h> 
#include <stdbool.h>
#include <string.h>
#include "packages.h"

/*
If I want to put comments on multiple lines, I can use this method
I can also use // to comment on a single line
I can also use #define to define a constant
I can also use #include to include a library
*/


// void signie qu'il n'y a pas de return et c'est le cas il n'y a pas de return
void fct1(int a,int b){
    printf("%d",a+b);
}

// si on donne pas une valeur à la fct dans le main , le compilateur ne la traduit pas
int fct2(int a){
    return a;
    printf("Return statement"); 
}


// Strings exercices 
char variable_str []= "C Programming";

int main() {
    printf("Il faut entrer un mot : ");
    //scanf("%s",variable_str);
    fgets(variable_str,sizeof(variable_str),stdin);
    printf("The word is : %s",variable_str);

    printf("Length of variable : %zu",strlen(variable_str));
    char newFood[strlen(variable_str)];
    strcpy(newFood,variable_str);

    printf("New food is %s",newFood);

    char var1 [] = "ABC";
    char var2 [] = "DEF";
    strcat(var1,var2);
    printf("%s",var1);

    char var1_bis [] = "etre";
    char var2_bis [] = "zizi";
    int result = strcmp(var1_bis,var2_bis);
    printf("result is : %d",result);

    int age = 18;
    int *valeur = &age;
    printf("The adress of the age pointer is : %p \n",&age);
    printf("The valeur of the pointer is : %d \n",*valeur);

    int test[4] = {1,2334443,3,4};
    list_of_adress(test);
    printf("Taille premier element :%ld, taille deuxieme element : %ld",sizeof(test[0]),sizeof(test[12]));


    // problème dans la compilation ? zsh trace trap ... qu'est ce que cela signifie ?

    

    

    
    return 0; // il faut le laisser dans un main celui là
}

