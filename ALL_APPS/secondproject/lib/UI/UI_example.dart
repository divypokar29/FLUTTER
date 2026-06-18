import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      appBar: AppBar(
        title: Center(child: Text("Screen 1")),
        backgroundColor: Colors.deepOrange[100],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 8,
            ),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 177, 165),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  "Strawberry Pavlova",
                  style: TextStyle(
                    fontSize: 36,
                    color: const Color.fromARGB(255, 102, 86, 86),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 177, 165),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "If you are looking for placeholder text to fill a layout, design, or document, there are several standard ways to generate it.",
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 102, 86, 86),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 177, 165),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                      ],
                    ),

                    Text("170 Reviews"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 177, 165),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.book_online_outlined),
                      Text("PREPT:"),
                      Text("25 min"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.lock_clock),
                      Text("COOK:"),
                      Text("1 hr"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.kitchen),
                      Text("SERVINGS:"),
                      Text("4-6"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
