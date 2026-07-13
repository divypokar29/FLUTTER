class Postmodel {
  int? userId;
  int? id;
  String? title;
  String? body;

  Postmodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  //we have to crete factory contructor

  // from jsondata to dart object

  factory Postmodel.fromJson(Map<String, dynamic> myjson) {
    return Postmodel(
      userId: myjson['userId'],
      id: myjson['id'],
      title: myjson['title'],
      body: myjson['body'],
    );
  }
}
