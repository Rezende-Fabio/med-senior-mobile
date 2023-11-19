import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormRegisterSchedule extends StatefulWidget {
  const FormRegisterSchedule({super.key});

  @override
  State<FormRegisterSchedule> createState() => _FormRegisterScheduleState();
}

class _FormRegisterScheduleState extends State<FormRegisterSchedule> {
  final _dataController = TextEditingController();
  DateTime dataInicial = DateTime.now();
  String? _selectedItem = 'Idoso';

  @override
  void initState() {
    super.initState();
    setState(() {
      _dataController.text = DateFormat("d/MM/y").format(dataInicial);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 25, top: 25),
            child: DropdownButton<String>(
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue; // Atualiza o valor selecionado
                });
              },
              isExpanded: true,
              items: <String>['Idoso', 'Cuidador'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Dosagem",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Intervalo de horas",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Hora primeiro consumo",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 35),
            child: TextField(
              controller: _dataController,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                labelText: "Data final",
              ),
              readOnly: true,
              onTap: () async {
                DateTime? novaData = await showDatePicker(
                    context: context,
                    initialDate: dataInicial,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (novaData != null) {
                  setState(() {
                    _dataController.text =
                        DateFormat("d/MM/y").format(novaData);
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
