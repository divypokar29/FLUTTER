import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Screens/login_screen.dart';
import 'package:firebase_project/service/Authe_service.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final AuthService authService = AuthService();

  Future<bool> register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return false;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await authService.registerUser(
        email: emailController.text,
        password: passwordController.text,
      );

      if (!mounted) return false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Successful")));
      return true;
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

      if (!mounted) return false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      return false;
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Register_icon.png",
                height: 250,
                width: 250,
              ),
              Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text("Sign up to get started", style: TextStyle()),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Color(0xffffffff),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Name",
                    suffixIcon: Icon(Icons.person, size: 30),
                    hintText: "Enter full Name",
                  ),
                ),
              ),
              SizedBox(height: 25),
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
                    backgroundColor: Color(0xff4a6cfc),
                  ),
                  onPressed: () async {
                    final success = await register();
                    if (success && context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                  },
                  child: isLoading
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
