import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PetHistoricoTab extends StatelessWidget {
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> petData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final String nomePet = petData['nome'] as String? ?? '';

    final List<Map<String, String>> historicoRex = [
      {
        'data': '2025-04-15',
        'tipo': 'Vacinação',
        'descricao': 'Reforço da V10 aplicado.',
        'veterinario': 'Dr. Pedro Alves',
      },
      {
        'data': '2025-04-10',
        'tipo': 'Vermifugação',
        'descricao': 'Administração de Drontal Plus.',
        'veterinario': 'Dr. João Silva',
      },
      {
        'data': '2025-04-05',
        'tipo': 'Consulta',
        'descricao': 'Check-up de rotina. Tudo ok.',
        'veterinario': 'Dra. Ana Souza',
      },
      {
        'data': '2025-03-25',
        'tipo': 'Vacinação',
        'descricao': 'Vacina V10 aplicada.',
        'veterinario': 'Dr. Pedro Alves',
      },
      {
        'data': '2025-03-20',
        'tipo': 'Vermifugação',
        'descricao': 'Administração de Drontal Puppy.',
        'veterinario': 'Dr. João Silva',
      },
      {
        'data': '2025-03-15',
        'tipo': 'Doença',
        'descricao': 'Otite. Tratamento com antibiótico.',
        'veterinario': 'Dr. Carlos Mendes',
      },
      {
        'data': '2025-03-10',
        'tipo': 'Consulta',
        'descricao': 'Consulta de rotina.',
        'veterinario': 'Dra. Ana Souza',
      },
      {
        'data': '2025-02-28',
        'tipo': 'Vacinação',
        'descricao': 'Vacina Giárdia.',
        'veterinario': 'Dr. João Silva',
      },
      {
        'data': '2025-02-20',
        'tipo': 'Vacinação',
        'descricao': 'Vacina Gripe Canina.',
        'veterinario': 'Dra. Carla Mendes',
      },
      {
        'data': '2025-02-10',
        'tipo': 'Vacinação',
        'descricao': 'Vacina Raiva.',
        'veterinario': 'Dra. Ana Souza',
      },
      {
        'data': '2025-02-05',
        'tipo': 'Vermifugação',
        'descricao': 'Administração de Endogard.',
        'veterinario': 'Dra. Ana Souza',
      },
    ];

    final List<Map<String, String>> historicoMia = [
      {
        'data': '2025-04-18',
        'tipo': 'Vacinação',
        'descricao': 'Reforço da Quádrupla Felina.',
        'veterinario': 'Dra. Carla Mendes',
      },
      {
        'data': '2025-04-12',
        'tipo': 'Consulta',
        'descricao': 'Acompanhamento pós-operatório.',
        'veterinario': 'Dr. Pedro Alves',
      },
      {
        'data': '2025-04-08',
        'tipo': 'Doença',
        'descricao': 'Pequena ferida na pata cicatrizada.',
        'veterinario': 'Dr. Pedro Alves',
      },
      {
        'data': '2025-04-01',
        'tipo': 'Vermifugação',
        'descricao': 'Administração de Milbemax.',
        'veterinario': 'Dr. Carlos Mendes',
      },
      {
        'data': '2025-03-28',
        'tipo': 'Vacinação',
        'descricao': 'Vacina Raiva.',
        'veterinario': 'Dr. Pedro Alves',
      },
      {
        'data': '2025-03-22',
        'tipo': 'Consulta',
        'descricao': 'Check-up anual.',
        'veterinario': 'Dr. João Silva',
      },
      {
        'data': '2025-03-18',
        'tipo': 'Vacinação',
        'descricao': 'Vacina Quádrupla Felina.',
        'veterinario': 'Dra. Carla Mendes',
      },
      {
        'data': '2025-03-12',
        'tipo': 'Vermifugação',
        'descricao': 'Administração de Profender.',
        'veterinario': 'Dra. Ana Souza',
      },
      {
        'data': '2025-03-08',
        'tipo': 'Doença',
        'descricao': 'Pequena ferida na pata. Limpeza.',
        'veterinario': 'Dr. Pedro Alves',
      },
      {
        'data': '2025-03-01',
        'tipo': 'Consulta',
        'descricao': 'Check-up anual. Vermífugo aplicado.',
        'veterinario': 'Dr. João Silva',
      },
      {
        'data': '2025-02-25',
        'tipo': 'Vacinação',
        'descricao': 'Vacina Tríplice Felina.',
        'veterinario': 'Dra. Ana Souza',
      },
    ];

    List<Map<String, String>> getHistorico(String petNome) {
      List<Map<String, String>> historico = [];
      if (petNome == 'Rex') {
        historico = historicoRex;
      } else if (petNome == 'Mia') {
        historico = historicoMia;
      }
      historico.sort(
        (a, b) =>
            DateTime.parse(b['data']!).compareTo(DateTime.parse(a['data']!)),
      );
      return historico;
    }

    final List<Map<String, String>> listaHistorico = getHistorico(nomePet);

    return listaHistorico.isEmpty
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.notes, size: 80, color: Colors.grey[400]),
              SizedBox(height: 20),
              Text(
                'Nenhum histórico clínico registrado para $nomePet ainda.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        )
        : ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: listaHistorico.length,
          itemBuilder: (context, index) {
            final itemHistorico = listaHistorico[index];
            final dataFormatada = _dateFormat.format(
              DateTime.parse(itemHistorico['data']!),
            );
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.event_note, color: Colors.blue[400]),
                title: Text(
                  itemHistorico['descricao']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data: $dataFormatada (${itemHistorico['tipo']})'),
                    if (itemHistorico['veterinario'] != null &&
                        itemHistorico['veterinario']!.isNotEmpty)
                      Text('Veterinário: ${itemHistorico['veterinario']}')
                    else
                      Text('Veterinário: Não informado'),
                  ],
                ),
              ),
            );
          },
        );
  }
}
