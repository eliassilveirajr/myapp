import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Garanta que a SplashScreen seja importada

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CuidePet',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(), // Define SplashScreen como a tela inicial
    );
  }
}
