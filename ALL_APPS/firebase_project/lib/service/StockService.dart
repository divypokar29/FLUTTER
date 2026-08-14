import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/StockModel.dart';

class Stockservice {
  Future<void> addstockTrangeaction(StockModel stockmodel) async {
    await FirebaseFirestore.instance
        .collection("StockTrangeaction")
        .add(stockmodel.toMap());
  }
}
