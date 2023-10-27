#include <stdio.h>
#include <stdbool.h>
#include <string.h>


typedef enum {
    q0, 
    q1,
    q2,
    q3 
} State;


State transition(State currentState, char input) {
    switch (currentState) {
        case q0:
            if (input == 'a') return q1;
            else if (input == 'b') return q0;
	    else if (input == 'c') return q0;

            break;
        case q1:
            if (input == 'a') return q1;
            else if (input == 'b') return q2;
	    else if (input == 'c') return q0;
            break;
        case q2:
            if (input == 'a') return q0;
            else if (input == 'b') return q0;
	    else if (input == 'c') return q3;
            break;
	case q3:
            return q3;
            break;
    }
    return q0; 
}


void checkDFA(const char* input_string) {
    State currentState = q0;
    size_t input_length = strlen(input_string);

    for (size_t i = 0; i < input_length; i++) {
        currentState = transition(currentState, input_string[i]);
    }

    if( currentState == q3)
	{
		printf("Substring Accepted\n");
	} 
else printf("Substring not accepted\n");
}

int main() {

	char input[30];
    
	printf("Enter the string : ");
	scanf("%s",input);
	
	checkDFA(input);

    return 0;
}

