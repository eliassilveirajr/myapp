import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AgendamentosTab extends StatefulWidget {
  final Map<String, List<Map<String, String>>> historicoPet;

  const AgendamentosTab({Key? key, required this.historicoPet})
    : super(key: key);

  @override
  _AgendamentosTabState createState() => _AgendamentosTabState();
}

class _AgendamentosTabState extends State<AgendamentosTab> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    final String formattedDay = DateFormat('yyyy-MM-dd').format(day);
    return widget.historicoPet[formattedDay] ?? [];
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
                  return _buildEventsMarker(events);
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

  Widget _buildEventsMarker(List events) {
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
            '${events.length}',
            style: const TextStyle(color: Colors.white, fontSize: 10.0),
          ),
        ),
      ),
    );
  }
}
