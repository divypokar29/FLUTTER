import 'package:expense_tracker/Screens/Auth_Screens/Forgot_Password.dart';
import 'package:expense_tracker/Screens/Auth_Screens/Registration_screen.dart';
import 'package:expense_tracker/Screens/Deshbord_screen.dart';
import 'package:expense_tracker/Services/Auth_service.dart';
import 'package:expense_tracker/Services/shared_pref_service.dart';
import 'package:expense_tracker/Widgets/Bottom_Navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isLogin = false;
bool isLoading = true;

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService authService = AuthService();

  Future<void> Login() async {
    setState(() {
      isLogin = true;
    });

    try {
      await authService.loginUser(
        email: emailController.text,
        password: passwordController.text,
      );
      await SharedPrefService.setLogin(true);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Successful")));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
      );
    } on FirebaseAuthException catch (e) {
      String message = "";

      switch (e.code) {
        case "user-not-found":
          message = "No user found with this email.";
          break;
        case "wrong-password":
          message = "Incorrect password.";
          break;

        case "invalid-email":
          message = "Invalid email address.";
          break;

        case "invalid-credential":
          message = "Invalid email or password.";
          break;

        default:
          message = e.message ?? "Login failed";
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
                "Welcom Back!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text("Login to your account", style: TextStyle()),
              Image.asset("assets/Wallete_2.png", height: 250, width: 250),
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
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff10b981),
                        ),
                      ),
                    ),
                  ],
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
                    Login();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an acoount? ",
                    style: TextStyle(fontSize: 12),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Register",
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
