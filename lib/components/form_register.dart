import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool _verSenha = true;
  final dataController = TextEditingController();
  DateTime dataInicial = DateTime.now();

  void initState() {
    setState(() {
      dataController.text = DateFormat("d/MM/y").format(dataInicial);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: SingleChildScrollView(
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
              margin: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: dataController,
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
                      dataController.text =
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
                    margin: const EdgeInsets.only(bottom: 25, right: 25),
                    child: const TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Tipo",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
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
      ),
    );
  }
}
