import 'dart:io';

class Employee {
  int empno = 0;
  String empname = "";
  String address = "";
  int age = 0;
}

void main() {
  List<Employee> empList = [];
  int i;

  for (i = 0; i < 5; i++) {
    Employee emp = Employee();
    print("Enter details for Employee ${i + 1}");
    
    stdout.write("Enter Emp No: ");
    emp.empno = int.parse(stdin.readLineSync()!);

    stdout.write("Enter Emp Name: ");
    emp.empname = stdin.readLineSync()!;

    stdout.write("Enter Address: ");
    emp.address = stdin.readLineSync()!;

    stdout.write("Enter Age: ");
    emp.age = int.parse(stdin.readLineSync()!);

    empList.add(emp);
  }

  print("\nEmployee Details:");
  for (i = 0; i < 5; i++) {
    print("Emp No: ${empList[i].empno}, Name: ${empList[i].empname}, Address: ${empList[i].address}, Age: ${empList[i].age}");
  }
}
