import 'package:flutter/material.dart';

class InstituicaoPetsAdotadosScreen extends StatelessWidget {
  const InstituicaoPetsAdotadosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Já Encontraram um Lar!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[400],
        elevation: 2,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[
          _PetAdotadoCard(
            nome: 'Rex',
            especie: 'Cachorro',
            raca: 'Golden Retriever',
            dataAdocao: '15/03/2025',
            foto: 'assets/images/foto_rex.jpg',
          ),
          _PetAdotadoCard(
            nome: 'Mia',
            especie: 'Gato',
            raca: 'Siamês',
            dataAdocao: '28/03/2025',
            foto: 'assets/images/foto_mia.jpg',
          ),
        ],
      ),
    );
  }
}

class _PetAdotadoCard extends StatelessWidget {
  final String nome;
  final String especie;
  final String raca;
  final String dataAdocao;
  final String? foto;

  const _PetAdotadoCard({
    Key? key,
    required this.nome,
    required this.especie,
    required this.raca,
    required this.dataAdocao,
    this.foto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child:
                  foto != null
                      ? Image.asset(
                        foto!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 40,
                            color: Colors.grey,
                          );
                        },
                      )
                      : const Icon(Icons.pets, size: 40, color: Colors.grey),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nome: $nome',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Espécie: $especie'),
                  Text('Raça: $raca'),
                  Text('Adotado em: $dataAdocao'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
