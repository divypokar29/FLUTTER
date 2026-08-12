import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/SuplierModel.dart';
import 'package:flutter/material.dart';

class SuplierService {
  Future<void> addsuplier(Supliermodel Suplier) async {
    await FirebaseFirestore.instance.collection("suplier").add(Suplier.toMap());
  }

  Stream<List<Supliermodel>> fetchSuplier() {
    return FirebaseFirestore.instance.collection("suplier").snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return Supliermodel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> updateSuplier(Supliermodel Suplier) async {
    return await FirebaseFirestore.instance
        .collection("suplier")
        .doc(Suplier.id)
        .update(Suplier.toMap()); 
  }
}
