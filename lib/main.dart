import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/database_helper.dart';
import 'package:moonshine_fe/screens/home_screen.dart';

void main() {
  DatabaseHelper().connectDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // GPS?
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: 'Georgia'),
          titleMedium: TextStyle(fontFamily: 'Georgia'),
          titleSmall: TextStyle(fontFamily: 'Georgia'),
          bodyLarge: TextStyle(fontFamily: 'Georgia'),
          bodyMedium: TextStyle(fontFamily: 'Georgia'),
          bodySmall: TextStyle(fontFamily: 'Georgia'),
        ),
        // primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black87,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}
