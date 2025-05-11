//IMPORTANT de mettre les # , je ne sais plus pourquoi ... à vérifier 

#ifndef ACTIONS_H
#define ACTIONS_H

int function_test(int a , int b){
    int result = a/b;
    return result; 
}

void Is_age_legal(int age){
    if (age>18){
        return 1;
        
    }
    else{
        return 0;
        
    }
}
// On doit pouvoir optimiser le case non ?
void switch_health_state(int state){
    switch(state){
        case 3 :
        state = 1;
        printf("Changement d'état la personne se guérit");
        break;
        case 2 :
        state =1;
        printf("Changement d'état la personne se guérit");
        break;

        default:
        printf("Par défault l'état de la personne est normal");
    }
}

#endif

