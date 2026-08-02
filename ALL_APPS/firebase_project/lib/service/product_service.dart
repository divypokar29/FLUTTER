import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/ProductModel.dart';

class ProductService {
  Future<void> addProduct(Productmodel product) async {
    await FirebaseFirestore.instance.collection("Product").add(product.toMap());
  }

  Stream<List<Productmodel>> fetchProduct() {
    return FirebaseFirestore.instance.collection("Product").snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return Productmodel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> deleteProduct(String id) async {
    await FirebaseFirestore.instance.collection("Product").doc(id).delete();
  }

  Future<void> updateProduct(Productmodel product) async {
    await FirebaseFirestore.instance
        .collection("Product")
        .doc(product.id)
        .update({
          "productName": product.productName,
          "productcategory": product.productcategory,
          "productPrice": product.productPrice,
          "productqty": product.productqty,
          "description": product.description,
        });
  }
}
