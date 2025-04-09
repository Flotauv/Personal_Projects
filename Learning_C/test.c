// le compilateur permet de traduire le code pour notre machine 
// debug et release sont les modes de compilation
// debug il avance ligne pqr ligne
// release il enlève des variables , il essaye de l'optimiser 

// header pour utiliser les flux , et c'est un package qu on importe 
#include <stdio.h> 


int fct_test(int a,int b){
    return a+b;
}

int main() {
    double number1;
    char alphabet;
    printf("Entrez des valeurs: ");
    
    scanf("%lf %c",&number1,&alphabet);



    printf("Le nombre entré est :%lf",number1);
    printf("\n La lettre entrée est :%c",alphabet);


    //printf(fct_test(5,3));   
    return 0;
}

