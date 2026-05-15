/*
function with parameters and funcction with return types 

*/

/*
accept number from user and return factorial value
*/
import 'dart:io';

int findFactorial(int num) {
  int f = 1;
  for (int i = 1; i <= num; i++) {
    f *= i;
  }
  return f;
}

void main() {
  int num;
  print("Enter number : ");
  num = int.parse(stdin.readLineSync()!);

  print("factorial = ${findFactorial(num)}");
}
