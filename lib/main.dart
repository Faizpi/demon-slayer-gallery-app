// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(DemonSlayerApp());

class DemonSlayerApp extends StatelessWidget {
  const DemonSlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kimetsu No Yaiba — Gallery',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: const Color(0xFF1E88E5),
          secondary: const Color(0xFF00ACC1),
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
