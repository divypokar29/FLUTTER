import 'dart:io';

Map<String, String> addressBook = {};

void viewAllContacts() {
  if (addressBook.isEmpty) {
    print('\n  Address book is empty.\n');
    return;
  }

  List<String> sortedNames = addressBook.keys.toList()..sort();

  print('\n  ┌──────────────────────────┬────────────────────┐');
  print('  │  Name                    │  Phone Number      │');
  print('  ├──────────────────────────┼────────────────────┤');
  for (String name in sortedNames) {
    print('  │  ${name.padRight(24)} │  ${addressBook[name]!.padRight(18)} │');
  }
  print('  └──────────────────────────┴────────────────────┘');
  print('  Total contacts: ${addressBook.length}\n');
}

void addContact() {
  stdout.write('\n  Enter name        : ');
  String? name = stdin.readLineSync();
  if (name == null || name.trim().isEmpty) {
    print('  Error: Name cannot be empty!\n');
    return;
  }
  name = name.trim();

  if (addressBook.containsKey(name)) {
    print('  Contact "$name" already exists. Use Update instead.\n');
    return;
  }

  stdout.write('  Enter phone number: ');
  String? phone = stdin.readLineSync();
  if (phone == null || phone.trim().isEmpty) {
    print('  Error: Phone number cannot be empty!\n');
    return;
  }

  addressBook[name] = phone.trim();
  print('  ✔ Contact "$name" added successfully!\n');
}

void updateContact() {
  stdout.write('\n  Enter name to update: ');
  String? name = stdin.readLineSync();
  if (name == null || name.trim().isEmpty) {
    print('  Error: Name cannot be empty!\n');
    return;
  }
  name = name.trim();

  if (!addressBook.containsKey(name)) {
    print('  Contact "$name" not found in address book.\n');
    return;
  }

  print('  Current phone: ${addressBook[name]}');
  stdout.write('  Enter new phone number: ');
  String? newPhone = stdin.readLineSync();
  if (newPhone == null || newPhone.trim().isEmpty) {
    print('  Error: Phone number cannot be empty!\n');
    return;
  }

  addressBook[name] = newPhone.trim();
  print('  ✔ Contact "$name" updated successfully!\n');
}

void removeContact() {
  stdout.write('\n  Enter name to remove: ');
  String? name = stdin.readLineSync();
  if (name == null || name.trim().isEmpty) {
    print('  Error: Name cannot be empty!\n');
    return;
  }
  name = name.trim();

  if (!addressBook.containsKey(name)) {
    print('  Contact "$name" not found in address book.\n');
    return;
  }

  addressBook.remove(name);
  print('  ✔ Contact "$name" removed successfully!\n');
}

void searchContact() {
  stdout.write('\n  Enter name to search: ');
  String? name = stdin.readLineSync();
  if (name == null || name.trim().isEmpty) {
    print('  Error: Name cannot be empty!\n');
    return;
  }
  name = name.trim();

  if (addressBook.containsKey(name)) {
    print('  ✔ Found: $name → ${addressBook[name]}\n');
  } else {
    print('  ✘ Contact "$name" not found.\n');
  }
}

void main() {
  print('========================================');
  print('          Address Book App              ');
  print('========================================\n');

  addressBook['Alice Johnson']  = '9876543210';
  addressBook['Bob Smith']      = '9123456789';
  addressBook['Charlie Brown']  = '9988776655';

  print('  (3 sample contacts pre-loaded)\n');

  bool running = true;

  while (running) {
    print('Select an option:');
    print('  1. View All Contacts');
    print('  2. Add Contact');
    print('  3. Update Contact');
    print('  4. Remove Contact');
    print('  5. Search Contact');
    print('  6. Exit');
    stdout.write('\nEnter choice (1-6): ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        viewAllContacts();
        break;
      case '2':
        addContact();
        break;
      case '3':
        updateContact();
        break;
      case '4':
        removeContact();
        break;
      case '5':
        searchContact();
        break;
      case '6':
        print('\nThank you for using Address Book. Goodbye!');
        running = false;
        break;
      default:
        print('  Invalid choice! Please enter 1 to 6.\n');
    }

    if (running) print('----------------------------------------');
  }
}
