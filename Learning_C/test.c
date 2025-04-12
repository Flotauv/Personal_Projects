// le compilateur permet de traduire le code pour notre machine 
// debug et release sont les modes de compilation
// debug il avance ligne pqr ligne
// release il enlève des variables , il essaye de l'optimiser 

// header pour utiliser les flux , et c'est un package qu on importe 
#include <stdio.h> 
/*
If I want to put comments on multiple lines, I can use this method
I can also use // to comment on a single line
I can also use #define to define a constant
I can also use #include to include a library
*/



int fct_test(int a,int b){
    return a+b;
}

int main() {
    double number1;
    char alphabet;

    printf("Entrez des valeurs (Un double et un caractère): \n");
    //scanf("%lf %c",&number1,&alphabet);
    //printf("Le nombre entré est :%lf",number1);
    //printf("\n La lettre entrée est :%c",alphabet);

    double variable = 12;
    double x = variable+1;
    printf("%lf \n",--x);

    int valeur1 = 5.5;
    int valeur2 = 6;

    printf("%d",valeur1);

    

    //printf(fct_test(5,3));   
    return 0;
}

