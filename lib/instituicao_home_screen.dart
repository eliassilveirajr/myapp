import 'package:flutter/material.dart';
import 'instituicao_perfil_screen.dart';
import 'instituicao_pets_screen.dart';

class InstituicaoHomeScreen extends StatefulWidget {
  const InstituicaoHomeScreen({Key? key}) : super(key: key);

  @override
  _InstituicaoHomeScreenState createState() => _InstituicaoHomeScreenState();
}

class _InstituicaoHomeScreenState extends State<InstituicaoHomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const InstituicaoPerfilScreen(),
      const InstituicaoPetsScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patas e Focinhos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[400],
        elevation: 2,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey[200]!],
          ),
        ),
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[400],
        elevation: 4,
      ),
    );
  }
}
