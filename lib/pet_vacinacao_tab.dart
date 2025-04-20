import 'package:flutter/material.dart';

class PetVacinacaoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> petData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final String nomePet = petData['nome'] as String? ?? '';

    final List<Map<String, String>> vacinasRex = [
      {'nome': 'V8', 'data': '20/05/2018', 'aplicador': 'Dr. João Silva'},
      {'nome': 'Raiva', 'data': '15/04/2019', 'aplicador': 'Dra. Ana Souza'},
      {'nome': 'V10', 'data': '25/05/2019', 'aplicador': 'Dr. Pedro Alves'},
      {
        'nome': 'Gripe Canina',
        'data': '10/06/2020',
        'aplicador': 'Dra. Carla Mendes',
      },
      {'nome': 'Giárdia', 'data': '01/07/2020', 'aplicador': 'Dr. João Silva'},
    ];

    final List<Map<String, String>> vacinasMia = [
      {
        'nome': 'Tríplice Felina',
        'data': '10/02/2020',
        'aplicador': 'Dra. Ana Souza',
      },
      {'nome': 'Raiva', 'data': '05/03/2021', 'aplicador': 'Dr. Pedro Alves'},
      {
        'nome': 'Quádrupla Felina',
        'data': '15/02/2021',
        'aplicador': 'Dra. Carla Mendes',
      },
      {
        'nome': 'Leucemia Felina',
        'data': '28/03/2022',
        'aplicador': 'Dr. João Silva',
      },
    ];

    final List<Map<String, String>> vermifugacaoRex = [
      {
        'data': '05/04/2018',
        'produto': 'Drontal Puppy',
        'veterinario': 'Dr. João Silva',
      },
      {
        'data': '12/07/2018',
        'produto': 'Endogard',
        'veterinario': 'Dra. Ana Souza',
      },
      {
        'data': '20/10/2018',
        'produto': 'Drontal Plus',
        'veterinario': 'Dr. Pedro Alves',
      },
    ];

    final List<Map<String, String>> vermifugacaoMia = [
      {
        'data': '15/01/2020',
        'produto': 'Profender',
        'veterinario': 'Dra. Ana Souza',
      },
      {
        'data': '25/05/2020',
        'produto': 'Milbemax',
        'veterinario': 'Dr. Carla Mendes',
      },
    ];

    List<Map<String, String>> getVacinas(String petNome) {
      if (petNome == 'Rex') {
        return vacinasRex;
      } else if (petNome == 'Mia') {
        return vacinasMia;
      } else {
        return [];
      }
    }

    List<Map<String, String>> getVermifugacao(String petNome) {
      if (petNome == 'Rex') {
        return vermifugacaoRex;
      } else if (petNome == 'Mia') {
        return vermifugacaoMia;
      } else {
        return [];
      }
    }

    final List<Map<String, String>> listaVacinas = getVacinas(nomePet);
    final List<Map<String, String>> listaVermifugacao = getVermifugacao(
      nomePet,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vacinação',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          listaVacinas.isEmpty
              ? Text(
                'Nenhuma vacina registrada para $nomePet ainda.',
                style: TextStyle(color: Colors.grey[600]),
              )
              : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listaVacinas.length,
                itemBuilder: (context, index) {
                  final vacina = listaVacinas[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        Icons.local_hospital,
                        color: Colors.red[400],
                      ),
                      title: Text(
                        vacina['nome']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Data: ${vacina['data']}'),
                          Text('Aplicador: ${vacina['aplicador']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
          SizedBox(height: 20),
          Text(
            'Vermifugação',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          listaVermifugacao.isEmpty
              ? Text(
                'Nenhum protocolo de vermifugação registrado para $nomePet ainda.',
                style: TextStyle(color: Colors.grey[600]),
              )
              : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listaVermifugacao.length,
                itemBuilder: (context, index) {
                  final vermifugo = listaVermifugacao[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.healing, color: Colors.orange[400]),
                      title: Text(
                        vermifugo['produto']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Data: ${vermifugo['data']}'),
                          Text('Veterinário: ${vermifugo['veterinario']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
        ],
      ),
    );
  }
}
