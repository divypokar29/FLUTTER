import 'dart:io';

void main() {
  List<int> arr = [10, 20, 30, 40, 50];
  int pos;

  stdout.write("Enter position (1 to 5): ");
  pos = int.parse(stdin.readLineSync()!);

  if (pos >= 1 && pos <= 5) {
    print("Element at position $pos is: ${arr[pos - 1]}");
  } else {
    print("Invalid position");
  }
}
