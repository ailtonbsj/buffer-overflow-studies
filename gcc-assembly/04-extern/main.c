
#include <stdio.h>

int assembly(void);
extern int myVar;

int main(void)
{
  printf("Resultado: %0d\n", myVar);
  printf("Resultado: %0d\n", assembly());
  printf("Resultado: %0d\n", myVar);
  return 0;
}

int number(void) {
  return 777;
}
