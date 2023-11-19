import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool _verSenha = true;
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
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Nome",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "E-mail",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: TextField(
              controller: _dataController,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                labelText: "Data de Nascimento",
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
                    _dataController.text = DateFormat("d/MM/y").format(novaData);
                  });
                }
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 15),
                  margin: const EdgeInsets.only(bottom: 20, right: 25),
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
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: TextField(
                    enabled: _selectedItem == "Idoso" ?  false :  true,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Código",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: TextField(
              obscureText: _verSenha,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Senha",
                suffixIcon: IconButton(
                  icon: _verSenha
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () => {
                    setState(() {
                      _verSenha = !_verSenha;
                    })
                  },
                ),
              ),
            ),
          ),
          TextField(
            obscureText: _verSenha,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Confirmar Senha",
              suffixIcon: IconButton(
                icon: _verSenha
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () => {
                  setState(() {
                    _verSenha = !_verSenha;
                  })
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
