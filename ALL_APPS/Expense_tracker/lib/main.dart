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
            useMaterial3: true,
            brightness: Brightness.light,

            primaryColor: const Color(0xff10B981),

            scaffoldBackgroundColor: const Color(0xffF8FAFC),

            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff10B981),
              brightness: Brightness.light,
            ),

            cardColor: Colors.white,

            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff10B981),
              foregroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
            ),

            cardTheme: CardThemeData(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),

            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color(0xff10B981),
              foregroundColor: Colors.white,
            ),

            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Color(0xff10B981),
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              elevation: 8,
            ),

            dividerColor: Colors.grey,

            textTheme: const TextTheme(
              displayLarge: TextStyle(color: Colors.black),
              displayMedium: TextStyle(color: Colors.black),
              displaySmall: TextStyle(color: Colors.black),

              headlineLarge: TextStyle(color: Colors.black),
              headlineMedium: TextStyle(color: Colors.black),
              headlineSmall: TextStyle(color: Colors.black),

              titleLarge: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(color: Colors.black),
              titleSmall: TextStyle(color: Colors.black54),

              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black87),
              bodySmall: TextStyle(color: Colors.black54),

              labelLarge: TextStyle(color: Colors.black),
              labelMedium: TextStyle(color: Colors.black54),
              labelSmall: TextStyle(color: Colors.black45),
            ),
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,

            primaryColor: const Color(0xff10B981),

            scaffoldBackgroundColor: const Color(0xff121212),

            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff10B981),
              brightness: Brightness.dark,
            ),

            cardColor: const Color(0xff1E1E1E),

            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff10B981),
              foregroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
            ),

            cardTheme: CardThemeData(
              color: const Color(0xff1E1E1E),
              elevation: 5,
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),

            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color(0xff10B981),
              foregroundColor: Colors.white,
            ),

            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xff1A1A1A),
              selectedItemColor: Color(0xff10B981),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              elevation: 8,
            ),

            dividerColor: Colors.white24,

            textTheme: const TextTheme(
              displayLarge: TextStyle(color: Colors.white),
              displayMedium: TextStyle(color: Colors.white),
              displaySmall: TextStyle(color: Colors.white),

              headlineLarge: TextStyle(color: Colors.white),
              headlineMedium: TextStyle(color: Colors.white),
              headlineSmall: TextStyle(color: Colors.white),

              titleLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(color: Colors.white),
              titleSmall: TextStyle(color: Colors.white70),

              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white70),
              bodySmall: TextStyle(color: Colors.white60),

              labelLarge: TextStyle(color: Colors.white),
              labelMedium: TextStyle(color: Colors.white70),
              labelSmall: TextStyle(color: Colors.white60),
            ),
          ),
          home: isLoggedIn ? BottomNavigationWidget() : LoginPage(),
        );
      },
    );
  }
}
