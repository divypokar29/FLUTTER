import 'package:firebase_project/Screens/add_categoty.dart';
import 'package:firebase_project/Screens/add_product.dart';
import 'package:firebase_project/Screens/add_suplier.dart';
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
      backgroundColor: Color(0xFF0a1931),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff54acbf),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCategoty()),
                  );
                },
                child: Container(
                  height: 120,
                  width: 180,
                  child: Card(
                    color: Color(0xFF1a3d63),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category_outlined,
                            color: const Color.fromARGB(255, 103, 182, 247),
                          ),
                          Text(
                            "Add category",
                            style: TextStyle(
                              color: Color.fromARGB(255, 103, 182, 247),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProduct()),
                  );
                },
                child: Container(
                  height: 120,
                  width: 180,
                  child: Card(
                    color: Color(0xFF1a3d63),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart_rounded,
                            color: Color.fromARGB(255, 103, 182, 247),
                          ),
                          Text(
                            "Add Product",
                            style: TextStyle(
                              color: Color.fromARGB(255, 103, 182, 247),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddSuplier()),
              );
            },
            child: Container(
              height: 120,
              width: 180,
              child: Card(
                color: Color(0xFF1a3d63),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_shopping_cart_rounded,
                        color: Color.fromARGB(255, 103, 182, 247),
                      ),
                      Text(
                        "Add Suplier",
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 182, 247),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                            color: Color(0xFF4A7fa7),
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
