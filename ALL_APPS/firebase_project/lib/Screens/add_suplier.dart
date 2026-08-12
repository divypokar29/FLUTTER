import 'package:firebase_project/models/SuplierModel.dart';
import 'package:firebase_project/service/Suplier_service.dart';
import 'package:flutter/material.dart';

class AddSuplier extends StatefulWidget {
  const AddSuplier({super.key});

  @override
  State<AddSuplier> createState() => _AddSuplierState();
}

class _AddSuplierState extends State<AddSuplier> {
  TextEditingController _suplierNameController = TextEditingController();
  TextEditingController _suplierEmailController = TextEditingController();
  TextEditingController _suplierContactController = TextEditingController();

  SuplierService _suplierService = SuplierService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Suplier")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _suplierNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Enter Suplier Name",
                labelText: "Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _suplierEmailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Enter Email",
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _suplierContactController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Enter Contact",
                labelText: "Contact",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                Supliermodel _supliermodel = Supliermodel(
                  suplierName: _suplierNameController.text.toString(),
                  email: _suplierEmailController.text.toString(),
                  contact: _suplierContactController.text.toString(),
                );

                await _suplierService.addsuplier(_supliermodel);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Supplier Successfully added")),
                );
              },
              child: Text("Add Suplier"),
            ),
          ),
        ],
      ),
    );
  }
}
