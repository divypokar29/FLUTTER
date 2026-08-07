import 'package:firebase_project/Screens/add_categoty.dart';
import 'package:firebase_project/Screens/add_product.dart';
import 'package:firebase_project/Screens/product_detailes_screen.dart';
import 'package:firebase_project/models/ProductModel.dart';
import 'package:firebase_project/service/product_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductService _productService = ProductService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Center(
                child: Text(
                  "Home screen",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCategoty()),
              );
            },
            child: Text("Add category"),
          ),
          Expanded(
            child: StreamBuilder<List<Productmodel>>(
              stream: _productService.fetchProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final products = snapshot.data;

                  return ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      final product = products![index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailesScreen(Product: product),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text("${product.productName}"),
                              leading: CircleAvatar(
                                child: Icon(Icons.shopping_bag_outlined),
                              ),
                              subtitle: Text("${product.productPrice}"),
                              trailing: Column(
                                children: [
                                  Text("Stock :${product.productqty}"),
                                  Text("${product.productcategory}"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProduct()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xff4a6cfc),
      ),
    );
  }
}
