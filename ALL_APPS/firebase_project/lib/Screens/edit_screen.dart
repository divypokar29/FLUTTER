import 'package:flutter/material.dart';
import 'package:firebase_project/models/ProductModel.dart';
import 'package:firebase_project/Screens/home_screen.dart';
import 'package:firebase_project/service/product_service.dart';

class EditScreen extends StatefulWidget {
  final Productmodel Product;
  EditScreen({super.key, required this.Product});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _qtyController = TextEditingController();
  TextEditingController _descreptionController = TextEditingController();
  ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();

    _productNameController.text = widget.Product.productName.toString();
    _categoryController.text = widget.Product.productcategory.toString();
    _priceController.text = widget.Product.productPrice.toString();
    _qtyController.text = widget.Product.productqty.toString();
    _descreptionController.text = widget.Product.description.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff4a6cfc),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Center(
                  child: Text(
                    "Edit product",
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
              padding: const EdgeInsets.all(12),
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
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  hintText: "Enter Category",
                  labelText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
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
              padding: const EdgeInsets.all(12),
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
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: _descreptionController,
                decoration: InputDecoration(
                  hintText: "Enter Description",
                  labelText: "Description",
                  hintMaxLines: 2,
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
                  id: widget.Product.id,
                  productName: _productNameController.text.toString(),
                  productcategory: _categoryController.text.toString(),
                  productPrice: double.parse(_priceController.text.toString()),
                  productqty: int.parse(_qtyController.text.toString()),
                  description: _descreptionController.text.toString(),
                );
                await _productService.updateProduct(_productModel);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text(
                "Save product",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
