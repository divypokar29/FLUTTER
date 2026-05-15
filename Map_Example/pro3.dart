void main() {
  Map<String, dynamic> studentMap = {
    'username': "u101",
    'email': "a@gmail.com",
    'name': "aarav",
    'subject': "flutter",
    "score": 89,
  };

  studentMap.forEach((key, value) {
    print("${key} = ${value}");
  });
}
