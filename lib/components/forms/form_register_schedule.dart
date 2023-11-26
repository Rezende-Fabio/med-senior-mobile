import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';
import 'package:med_senior_mobile/mixins/validations_mixin.dart';

class FormRegisterSchedule extends StatefulWidget {
  final TextEditingController _controllerDosagem;
  final TextEditingController _controllerIntervalo;
  final TextEditingController _controllerHoraInicial;
  final TextEditingController _controllerDataFinal;
  final GlobalKey<FormState> _formKey;
  final List<Medicacao> medicacoes;
  final Medicacao? _selectedItem;
  final Function _updateSelectIem;
  const FormRegisterSchedule(
      this._controllerDosagem,
      this._controllerIntervalo,
      this._controllerHoraInicial,
      this._controllerDataFinal,
      this._formKey,
      this.medicacoes,
      this._selectedItem,
      this._updateSelectIem,
      {super.key});

  @override
  State<FormRegisterSchedule> createState() => _FormRegisterScheduleState();
}

class _FormRegisterScheduleState extends State<FormRegisterSchedule>
    with ValidationsMixin {
  DateTime dataInicial = DateTime.now();
  Medicacao? _value;

  @override
  void initState() {
    super.initState();
    setState(() {
      widget._controllerDataFinal.text =
          DateFormat("d/MM/y").format(dataInicial);
    });
    if (widget._selectedItem != null) {
      _value = widget._selectedItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      width: double.infinity,
      child: Form(
        key: widget._formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 25, top: 25),
              child: DropdownButton<Medicacao>(
                value: _value,
                onChanged: (Medicacao? newValue) {
                  setState(() {
                    _value = newValue;
                    widget._updateSelectIem(
                        newValue); // Atualiza o valor selecionado
                  });
                },
                isExpanded: true,
                items: widget.medicacoes.map((Medicacao med) {
                  return DropdownMenuItem<Medicacao>(
                    value: med,
                    child: Text(med.nome),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: TextFormField(
                controller: widget._controllerDosagem,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Dosagem",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: TextFormField(
                controller: widget._controllerIntervalo,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Intervalo de horas",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: TextFormField(
                controller: widget._controllerHoraInicial,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Hora primeiro consumo",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 35),
              child: TextFormField(
                controller: widget._controllerDataFinal,
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
                    setState(
                      () {
                        widget._controllerDataFinal.text =
                            DateFormat("d/MM/y").format(novaData);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
