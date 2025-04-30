
// Inclusion des packages 
#include <stdio.h>
#include <stdbool.h>

// Création variable globale 
int variable_globale;


int my_function(int number1,int number2){
    int sum = number1 + number2;
    return sum;
}

int fct_2(int number1,int number2, int number3){
    int variable_globale = number1 + number2 + number3;
    return variable_globale;
}



