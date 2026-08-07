class CategoryModel {
  String? id;
  String? categoryName;

  CategoryModel({this.id, required this.categoryName});

  Map<String, dynamic> toMap() {
    return {"categoryName": categoryName};
  }

  factory CategoryModel.fromJson(Map<String, dynamic> map, String documentId) {
    return CategoryModel(id: documentId, categoryName: map["categoryName"]);
  }
}
