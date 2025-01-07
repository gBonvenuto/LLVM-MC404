#include <stdio.h>
#include <unistd.h>
int main() {
  char text[10];
  read(0, text, 9);
  puts(text);
  return 0;
}
