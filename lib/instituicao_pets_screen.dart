import 'package:flutter/material.dart';
import 'instituicao_pets_adotados_screen.dart';
import 'instituicao_cadastro_pet_screen.dart';
import 'instituicao_transferencia_tutela_screen.dart';

class InstituicaoPetsScreen extends StatelessWidget {
  const InstituicaoPetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Esperando por um Lar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[400],
        elevation: 2,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InstituicaoPetsAdotadosScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[
          _PetCard(
            nome: 'Bolt',
            especie: 'Cachorro',
            raca: 'Border Collie',
            idade: '3 anos',
            foto: 'assets/images/bolt_border_collie.jpg',
          ),
          _PetCard(
            nome: 'Luna',
            especie: 'Gato',
            raca: 'Persa',
            idade: '4 meses',
            foto: 'assets/images/luna_persa.jpg',
          ),
          _PetCard(
            nome: 'Max',
            especie: 'Cachorro',
            raca: 'Labrador',
            idade: '5 anos',
            foto: 'assets/images/max_labrador.jpg',
          ),
          _PetCard(
            nome: 'Amora',
            especie: 'Gato',
            raca: 'SRD',
            idade: '1 ano',
            foto: 'assets/images/amora_srd.jpg',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InstituicaoCadastroPetScreen(),
            ),
          );
        },
        backgroundColor: Colors.blue[300],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _PetCard extends StatelessWidget {
  final String nome;
  final String especie;
  final String raca;
  final String idade;
  final String? foto;

  const _PetCard({
    Key? key,
    required this.nome,
    required this.especie,
    required this.raca,
    required this.idade,
    this.foto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
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
                          : const Icon(
                            Icons.pets,
                            size: 40,
                            color: Colors.grey,
                          ),
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
                      Text('Idade: $idade'),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.home_outlined, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => InstituicaoTransferenciaTutelaScreen(
                              codigoAnimal: nome,
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                print('Detalhes de $nome');
              },
              child: const Text('Ver Detalhes'),
            ),
          ],
        ),
      ),
    );
  }
}
