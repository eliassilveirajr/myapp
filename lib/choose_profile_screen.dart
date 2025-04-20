import 'package:flutter/material.dart';
import 'tutor_home_screen.dart';
import 'veterinario_home_screen.dart';
import 'instituicao_home_screen.dart';

class ChooseProfileScreen extends StatelessWidget {
  final List<String> petNomes;

  const ChooseProfileScreen({Key? key, required this.petNomes})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quem você é?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[400],
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Selecione seu perfil:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),
                const SizedBox(height: 32),
                _buildProfileButton(
                  context: context,
                  label: 'Tutor',
                  icon: Icons.person,
                  color: Colors.green[300]!,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutorHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildProfileButton(
                  context: context,
                  label: 'Veterinário',
                  icon: Icons.local_hospital,
                  color: Colors.orange[300]!,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VeterinarioHomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildProfileButton(
                  context: context,
                  label: 'Instituição',
                  icon: Icons.home_work,
                  color: Colors.blue[300]!,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InstituicaoHomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
      ),
    );
  }
}
