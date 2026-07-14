class Studentmodel {
  String? id;
  String? name;
  String? createdAt;
  String? email;
  String? phone;
  String? cource;
  int? semester;
  String? gender;
  String? city;
  int? age;
  String? profileImage;
  bool? isActive;

  Studentmodel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.email,
    required this.phone,
    required this.cource,
    required this.semester,
    required this.gender,
    required this.city,
    required this.age,
    required this.profileImage,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'email': email,
      'phone': phone,
      'cource': cource,
      'semester': semester,
      'gender': gender,
      'city': city,
      'age': age,
      'profileImage': profileImage,
      'isActive': isActive,
    };
  }

  factory Studentmodel.fromJson(Map<String, dynamic> json) {
    return Studentmodel(
      id: json["id"],
      name: json["name"],
      createdAt: json["createdAt"],
      email: json["email"],
      phone: json["phone"],
      cource: json["cource"],
      semester: json["semester"],
      gender: json["gender"],
      city: json["city"],
      age: json["age"],
      profileImage: json["profileImage"],
      isActive: json["isActive"],
    );
  }
}
