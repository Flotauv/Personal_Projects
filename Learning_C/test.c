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
    int a = 5;
    int b = 3;
    int c = a + b;
    int d = 40;
    float numberfloat = 3.345f;
    double doubleTest= 12.45;



    double exponentiel = 5e6;
    char caractere = 'S';
    printf("Age : %d",c);
    //std::cout << "Hello world "<< std::endl; 
    //std::cin.ignore();

    printf("\n New age is %d ",d);
    printf("\n Premier double qui est %f",doubleTest + numberfloat);
    printf("\n Notre cqrqctere est %c",caractere);


    //printf(fct_test(5,3));   
    return 0;
}

