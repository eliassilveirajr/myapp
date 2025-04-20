import 'package:flutter/material.dart';
import 'pet_info_tab.dart';
import 'pet_vacinacao_tab.dart';
import 'pet_historico_tab.dart';
import 'agendamentos_tab.dart';

class PetDetailsScreen extends StatefulWidget {
  final String petNome;

  const PetDetailsScreen({Key? key, required this.petNome}) : super(key: key);

  @override
  _PetDetailsScreenState createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  int _selectedIndex = 0;
  String? _petImage;
  late List<Widget> _widgetOptions;
  late Map<String, List<Map<String, String>>> _historicoPet;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    final String nomePet = widget.petNome;
    _historicoPet = _getHistoricoPet(nomePet) ?? {};
    _widgetOptions = <Widget>[
      PetInfoTab(),
      PetVacinacaoTab(),
      PetHistoricoTab(),
      AgendamentosTab(historicoPet: _historicoPet),
    ];
  }

  Map<String, List<Map<String, String>>> _getHistoricoPet(String petNome) {
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

    Map<String, List<Map<String, String>>> eventosFormatados = {};
    List<Map<String, String>> historico =
        petNome == 'Rex' ? historicoRex : historicoMia;
    for (var evento in historico) {
      final data = evento['data']!;
      if (eventosFormatados.containsKey(data)) {
        eventosFormatados[data]!.add(evento);
      } else {
        eventosFormatados[data] = [evento];
      }
    }
    return eventosFormatados;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> petData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final String nome = petData['nome'] as String? ?? '';
    _petImage =
        (nome == 'Rex')
            ? 'assets/images/foto_rex.jpg'
            : (nome == 'Mia')
            ? 'assets/images/foto_mia.jpg'
            : 'assets/images/foto_pet_placeholder.png';
  }

  void _changePetImage() {
    print('Alterar foto do pet');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes de ${widget.petNome}',
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
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vaccines_outlined),
            label: 'Vacinação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_outlined),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Agendamentos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[400],
        elevation: 4,
      ),
    );
  }
}
