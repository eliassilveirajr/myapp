import 'package:flutter/material.dart';
import 'choose_profile_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> _nomesDosPets = ['Rex', 'Mia'];

  @override
  void initState() {
    super.initState();
    // Espera 3 segundos e navega para a ChooseProfileScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseProfileScreen(petNomes: _nomesDosPets),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/CuidePet-logo.jpg',
          width: 450.0,
          height: 450.0,
        ),
      ),
    );
  }
}
