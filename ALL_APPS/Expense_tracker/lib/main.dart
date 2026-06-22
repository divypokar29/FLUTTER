import 'package:expense_tracker/Screens/Auth_Screens/Login_page.dart';
import 'package:expense_tracker/Screens/Deshbord_screen.dart';
import 'package:expense_tracker/Services/shared_pref_service.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  bool isLoggedIn = await SharedPrefService.getLoginStatus();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? Dashbordscreen() : LoginPage(),
    );
  }
}
