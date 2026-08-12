import 'package:firebase_project/models/CategoryModel.dart';
import 'package:firebase_project/models/ProductModel.dart';
import 'package:firebase_project/Screens/home_screen.dart';
import 'package:firebase_project/models/SuplierModel.dart';
import 'package:firebase_project/service/Category_service.dart';
import 'package:firebase_project/service/Suplier_service.dart';
import 'package:firebase_project/service/product_service.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _suplierController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _qtyController = TextEditingController();
  TextEditingController _descreptionController = TextEditingController();

  ProductService _productService = ProductService();
  CategoryService _categoryService = CategoryService();
  SuplierService _suplierService = SuplierService();

  String? selectedCategory;
  String? selectedSuplier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff54acbf),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Center(
                  child: Text(
                    "Add product",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 5,
                child: Center(
                  child: CircleAvatar(
                    minRadius: 1,
                    maxRadius: 30,
                    child: Icon(
                      Icons.image_outlined,
                      color: Color(0xff4a6cfc),
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _productNameController,
                decoration: InputDecoration(
                  hintText: "Enter Product Name",
                  labelText: "Product Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            StreamBuilder<List<CategoryModel>>(
              stream: _categoryService.fetchCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("No Category Found");
                }

                final categories = snapshot.data!;

                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category.categoryName,
                        child: Text(category.categoryName!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                        _categoryController.text = value!;
                      });
                    },
                  ),
                );
              },
            ),
            StreamBuilder<List<Supliermodel>>(
              stream: _suplierService.fetchSuplier(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("No Category Found");
                }

                final supliers = snapshot.data!;

                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: DropdownButtonFormField<String>(
                    value: selectedSuplier,
                    decoration: InputDecoration(
                      labelText: "Supliers",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: supliers.map((suplier) {
                      return DropdownMenuItem<String>(
                        value: suplier.suplierName,
                        child: Text(suplier.suplierName!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSuplier = value;
                        _suplierController.text = value!;
                      });
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: "Enter Product Price",
                  labelText: "Product Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _qtyController,
                decoration: InputDecoration(
                  hintText: "Enter Product Quntity",
                  labelText: "Product Quntity",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: _descreptionController,
                decoration: InputDecoration(
                  hintText: "Enter Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(180, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Color(0xff4a6cfc),
              ),
              onPressed: () async {
                Productmodel _productModel = Productmodel(
                  productName: _productNameController.text.toString(),
                  productcategory: _categoryController.text.toString(),
                  productPrice: double.parse(_priceController.text.toString()),
                  productqty: int.parse(_qtyController.text.toString()),
                  description: _descreptionController.text.toString(),
                  suplier: _suplierController.text.toString(),
                );
                await _productService.addProduct(_productModel);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("Add product", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
