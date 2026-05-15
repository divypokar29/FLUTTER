import 'dart:io';

class Book {
  String title;
  String author;
  int publicationYear;

  Book(this.title, this.author, this.publicationYear);

  void displayDetails() {
    print('\n  ┌─────────────────────────────────────┐');
    print('  │           Book Details              │');
    print('  ├─────────────────────────────────────┤');
    print('  │  Title  : $title');
    print('  │  Author : $author');
    print('  │  Year   : $publicationYear');
    print('  └─────────────────────────────────────┘');
  }

  bool isOver10YearsOld() {
    int currentYear = DateTime.now().year;
    return (currentYear - publicationYear) > 10;
  }
}

void main() {
  print('========================================');
  print('          Book Information              ');
  print('========================================\n');

  stdout.write('Enter book title       : ');
  String? title = stdin.readLineSync();

  stdout.write('Enter author name      : ');
  String? author = stdin.readLineSync();

  stdout.write('Enter publication year : ');
  int? year = int.tryParse(stdin.readLineSync() ?? '');

  if (title == null || title.trim().isEmpty ||
      author == null || author.trim().isEmpty ||
      year == null || year <= 0) {
    print('Error: Please enter valid book details!');
    return;
  }

  Book book = Book(title.trim(), author.trim(), year);

  book.displayDetails();

  int age = DateTime.now().year - year;
  if (book.isOver10YearsOld()) {
    print('\n  This book is $age year(s) old — it IS over 10 years old.');
  } else {
    print('\n  This book is $age year(s) old — it is NOT over 10 years old.');
  }
  print('');
}
