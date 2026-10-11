import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DoubtRevisionApp());
}

class DoubtRevisionApp extends StatelessWidget {
  const DoubtRevisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doubt Revision App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
