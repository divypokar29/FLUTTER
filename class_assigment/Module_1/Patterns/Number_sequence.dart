import 'dart:io';

void main() {
  int i;
  int j;
  int k=1;

  for (i = 0; i <= 5; i++) {
    for (j = 0; j <= i; j++) {
      stdout.write(k++);
    }
  print(" ");
  }
}
