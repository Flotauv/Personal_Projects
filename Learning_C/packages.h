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
     
    int taille = sizeof(numbers)/sizeof(numbers[0]);

    printf("Taille de la liste de nombres en entrée : %d \n ", taille);
    printf("Affichage des éléments de la liste bite d'entrée et leur adresse : \n");
    for(int i=0;i<=taille+1 ;i++){
        printf("Adresse du nombre [%d=%p]\n",*(numbers+i),numbers+i);
    }
    // INFO : Si on met juste le nom de la liste en C, c'est considéré comme le premier élément de cette liste pour les pointeurs
    
}

void largest_element(int list[],int taille){
    int largest = *list; // Avec les pointeurs, on a ici le premier élément de liste qui est assigné à largest
    //int taille = sizeof(list)/sizeof(list[0]);
    printf("Taille size : %d",taille);
    for(int i=0;i<=taille;i++){
        if (largest < *(list + i)){
            largest = *(list +i);
        }
    
    }
    printf("Le plus grand élément de la listes est : %d",largest);
}






#endif

