class Supliermodel {
  String? id;
  String? suplierName;
  String? email;
  String? contact;

  Supliermodel({
    this.id,
    required this.suplierName,
    required this.email,
    required this.contact,
  });

  Map<String, dynamic> toMap() {
    return {"suplierName": suplierName, "email": email, "contact": contact};
  }

  factory Supliermodel.fromJson(Map<String, dynamic> map, String documentId) {
    return Supliermodel(
      id: documentId,
      suplierName: map["suplierName"],
      email: map["email"],
      contact: map["contact"],
    );
  }
}
