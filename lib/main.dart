import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Use Material3 design principles
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 169, 92, 232), // New primary color
          // Define color scheme based on seed color
          primary: Colors.purple.shade400,
          onPrimary: Colors.white,
          secondary: Colors.orangeAccent, // New secondary color
          onSecondary: Colors.white,
          surface: Colors.purple.shade50, // Background color
          onSurface: Colors.black,
          background: Colors.white, // Off-white background
          onBackground: Colors.black,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple.shade700),
          titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.purple.shade600),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.orangeAccent, // Button color
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.purple.shade50,
          prefixIconColor: Colors.purple,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple.shade400,
          foregroundColor: Colors.white,
          elevation: 4.0, // Shadow for AppBar
        ),
      ),
      home: const FirstPage(),
    );
  }
}
