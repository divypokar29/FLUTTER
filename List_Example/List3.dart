void main() {
  List<String> subjectList = ["C", "C++", "Java", "Flutter"];

  print(subjectList);

  subjectList.remove("C++");

  print(subjectList);

  subjectList.removeAt(2);

  print(subjectList);

  subjectList.removeLast();

  print(subjectList);
}
