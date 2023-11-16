import 'package:flutter/material.dart';

class FormRegisterMedi extends StatefulWidget {
  const FormRegisterMedi({super.key});

  @override
  State<FormRegisterMedi> createState() => _FormRegisterMediState();
}

class _FormRegisterMediState extends State<FormRegisterMedi> {
  int _medicacao = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const TextField(
              maxLines: 2,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Nome do Medicamento",
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Modo de Administração:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RadioListTile(
                title: const Text("Comprimido"),
                value: 1,
                groupValue: _medicacao,
                onChanged: (value) {
                  setState(
                    () {
                      _medicacao = int.parse(value.toString());
                    },
                  );
                },
              ),
              RadioListTile(
                title: const Text("Gotas"),
                value: 2,
                groupValue: _medicacao,
                onChanged: (value) {
                  setState(
                    () {
                      _medicacao = int.parse(value.toString());
                    },
                  );
                },
              ),
              RadioListTile(
                title: const Text("Cápsulas"),
                value: 3,
                groupValue: _medicacao,
                onChanged: (value) {
                  setState(
                    () {
                      _medicacao = int.parse(value.toString());
                    },
                  );
                },
              ),
              RadioListTile(
                title: const Text("Pomada"),
                value: 4,
                groupValue: _medicacao,
                onChanged: (value) {
                  setState(
                    () {
                      _medicacao = int.parse(value.toString());
                    },
                  );
                },
              ),
              RadioListTile(
                title: const Text("Mililitro"),
                value: 5,
                groupValue: _medicacao,
                onChanged: (value) {
                  setState(
                    () {
                      _medicacao = int.parse(value.toString());
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const TextField(
              maxLength: 40,
              maxLines: 5,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Descrição",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text("Inserir Imagem"),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 114, 114, 114),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.photo_camera),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Tirar foto"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
