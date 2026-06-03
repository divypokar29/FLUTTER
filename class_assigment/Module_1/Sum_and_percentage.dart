void main() {
  List marks = [85, 90, 78, 92, 88];

  double total = 0;

  for (int i = 0; i < marks.length; i++) {
    total = total + marks[i];
  }

  double percentage = total / 5;

  print("Total Marks = $total");
  print("Percentage = $percentage%");
}