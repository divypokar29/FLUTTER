/*
switch case : 

when we want to apply multiple conditions 

syntax : 

switch(Exp)
{
  case 1:
    statement;
    break;

  case 2:
    statement;
    break;

    default:

}
*/
import "dart:io";
void main()
{
  String menu = """
                  MENU 

          press 1 for Login 
          press 2 for registeration
  """;

  print(menu);

  int choice;

  print("Enter your choice : ");
  choice = int.parse(stdin.readLineSync()!);
  switch(choice)
  {
    case 1:
      print("login code here...");
      break;

      case 2:
      print("registration...");
      break;

      default:
      print("invalid choice");
  }

}