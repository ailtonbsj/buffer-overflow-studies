
#include <stdio.h>

// Argument send to RDI and return via EAX
int my_strlen(char *);

int main(void)
{
  printf("Resultado: %d\n", my_strlen("Hello!"));
  return 0;
}
