import 'package:flutter/material.dart';
import 'pet_details_screen.dart';

class ListaPetsTab extends StatelessWidget {
  final List<Map<String, String>> pets = [
    {'nome': 'Rex', 'especie': 'Cachorro'},
    {'nome': 'Mia', 'especie': 'Gato'},
  ];

  List<String> getNomesDosPets() {
    return pets.map((pet) => pet['nome']!).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Adicionar Pet');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green[400],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final String petNome = pets[index]['nome']!;
          final String foto =
              (petNome == 'Rex')
                  ? 'assets/images/foto_rex.jpg'
                  : (petNome == 'Mia')
                  ? 'assets/images/foto_mia.jpg'
                  : 'assets/images/foto_pet_placeholder_thumb.png';

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(foto),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                petNome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Espécie: ${pets[index]['especie']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetDetailsScreen(petNome: petNome),
                    settings: RouteSettings(
                      arguments: {
                        'nome': petNome,
                        'especie': pets[index]['especie'],
                        'raca':
                            (petNome == 'Rex') ? 'Golden Retriever' : 'Persa',
                        'dataNascimento':
                            (petNome == 'Rex') ? '17/03/2018' : '05/01/2020',
                        'foto':
                            (petNome == 'Rex')
                                ? 'assets/images/foto_rex.jpg'
                                : 'assets/images/foto_mia.jpg',
                      },
                    ),
                  ),
                );
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
