import 'package:flutter/material.dart';
import 'veterinario_agendamentos_screen.dart';
import 'veterinario_registro_pet_screen.dart';

class VeterinarioHomeScreen extends StatefulWidget {
  const VeterinarioHomeScreen({Key? key}) : super(key: key);

  @override
  _VeterinarioHomeScreenState createState() => _VeterinarioHomeScreenState();
}

class _VeterinarioHomeScreenState extends State<VeterinarioHomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      _DadosVeterinarioTab(),
      VeterinarioAgendamentosScreen(),
      VeterinarioRegistroPetScreen(),
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
          'Meu Perfil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange[400],
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agendamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Registrar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orange[400],
        elevation: 4,
      ),
    );
  }
}

class _DadosVeterinarioTab extends StatelessWidget {
  final String _crmvFixo = 'CRMV-SC 12345';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    'assets/images/foto_perfil_veterinario.png',
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _buildInfoCard(
            title: 'Nome',
            value: 'Dr(a). Mariana Souza',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'CRMV',
            value: _crmvFixo,
            icon: Icons.badge_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'Especialidade',
            value: 'Clínica Geral',
            icon: Icons.medical_services_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'Telefone',
            value: '(47) 98765-4321',
            icon: Icons.phone_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'Email',
            value: 'mariana.souza@email.com',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              print('Editar Perfil do Veterinário');
            },
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            label: const Text(
              'Editar Perfil',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[400],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.orange[400]),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
