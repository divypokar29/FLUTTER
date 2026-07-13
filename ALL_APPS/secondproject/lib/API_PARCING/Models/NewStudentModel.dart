class Newstudentmodel {
  String? name;
  String? email;
  String? subject;
  String? id;

  Newstudentmodel({
    required this.name,
    required this.email,
    required this.subject,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'subject': subject, 'id': id};
  }

  factory Newstudentmodel.fromJson(Map<String, dynamic> json) {
    return Newstudentmodel(
      name: json["name"],
      email: json["email"],
      subject: json["subject"],
      id: json["id"],
    );
  }
}
