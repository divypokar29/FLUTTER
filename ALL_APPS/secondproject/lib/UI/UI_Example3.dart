import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  TextEditingController _emalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 120,
          width: MediaQuery.of(context).size.width - 120,
          child: Card(
            color: Colors.deepOrange[100],
            child: Column(
              children: [
                SizedBox(height: 100),
                Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 30, color: Colors.deepOrange[500]),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _emalController,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter Maile",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 175, 125, 110),
                    ),
                    onPressed: () {
                      setState(() {
                        email = _emalController.text.toString();
                      });
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 239, 202, 202),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "$email",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
