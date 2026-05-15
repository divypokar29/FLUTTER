import 'dart:io';

void main() {
  int num = 0;
  int ans = 0;

  for (int i = 0; i < 5; i++) {
    print("Enter number :");
    num = int.parse(stdin.readLineSync()!);
    ans = ans + num;
  }
  print(ans);
}
