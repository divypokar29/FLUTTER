import 'dart:io';

Map<String, int> countCharFrequency(String text) {
  Map<String, int> frequency = {};

  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    frequency[char] = (frequency[char] ?? 0) + 1;
  }

  return frequency;
}

void main() {
  print('========================================');
  print('     Character Frequency Counter        ');
  print('========================================\n');

  stdout.write('Enter a string: ');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('Error: Input string cannot be empty!');
    return;
  }

  Map<String, int> frequency = countCharFrequency(input);

  List<MapEntry<String, int>> sortedEntries = frequency.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  print('\n  Input String : "$input"');
  print('  Total Chars  : ${input.length}');
  print('\n  Character Frequencies:');
  print('  ┌─────────────┬───────────┐');
  print('  │  Character  │ Frequency │');
  print('  ├─────────────┼───────────┤');

  for (MapEntry<String, int> entry in sortedEntries) {
    String display = entry.key == ' ' ? '(space)' : '"${entry.key}"';
    print('  │  ${display.padRight(10)} │     ${entry.value.toString().padLeft(5)} │');
  }

  print('  └─────────────┴───────────┘');
  print('  Total unique characters: ${frequency.length}');
  print('========================================');
}
