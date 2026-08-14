import 'package:firebase_project/models/ProductModel.dart';
import 'package:firebase_project/service/product_service.dart';
import 'package:flutter/material.dart';

class AddStocktrangeaction extends StatefulWidget {
  const AddStocktrangeaction({super.key});

  @override
  State<AddStocktrangeaction> createState() => _AddStocktrangeactionState();
}

class _AddStocktrangeactionState extends State<AddStocktrangeaction> {
  ProductService productService = ProductService();
  String? selectedProduc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADD Stock"), backgroundColor: Colors.teal),
      body: Column(
        children: [
          StreamBuilder<List<Productmodel>>(
            stream: productService.fetchProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text("No Product Found");
              }

              final categories = snapshot.data!;

              return Padding(
                padding: const EdgeInsets.all(12),
                child: DropdownButtonFormField<String>(
                  value: selectedProduc,
                  decoration: InputDecoration(
                    labelText: "Produc",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: categories.map((product) {
                    return DropdownMenuItem<String>(
                      value: product.productName,
                      child: Text(product.productName!),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedProduc = value;
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
