import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/CategoryModel.dart';

class CategoryService {
  Future<void> addcategory(CategoryModel Category) async {
    await FirebaseFirestore.instance
        .collection("category")
        .add(Category.toMap());
  }

  Stream<List<CategoryModel>> fetchCategory() {
    return FirebaseFirestore.instance.collection("category").snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return CategoryModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }
}
