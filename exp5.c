#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h> // Include ctype.h for isalpha, isdigit, and isalnum functions

// Define a function to check if a character is a valid identifier character
bool isValidIdentifierChar(char c) {
    return isalpha(c) || isdigit(c) || c == '_';
}

bool isValidIdentifier(const char* input_string) {
    size_t input_length = strlen(input_string);

    // Check if the identifier is empty or starts with a digit (invalid)
    if (input_length == 0 || isdigit(input_string[0])) {
        return false;
    }

    // Check each character in the identifier
    for (size_t i = 0; i < input_length; i++) {
        if (!isValidIdentifierChar(input_string[i])) {
            return false;
        }
    }

    // Check if the identifier is a C keyword (you can expand this list)
    const char* keywords[] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double","else", "enum", "extern", "float", "for", "goto", "if", "int", "long","register","return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef","union", "unsigned", "void", "volatile", "while"};

    for (size_t i = 0; i < sizeof(keywords) / sizeof(keywords[0]); i++) {
        if (strcmp(input_string, keywords[i]) == 0) {
            return false; // It's a keyword
        }
    }

    // If all checks pass, it's a valid identifier
    return true;
}

int main() {
    char input[30];

    printf("Enter an identifier: ");
    scanf("%s", input);

    if (isValidIdentifier(input)) {
        printf("Valid C identifier\n");
    } else {
        printf("Not a valid C identifier\n");
    }

    return 0;
}

