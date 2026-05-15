class student //class creation with student name
{
  int id = 101; // data member
  String? name = "AAA";
}

void main() {
  student obj = student();

  print("id = ${obj.id}");
  print("name = ${obj.name}");
}
