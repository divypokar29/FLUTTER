class StudentModel {
  String? createdAt;
  String? name;
  String? subject;
  String? city;
  String? id;

  StudentModel({this.createdAt, this.name, this.subject, this.city, this.id});

  StudentModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    subject = json['subject'];
    city = json['city'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['subject'] = this.subject;
    data['city'] = this.city;
    data['id'] = this.id;
    return data;
  }
}
