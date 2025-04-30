// le compilateur permet de traduire le code pour notre machine 
// debug et release sont les modes de compilation
// debug il avance ligne pqr ligne
// release il enlève des variables , il essaye de l'optimiser 

// header pour utiliser les flux , et c'est un package qu on importe 
#include <stdio.h> 
#include <stdbool.h>
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

int main() {
    double number1;
    char alphabet;

    printf("Entrez des valeurs (Un double et un caractère): \n");
    scanf("%lf %c",&number1,&alphabet);
    printf("Le nombre entré est :%lf",number1);
    printf("\n La lettre entrée est :%c",alphabet);

    double variable = 12;
    double x = variable+1;
    printf("%lf \n",--x);

    float valeur1 = 5.5;
    int valeur2 = 6;
    float valeur3 = (int)valeur1 + valeur2;

    printf("%f \n",valeur3);

    bool varb1 = (12 > 9);  // true est égale à 1
    
    printf("%d\n",varb1);

    if (varb1 == 1){
        printf("La vie est belle\n");
    }
    else{
        printf("Caca\n");
    }
    int valeur_fct = fct2(23);
    printf("%d\n",valeur_fct);

    // Ternary operator
    int age = 13;
    char result= (age >= 18) ? printf("You can vote\n") : printf("You cannot vote\n");
    printf("%c\n",result);

    //Switch statement 

    int variable1=22;

    switch (variable1){
        case 22:
        printf("la valeur est donc :%d \n",++variable1);
        break;


        default:
        printf("%d",--variable1);


    }


    //While loop while(condition){script}  
    int count = 10;
    while(count != 0){
       // --test; première méthode 
       count = count - 1; // deuxième méthode 
       printf("La valeur de test est maintenant de : %d \n",count);

    }
    // For loop : for (initialiseExpression ; testExpression ; UpdateExpression){}

    for (int i=100 ; i>=0 ;i=i-2){
        int test = i;
        printf("%d ",test);
    }

    int quotien = function_test(10,5);
    printf("Le résultat de la fonction appelée du fichier 'packages.h' est %d",quotien);

    // break and continues statement 
    return 0;
}

