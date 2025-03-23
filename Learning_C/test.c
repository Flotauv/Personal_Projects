// le compilateur permet de traduire le code pour notre machine 
// debug et release sont les modes de compilation
// debug il avance ligne pqr ligne
// release il enlève des variables , il essaye de l'optimiser 

// header pour utiliser les flux , et c'est un package qu on importe 
#include <stdio.h> 


int main() {
    int a = 5;
    int b = 3;
    int c = a + b;
    printf("%d",c);
    //std::cout << "Hello world "<< std::endl; 
    //std::cin.ignore();
    return 0;
}

