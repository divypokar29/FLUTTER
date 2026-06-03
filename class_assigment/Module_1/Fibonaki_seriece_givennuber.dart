import 'dart:async';
import 'dart:io';

void main() {
  int B = 1;
  int A = 0;
  int tem;
  int i;
  int GivenNumber;

  print("Enter number for fibonacci : ");
  GivenNumber = int.parse(stdin.readLineSync()!);

  for (i = 0; i <= GivenNumber; i++) {
    print("Fibonacci = $A");
    tem = A;
    A = B;
    B = tem + B;

  }
}
