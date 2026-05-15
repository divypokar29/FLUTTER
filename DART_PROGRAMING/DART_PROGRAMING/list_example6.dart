void main() {
  List<String> subjectList = ["C", "C++", "java", "flutter"];

  print(subjectList);

  subjectList.remove("C++");

  print(subjectList);

  subjectList.removeAt(0);
  print(subjectList);

  subjectList.removeLast();
  print(subjectList);
}
