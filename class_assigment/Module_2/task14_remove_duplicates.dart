import 'dart:io';

void main() {
  print('========================================');
  print('     Duplicate Word Remover             ');
  print('========================================\n');

  stdout.write('How many words do you want to enter? ');
  int? count = int.tryParse(stdin.readLineSync() ?? '');

  if (count == null || count <= 0) {
    print('Error: Please enter a valid positive integer!');
    return;
  }

  List<String> words = [];
  print('\nEnter $count word(s) one by one:\n');

  for (int i = 1; i <= count; i++) {
    stdout.write('  Word $i: ');
    String? word = stdin.readLineSync();
    if (word == null || word.trim().isEmpty) {
      print('  Error: Word cannot be empty. Retrying...');
      i--;
      continue;
    }
    words.add(word.trim().toLowerCase());
  }

  Set<String> uniqueSet = Set<String>.from(words);
  List<String> sortedUnique = uniqueSet.toList()..sort();
  int duplicatesRemoved = words.length - uniqueSet.length;

  print('\n========================================');
  print('  Original Words   : ${words.join(', ')}');
  print('  Duplicates Found : $duplicatesRemoved');
  print('  Unique Words (Alphabetical):');
  for (int i = 0; i < sortedUnique.length; i++) {
    print('    ${i + 1}. ${sortedUnique[i]}');
  }
  print('  Total Unique Words: ${sortedUnique.length}');
  print('========================================');
}
