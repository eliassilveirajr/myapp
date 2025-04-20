import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class VeterinarioAgendamentosScreen extends StatefulWidget {
  const VeterinarioAgendamentosScreen({Key? key}) : super(key: key);

  @override
  _VeterinarioAgendamentosScreenState createState() =>
      _VeterinarioAgendamentosScreenState();
}

class _VeterinarioAgendamentosScreenState
    extends State<VeterinarioAgendamentosScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy HH:mm');
  Map<DateTime, List<Map<String, String>>> _groupedEvents = {};

  @override
  void initState() {
    super.initState();
    _loadVeterinarioAgendamentos();
  }

  void _loadVeterinarioAgendamentos() {
    _groupedEvents = {
      DateTime.parse('2025-04-22 10:00'): [
        {
          'pet': 'Rex',
          'tutor': 'Fulano',
          'tipo': 'Consulta',
          'descricao': 'Revisão geral',
        },
      ],
      DateTime.parse('2025-04-22 14:30'): [
        {
          'pet': 'Mia',
          'tutor': 'Ciclano',
          'tipo': 'Vacinação',
          'descricao': 'Vacina da raiva',
        },
      ],
      DateTime.parse('2025-04-25 09:00'): [
        {
          'pet': 'Bolinha',
          'tutor': 'Beltrano',
          'tipo': 'Emergência',
          'descricao': 'Ferimento leve',
        },
      ],
      DateTime.parse('2025-04-25 16:00'): [
        {
          'pet': 'Lucky',
          'tutor': 'Fulano',
          'tipo': 'Retorno',
          'descricao': 'Pós-operatório',
        },
      ],
    };
  }

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return _groupedEvents.keys
        .where((k) => isSameDay(k, day))
        .map((k) => _groupedEvents[k]!)
        .expand((i) => i)
        .toList();
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
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
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
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Agendamentos do dia ${_selectedDay != null ? _dateFormat.format(_selectedDay!) : 'selecionado'}',
          ),
          _selectedDay != null
              ? Column(
                children:
                    _getEventsForDay(_selectedDay!).map((agendamento) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.event_note,
                            color: Colors.orange,
                          ),
                          title: Text(
                            '${agendamento['pet']} - ${agendamento['tipo']}',
                          ),
                          subtitle: Text('Tutor: ${agendamento['tutor']}'),
                        ),
                      );
                    }).toList(),
              )
              : const Text('Selecione um dia para ver os agendamentos.'),
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
          color: Colors.orange[400]!.withOpacity(0.8),
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
