import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class TutorAgendamentosConsolidadoScreen extends StatefulWidget {
  const TutorAgendamentosConsolidadoScreen({Key? key}) : super(key: key);

  @override
  _TutorAgendamentosConsolidadoScreenState createState() =>
      _TutorAgendamentosConsolidadoScreenState();
}

class _TutorAgendamentosConsolidadoScreenState
    extends State<TutorAgendamentosConsolidadoScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  Map<DateTime, List<Map<String, String>>> _groupedEvents = {};

  @override
  void initState() {
    super.initState();
    _loadStaticEvents();
  }

  void _loadStaticEvents() {
    _groupedEvents = {
      DateTime.parse('2025-04-22'): [
        {
          'tipo': 'Consulta',
          'descricao': 'Revisão geral (Rex)',
          'veterinario': 'Dr. João',
        },
      ],
      DateTime.parse('2025-05-10'): [
        {
          'tipo': 'Vacinação',
          'descricao': 'Vacina da raiva (Rex)',
          'veterinario': 'Dra. Ana',
        },
      ],
      DateTime.parse('2025-04-15'): [
        {
          'tipo': 'Vacinação',
          'descricao': 'Reforço da V10 (Rex)',
          'veterinario': 'Dr. Pedro',
        },
      ],
      DateTime.parse('2025-04-10'): [
        {
          'tipo': 'Vermifugação',
          'descricao': 'Drontal Plus (Rex)',
          'veterinario': 'Dr. João',
        },
      ],
      DateTime.parse('2025-04-05'): [
        {
          'tipo': 'Consulta',
          'descricao': 'Check-up (Rex)',
          'veterinario': 'Dra. Ana',
        },
      ],
      DateTime.parse('2025-04-25'): [
        {
          'tipo': 'Banho',
          'descricao': 'Banho e tosa (Mia)',
          'veterinario': 'Pet Shop',
        },
      ],
      DateTime.parse('2025-05-05'): [
        {
          'tipo': 'Consulta',
          'descricao': 'Acompanhamento (Mia)',
          'veterinario': 'Dr. Carlos',
        },
      ],
      DateTime.parse('2025-04-18'): [
        {
          'tipo': 'Vacinação',
          'descricao': 'Quádrupla Felina (Mia)',
          'veterinario': 'Dra. Laura',
        },
      ],
      DateTime.parse('2025-04-12'): [
        {
          'tipo': 'Consulta',
          'descricao': 'Pós-operatório (Mia)',
          'veterinario': 'Dr. Pedro',
        },
      ],
      DateTime.parse('2025-04-08'): [
        {
          'tipo': 'Doença',
          'descricao': 'Cicatrizada (Mia)',
          'veterinario': 'Dr. Pedro',
        },
      ],
    };
  }

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return _groupedEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            eventLoader: _getEventsForDay,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isNotEmpty) {
                  return _buildEventsMarker(events.length);
                }
                return null;
              },
            ),
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: 20),
          Text(
            'Eventos do dia ${_selectedDay != null ? _dateFormat.format(_selectedDay!) : 'selecionado'}',
          ),
          _selectedDay != null
              ? Column(
                children:
                    _getEventsForDay(_selectedDay!).map((evento) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.event, color: Colors.blue),
                          title: Text(evento['descricao']!),
                          subtitle: Text(
                            '${evento['tipo']} - ${evento['veterinario'] ?? "Não informado"}',
                          ),
                        ),
                      );
                    }).toList(),
              )
              : Text('Selecione um dia para ver os eventos.'),
        ],
      ),
    );
  }

  Widget _buildEventsMarker(int eventCount) {
    return Positioned(
      right: 1,
      bottom: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue[400]!.withOpacity(0.8),
        ),
        width: 16.0,
        height: 16.0,
        child: Center(
          child: Text(
            '$eventCount',
            style: const TextStyle(color: Colors.white, fontSize: 10.0),
          ),
        ),
      ),
    );
  }
}
