import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/CategoryModel.dart';
import 'package:firebase_project/service/Category_service.dart';
import 'package:flutter/material.dart';

class AddCategoty extends StatefulWidget {
  const AddCategoty({super.key});

  @override
  State<AddCategoty> createState() => _AddCategotyState();
}

class _AddCategotyState extends State<AddCategoty> {
  TextEditingController _categoryNameController = TextEditingController();

  CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Category")),
      body: Column(
        children: [
          TextField(
            controller: _categoryNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Enter Category",
              labelText: "Category",
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              CategoryModel _categoryModel = CategoryModel(
                categoryName: _categoryNameController.text.toString(),
              );

              await _categoryService.addcategory(_categoryModel);
            },
            child: Text("Add category"),
          ),
        ],
      ),
    );
  }
}
