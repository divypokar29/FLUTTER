class Productmodel {
  String? id;
  String? productName;
  String? productcategory;
  int? productqty;
  double? productPrice;
  String? description;

  Productmodel({
    this.id,
    required this.productName,
    required this.productcategory,
    required this.productPrice,
    required this.productqty,
    required this.description
  });

  Map<String, dynamic> toMap() {
    return {
      "productName": productName,
      "productcategory": productcategory,
      "productPrice": productPrice,
      "productqty": productqty,
      "description" :description,
    };
  }

  factory Productmodel.fromJson(Map<String, dynamic> map, String documentId) {
    return Productmodel(
      id: documentId,
      productName: map["productName"],
      productcategory: map["productcategory"],
      productPrice: (map["productPrice"] as num).toDouble(),
      productqty: (map["productqty"] as num).toInt(),
      description: map["description"]
    );
  }
}
