import 'dart:io';

String getGrade(int score) {
  if (score >= 90 && score <= 100) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else if (score >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

void main() {
  print('========================================');
  print('        Student Grading System          ');
  print('========================================\n');

  stdout.write('Enter the student\'s score (0 - 100): ');
  String? input = stdin.readLineSync();

  int? score = int.tryParse(input ?? '');

  if (score == null || score < 0 || score > 100) {
    print('Error: Please enter a valid score between 0 and 100!');
    return;
  }

  String grade = getGrade(score);

  String message;
  switch (grade) {
    case 'A':
      message = 'Excellent! Outstanding performance!';
      break;
    case 'B':
      message = 'Good job! Keep it up!';
      break;
    case 'C':
      message = 'Average. There is room for improvement.';
      break;
    case 'D':
      message = 'Below average. Please study harder.';
      break;
    default:
      message = 'Failed. Please seek help and try again.';
  }

  print('\n========================================');
  print('  Score : $score');
  print('  Grade : $grade');
  print('  Remark: $message');
  print('========================================');
}
