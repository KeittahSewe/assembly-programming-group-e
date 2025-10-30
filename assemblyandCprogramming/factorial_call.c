#include <stdio.h>

long factorial(int n); // function prototype for assembly function

int main() {
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);

    long result = factorial(num);
    printf("Factorial of %d = %ld\n", num, result);

    return 0;
}
