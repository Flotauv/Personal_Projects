//IMPORTANT de mettre les # , je ne sais plus pourquoi ... à vérifier 

#ifndef ACTIONS_H
#define ACTIONS_H

int function_test(int a , int b){
    int result = a/b;
    return result; 
}

// Fct to know if the person is mayor or not
int Is_age_legal(int age){
    if (age>18){
        printf("La personne est majeure");
        return 1;
        
    }
    else{
        printf("La personne n'est pas majeure");
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

void list_of_adress(int numbers[]){
    int taille = (sizeof(numbers)/sizeof(numbers[0]));
    printf("Taille de la liste de nombres en entrée : %d \n ", taille);
    printf("Affichage des elements d'entrée et leur adresse : \n");
    for(int i=0;i<=taille ;i++){
        printf("Adresse du nombre [%d] : %p\n",i,&numbers[i]);
    }
    
}
#endif

