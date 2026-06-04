import 'dart:io';

void main() {
  int i;
  int j;

  for (i = 1; i <= 5; i++) {
    for (j = 1; j <= 5 - i; j++) {
      stdout.write(" ");
    }
    for (j = i; j >= 1; j--) {
      stdout.write(j);
    }
    print("");
  }
}
