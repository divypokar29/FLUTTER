import 'package:flutter/material.dart';

class myTodoCard extends StatefulWidget {
  int? id;
  String? title;
  String? description;
  String? category;
  String? priority;
  String? status;
  String? duedate;
  String? createdAt;

  myTodoCard({
    super.key,
    required this.category,
    required this.title,
    required this.description,
    required this.id,
    required this.priority,
    required this.status,
    required this.createdAt,
    required this.duedate,
  });

  @override
  State<myTodoCard> createState() => _myTodoCardState();
}

class _myTodoCardState extends State<myTodoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: const Color.fromARGB(255, 2, 32, 61),
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 137, 137, 137),
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 20,
                child: Container(
                  child: Text(
                    "${widget.title}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 45,
                left: 20,
                child: Container(
                  child: Text(
                    "${widget.description}",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 155, 155, 155),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.only(top: 90),
                  child: Divider(
                    color: Colors.white,
                    height: 20,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 150, 144),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${widget.priority}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 110,
                left: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 133, 29),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${widget.status}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 110,
                left: 120,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 215, 231, 69),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${widget.category}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 110,
                right: 20,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${widget.duedate}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 105,
                left: 200,
                child: Container(

                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
