import 'dart:io';

void main() {
  int i, j, k;
  int count = 1;

  print("Pyramid A:");
  for (i = 1; i <= 5; i++) {
    for (j = 1; j <= i; j++) {
      stdout.write("*");
    }
    print("");
  }

  print("\nPyramid B:");
  for (i = 1; i <= 5; i++) {
    for (j = 1; j <= i; j++) {
      stdout.write("$count ");
      count++;
    }
    print("");
  }

  print("\nPyramid C:");
  for (i = 1; i <= 5; i++) {
    for (j = 5; j > i; j--) {
      stdout.write(" ");
    }
    for (k = 1; k <= i; k++) {
      stdout.write("*");
    }
    print("");
  }
}
