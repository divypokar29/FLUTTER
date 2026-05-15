void main() {
  Map<String, dynamic> studentMap = {
    'username': "u101",
    'email': "a@gmail.com",
    'name': "aarav",
    'subject': "flutter",
    "score": 89,
  };

  //add new pair in existing map

  print("map ::: ${studentMap}");

  studentMap["tecnology"] = "mobile";
  print("map ::: ${studentMap}");

  studentMap["score"] = 52;
  print("map ::: ${studentMap}");

  studentMap["name"] = "divy";
  print("map ::: ${studentMap}");

  //check the field is exist ya not
  if (studentMap.containsKey("score")) {
    print("pair is avelable");
  } else {
    print("not aveleble");
  }

  // finde the keys and values or lengths
  print(studentMap.keys);
  print(studentMap.values);
  print(studentMap.length);
}
