import 'package:expense_tracker/Screens/Auth_Screens/Login_page.dart';
import 'package:expense_tracker/Services/shared_pref_service.dart';
import 'package:expense_tracker/Services/theme_service.dart';
import 'package:expense_tracker/Widgets/Bottom_Navigation.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  bool isLoggedIn = await SharedPrefService.getLoginStatus();

  await ThemeService.loadTheme(); // ✅ load saved theme before app starts

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeService.themeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xfff8fafc),
            primaryColor: const Color(0xff10b981),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff10b981),
              brightness: Brightness.light,
            ),
            cardColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff10b981),
              foregroundColor: Colors.white,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor: Color(0xff10b981),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              elevation: 10,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xff121212),
            primaryColor: const Color(0xff10b981),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff10b981),
              brightness: Brightness.dark,
            ),
            cardColor: const Color(0xff1e1e1e),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff10b981),
              foregroundColor: Colors.white,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xff1A1A1A),
              selectedItemColor: Color(0xff10b981),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              elevation: 10,
            ),
          ),
          home: isLoggedIn ? BottomNavigationWidget() : LoginPage(),
        );
      },
    );
  }
}
