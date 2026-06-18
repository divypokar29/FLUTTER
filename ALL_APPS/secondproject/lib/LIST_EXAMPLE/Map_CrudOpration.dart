import 'package:flutter/material.dart';

class MapCrudopration extends StatefulWidget {
  const MapCrudopration({super.key});

  @override
  State<MapCrudopration> createState() => _MapCrudoprationState();
}

class _MapCrudoprationState extends State<MapCrudopration> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _imagecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();

  String? foodtype = null;

  List<Map<String, dynamic>> foodList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("Map card"),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue[100],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                        hintText: "Enter food name",
                        label: Text('food name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _imagecontroller,
                      decoration: InputDecoration(
                        hintText: "Enter food name",
                        label: Text('food name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _pricecontroller,
                      decoration: InputDecoration(
                        hintText: "Enter Price",
                        label: Text('food Price'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    value: "Veg",
                    groupValue: foodtype,
                    title: Text("Veg"),
                    onChanged: (value) {
                      setState(() {
                        foodtype = value;
                      });
                    },
                  ),
                  RadioListTile(
                    value: "Non-veg",
                    groupValue: foodtype,
                    title: Text("Non-veg"),
                    onChanged: (value) {
                      setState(() {
                        foodtype = value;
                      });
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Map<String, dynamic> myMap = {};

                          myMap["product_name"] =
                              _namecontroller.text.toString();
                          myMap["image_link"] =
                              _imagecontroller.text.toString();
                          myMap["price"] = _pricecontroller.text.toString();
                          myMap["food-type"] = foodtype;

                          foodList.add(myMap);

                          print(
                            "----------------->>> food list ::: ${foodList}",
                          );

                          _namecontroller.clear();
                          _imagecontroller.clear();
                          _pricecontroller.clear();

                          foodtype = null;
                        });
                      },
                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return Card(
                  color:
                      foodList[index]["food-type"] == "Veg"
                          ? Colors.green[300]
                          : Colors.red[300],
                  child: ListTile(
                    leading: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          "${foodList[index]["image_link"]}",
                          fit: BoxFit.fill,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    title: Text("${foodList[index]["product_name"]}"),
                    subtitle: Text("Rs. ${foodList[index]["price"]}"),
                    trailing: Wrap(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              foodList.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
