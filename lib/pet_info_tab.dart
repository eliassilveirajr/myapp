import 'package:flutter/material.dart';

class PetInfoTab extends StatefulWidget {
  @override
  _PetInfoTabState createState() => _PetInfoTabState();
}

class _PetInfoTabState extends State<PetInfoTab> {
  String? _petImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> petData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final String nome = petData['nome'] as String? ?? '';
    setState(() {
      _petImage =
          (nome == 'Rex')
              ? 'assets/images/foto_rex.jpg'
              : (nome == 'Mia')
              ? 'assets/images/foto_mia.jpg'
              : 'assets/images/foto_pet_placeholder.png';
    });
  }

  void _changePetImage() {
    print('Alterar foto do pet');
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> petData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final String nome = petData['nome'] as String? ?? '[Nome do Animal]';
    final String especie =
        petData['especie'] as String? ?? '[Espécie do Animal]';
    final String raca = petData['raca'] as String? ?? '[Raça do Animal]';
    final String dataNascimento =
        petData['dataNascimento'] as String? ?? '[Data]';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      _petImage != null ? AssetImage(_petImage!) : null,
                  backgroundColor: Colors.grey[300],
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: _changePetImage,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.edit, size: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          _buildInfoCard(title: 'Nome', value: nome, icon: Icons.pets_outlined),
          SizedBox(height: 16),
          _buildInfoCard(
            title: 'Espécie',
            value: especie,
            icon: Icons.category_outlined,
          ),
          SizedBox(height: 16),
          _buildInfoCard(title: 'Raça', value: raca, icon: Icons.label_outline),
          SizedBox(height: 16),
          _buildInfoCard(
            title: 'Data de Nascimento',
            value: dataNascimento,
            icon: Icons.calendar_today_outlined,
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
            Icon(icon, color: Colors.green[400]),
            SizedBox(width: 12),
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
                  SizedBox(height: 4),
                  Text(value, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
