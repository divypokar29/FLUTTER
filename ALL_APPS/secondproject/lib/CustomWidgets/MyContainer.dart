import 'package:flutter/material.dart';

class Mycontainer extends StatelessWidget {
  const Mycontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "My Container",
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
      ),
    );
  }
}
