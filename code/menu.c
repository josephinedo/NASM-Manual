/********************************************************************
 * C program menu for gcd.o and facto.o
 * To assembly and run:
 * 	gcc gcd.o facto.o menu.c && ./a.out
********************************************************************/
#include <stdio.h>
#include <stdlib.h>

int factorial(int n);
int gcd(int a, int b);

int main() {
    int n, a, b, option, continueMenu = 1;
    do {
    	system("clear");
		printf("\nMENU\n");
		printf("1) Factorial\n");
		printf("2) Greatest Common Divisor\n");
		printf("3) EXIT\n");
		printf("Choose an option: ");
		scanf("%d",&option); getchar();
	    switch(option){
		    case 1: printf("\n--- FACTORIAL ---\n");
		    	printf("Enter an integer number: ");
		    	scanf("%d", &n); getchar();
		    	printf("factorial(%d) = %d \n", n, factorial(n)); break;
		    case 2: printf("\n--- GREATEST COMMON DIVISOR ---\n");
		    	printf("Enter the first number: ");
		    	scanf("%d",&a); getchar();
		    	printf("Enter the second number: ");
		    	scanf("%d",&b); getchar();
		    	printf("GCD = %d \n", gcd(a,b)); break;
		    case 3:
		    	continueMenu = 0; break;
		    default:
		    	printf("\nIncorrect option\n");    	
	    }
	    if(continueMenu){
	    	printf("\nPress any key to continue..."); getchar();
	    }
    } while (continueMenu);
    return 0;
}