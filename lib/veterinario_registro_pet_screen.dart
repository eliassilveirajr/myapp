import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VeterinarioRegistroPetScreen extends StatefulWidget {
  const VeterinarioRegistroPetScreen({Key? key}) : super(key: key);

  @override
  _VeterinarioRegistroPetScreenState createState() =>
      _VeterinarioRegistroPetScreenState();
}

class _VeterinarioRegistroPetScreenState
    extends State<VeterinarioRegistroPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _petCodeController = TextEditingController();
  final TextEditingController _detalhesController = TextEditingController();
  String? _tipoRegistro;
  final List<String> _tiposRegistro = [
    'Vacina',
    'Vermífugo',
    'Exame',
    'Consulta',
    'Outro',
  ];
  final TextEditingController _dataController = TextEditingController();

  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        _dataController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  String _getDetalhesHintText() {
    switch (_tipoRegistro) {
      case 'Vacina':
        return 'Detalhes da vacina (nome, lote, reforço, observações...)';
      case 'Vermífugo':
        return 'Detalhes do vermífugo (nome, dosagem, data da próxima dose...)';
      case 'Exame':
        return 'Detalhes do exame (tipo, laboratório, resultado resumido...)';
      case 'Consulta':
        return 'Detalhes da consulta (motivo, diagnóstico, prescrições...)';
      default:
        return 'Outros detalhes ou observações...';
    }
  }

  void _registrarProcedimento() {
    if (_formKey.currentState!.validate()) {
      print('Código do Pet: ${_petCodeController.text}');
      print('Tipo de Registro: $_tipoRegistro');
      print('Detalhes: ${_detalhesController.text}');
      print('Data: ${_dataController.text}');

      _petCodeController.clear();
      _tipoRegistro = null;
      _detalhesController.clear();
      _dataController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro adicionado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrar Procedimento',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange[400],
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _petCodeController,
                decoration: const InputDecoration(
                  labelText: 'Código do Pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código do pet.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _tipoRegistro,
                items:
                    _tiposRegistro.map((tipo) {
                      return DropdownMenuItem(value: tipo, child: Text(tipo));
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _tipoRegistro = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Tipo de Registro',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione o tipo de registro.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _detalhesController,
                decoration: InputDecoration(
                  labelText: _getDetalhesHintText(),
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => _selecionarData(context),
                child: IgnorePointer(
                  child: TextFormField(
                    controller: _dataController,
                    decoration: const InputDecoration(
                      labelText: 'Data (DD/MM/AAAA)',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, selecione a data.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registrarProcedimento,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
