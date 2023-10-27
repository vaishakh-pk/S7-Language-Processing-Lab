#include <stdio.h>
#include <stdbool.h>
#include <string.h>


typedef enum {
    q0, 
    q1,
    q2, 
} State;


State transition(State currentState, char input) {
    switch (currentState) {
        case q0:
            if (input == '0') return q1;
            else if (input == '1') return q0;
            break;
        case q1:
            if (input == '0') return q2;
            else if (input == '1') return q0;
            break;
        case q2:
            if (input == '0') return q2;
	    else if (input == '1') return q0;
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

    if( currentState == q2)
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

