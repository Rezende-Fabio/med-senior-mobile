import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormRegister extends StatefulWidget {
  final TextEditingController _controllerNome;
  final TextEditingController _controllerEmail;
  final TextEditingController _controllerTelefone;
  final TextEditingController _controllerSenha;
  final TextEditingController _dataController;
  String? _selectedItem;
  FormRegister(
      this._controllerNome,
      this._controllerEmail,
      this._controllerTelefone,
      this._controllerSenha,
      this._dataController,
      this._selectedItem,
      {super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool _verSenha = true;
  DateTime dataInicial = DateTime.now();

  @override
  void initState() {
    super.initState();
    setState(() {
      widget._dataController.text = DateFormat("d/MM/y").format(dataInicial);
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
            child: TextField(
              controller: widget._controllerNome,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: TextField(
              controller: widget._controllerEmail,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "E-mail",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: TextField(
              controller: widget._controllerTelefone,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Telefone",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: TextField(
              controller: widget._dataController,
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
                    widget._dataController.text =
                        DateFormat("d/MM/y").format(novaData);
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
                    value: widget._selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        widget._selectedItem = newValue; // Atualiza o valor selecionado
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
                    enabled: widget._selectedItem == "Idoso" ? false : true,
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
              controller: widget._controllerSenha,
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
