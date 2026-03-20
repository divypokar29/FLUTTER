/*
switch case :  when we want to apply multiple condition 

syntax : 

switch(Exp)
{

case 1:
  statemant;
  break;

case 2:
  statemant;
  break;

default:
  statemant;
}
*/
import 'dart:io';

void main() {
  String menu = """ 
                     
                      MENU

                press 1 for login
                press 2 for registration 

                """;

  print(menu);

  int? choice;

  print("Enter your choice : ");
  choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      print("login");
      break;
    case 2:
      print("registration");
      break;
    default:
      print("Invalid choice!");
  }
}
