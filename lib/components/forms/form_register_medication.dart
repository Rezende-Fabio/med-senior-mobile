import 'package:flutter/material.dart';
import 'package:med_senior_mobile/mixins/validations_mixin.dart';

class FormRegisterMedi extends StatefulWidget {
  final TextEditingController _controllerNome;
  final TextEditingController _controllerDesc;
  final GlobalKey<FormState> _formKey;
  String? _selectItem;
  final Function updateSelectIem;
  FormRegisterMedi(this._controllerNome, this._controllerDesc, this._selectItem, this._formKey, this.updateSelectIem,{super.key});

  @override
  State<FormRegisterMedi> createState() => _FormRegisterMediState();
}

class _FormRegisterMediState extends State<FormRegisterMedi> with ValidationsMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 45),
      width: double.infinity,
      child: Form(
        key: widget._formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: TextFormField(
                validator: (value) => isNotEmpty(value),
                controller: widget._controllerNome,
                maxLines: 2,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
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
                  value: "Comprimido",
                  groupValue: widget._selectItem,
                  onChanged: (value) {
                    setState(
                      () {
                        widget._selectItem = value.toString();
                        widget.updateSelectIem(value);
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: const Text("Gotas"),
                  value: "Gotas",
                  groupValue: widget._selectItem,
                  onChanged: (value) {
                    setState(
                      () {
                        widget._selectItem = value.toString();
                        widget.updateSelectIem(value);
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: const Text("Cápsulas"),
                  value: "Cápsulas",
                  groupValue: widget._selectItem,
                  onChanged: (value) {
                    setState(
                      () {
                        widget._selectItem = value.toString();
                        widget.updateSelectIem(value);
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: const Text("Pomada"),
                  value: "Pomada",
                  groupValue: widget._selectItem,
                  onChanged: (value) {
                    setState(
                      () {
                        widget._selectItem = value.toString();
                        widget.updateSelectIem(value);
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: const Text("Mililitro"),
                  value: "Mililitro",
                  groupValue: widget._selectItem,
                  onChanged: (value) {
                    setState(
                      () {
                        widget._selectItem = value.toString();
                        widget.updateSelectIem(value);
                      },
                    );
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                validator: (value) => isNotEmpty(value),
                controller: widget._controllerDesc,
                maxLength: 40,
                maxLines: 5,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Descrição",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
