import 'package:flutter/material.dart';

class GallertScreen extends StatefulWidget {
  const GallertScreen({super.key});

  @override
  State<GallertScreen> createState() => _GallertScreenState();
}

class _GallertScreenState extends State<GallertScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      child: Center(child: Text("Gallery")),
    );
  }
}
