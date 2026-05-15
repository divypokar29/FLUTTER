void main() {
  //Map<keydatatype,valuedatatype> variable = {};
  Map<String, dynamic> studentMap = {
    'username': "u101",
    'email': "a@gmail.com",
    'name': "aarav",
    'subject': "flutter",
    "score": 89,
  };

  print("Student Map : ${studentMap}");

  /* access map element using of key */

  print("Name : ${studentMap["name"]}");

  print("Email : ${studentMap["email"]}");

  print("Score : ${studentMap["score"]}");
}
