import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> resetPassword() async {
    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter your emial")));
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent successfully."),
        ),
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong.";

      if (e.code == "user-not-found") {
        message = "No account found with this email.";
      } else if (e.code == "invalid-email") {
        message = "Invalid email address.";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
                "Forgot Password?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),

              Image.asset(
                "assets/images/forgot_icon.png",
                height: 250,
                width: 250,
              ),
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

              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xff4a6cfc),
                  ),
                  onPressed: isLoading ? null : resetPassword,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Send Reset Email",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Back to ", style: TextStyle(fontSize: 12)),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 12, color: Color(0xff4a6cfc)),
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
