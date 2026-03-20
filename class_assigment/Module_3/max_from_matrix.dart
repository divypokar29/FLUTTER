import 'dart:io';

void main() {
  List<List<int>> matrix = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];
  int i, j, max;

  for (i = 0; i < 3; i++) {
    for (j = 0; j < 3; j++) {
      stdout.write("Enter element [$i][$j]: ");
      matrix[i][j] = int.parse(stdin.readLineSync()!);
    }
  }

  max = matrix[0][0];

  for (i = 0; i < 3; i++) {
    for (j = 0; j < 3; j++) {
      if (matrix[i][j] > max) {
        max = matrix[i][j];
      }
    }
  }

  print("Max number from matrix: $max");
}
