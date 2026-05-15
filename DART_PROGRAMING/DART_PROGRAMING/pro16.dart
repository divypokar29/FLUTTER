import "dart:io";
/*
  continue : continue is a keyword which is skip the current statement 
      but loop will continue 
*/
void main() {
  int i;
  for (i = 1; i <= 5; i++) {
    if (i == 3) {
      continue;
    }
    print(i);
  }
}
