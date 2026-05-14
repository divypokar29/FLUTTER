import 'package:flutter/material.dart';

class SercheExample extends StatefulWidget {
  const SercheExample({super.key});

  @override
  State<SercheExample> createState() => _SercheExampleState();
}

class _SercheExampleState extends State<SercheExample> {
  TextEditingController _serchcontroller = TextEditingController();

  List<String> cityList = [
    "Ahemdabade",
    "baroda",
    "jamnagar",
    "rajkot",
    "surat",
    "kutch",
    "anand",
    "mumbai",
    "udaipur",
    "gandhinagar",
    "modasa",
    "arvali",
    "sabarkantha",
    "bhavnagar",
    "morbi",
    "dwarka",
    "diu",
    "daman",
    "bhuj",
    "mandvi",
    "nakhatrana",
    "dahod",
  ];

  List filterlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterlist = cityList;
  }

  void serchData(String value) {
    print("------>>${value}");

    if (value.length > 0) {
      filterlist =
          filterlist.where((cityValue) {
            return cityValue.toLowerCase().contains(value);
          }).toList();

      setState(() {});
    } else {
      setState(() {
        filterlist = cityList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serche Example"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                serchData(value);
              },

              controller: _serchcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                hintText: "Enter city name",
                label: Text("Serch"),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterlist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.blueGrey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${filterlist[index]}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
