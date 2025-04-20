import 'package:flutter/material.dart';

class InstituicaoPerfilScreen extends StatelessWidget {
  const InstituicaoPerfilScreen({Key? key}) : super(key: key);

  final String _cnpjFicticio = '12.345.678/0001-90';
  final String _enderecoFicticio =
      'Av. Portuária, 132, São Domingos, Navegantes - SC';
  final String _telefoneFicticio = '(47) 3311-1234';
  final String _emailFicticio = 'contato@patasefocinhos.org.br';

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
                CircleAvatar(
                  radius: 70,
                  backgroundImage: const AssetImage(
                    'assets/images/logo_patas_e_focinhos.png',
                  ),
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _buildInfoCard(
            title: 'Nome',
            value: 'Patas e Focinhos',
            icon: Icons.home_work_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'CNPJ',
            value: _cnpjFicticio,
            icon: Icons.badge_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'Telefone',
            value: _telefoneFicticio,
            icon: Icons.phone_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'Endereço',
            value: _enderecoFicticio,
            icon: Icons.location_on_outlined,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'Email',
            value: _emailFicticio,
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 24),
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
            Icon(icon, color: Colors.blue[400]),
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
