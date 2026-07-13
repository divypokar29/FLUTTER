import 'package:secondproject/API_PARCING/Models/PostModel.dart';

class Commentmodel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Commentmodel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Commentmodel.fromJson(Map<String, dynamic> myjson) {
    return Commentmodel(
      postId: myjson['postId'],
      id: myjson['id'],
      name: myjson['name'],
      email: myjson['email'],
      body: myjson['body'],
    );
  }
}
