import 'package:expense_tracker/Screens/Auth_Screens/Login_page.dart';
import 'package:expense_tracker/Services/Auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final AuthService authService = AuthService();

  Future<void> register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await authService.registerUser(
        email: emailController.text,
        password: passwordController.text,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Successful")));

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case "email-already-in-use":
          message = "Email already exists.";
          break;

        case "weak-password":
          message = "Password should be at least 6 characters.";
          break;

        case "invalid-email":
          message = "Invalid email.";
          break;

        default:
          message = e.message ?? "Registration failed.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8fafc),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text("Sign up to get started", style: TextStyle()),
              Image.asset("assets/Wallete_image.png", height: 250, width: 250),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Color(0xffffffff),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Email",
                    suffixIcon: Icon(Icons.mail_outline_outlined, size: 30),
                    hintText: "Enter your Email",
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Color(0xffffffff),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Password",
                    suffixIcon: Icon(Icons.visibility, size: 30),
                    hintText: "Enter Password",
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Color(0xffffffff),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Confirm Password",
                    suffixIcon: Icon(Icons.visibility, size: 30),
                    hintText: "Renter Password",
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xff10b981),
                  ),
                  onPressed: () {
                    register();
                  },
                  child:
                      isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an acoount? ",
                    style: TextStyle(fontSize: 12),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 12, color: Color(0xff10b981)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
