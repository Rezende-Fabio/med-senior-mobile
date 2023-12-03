import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/UsoMedicacao.dart';

class CardListSchadules extends StatefulWidget {
  final UsoMedicacao usoMed;
  const CardListSchadules(this.usoMed, {super.key});

  @override
  State<CardListSchadules> createState() => _CardListSchadulesState();
}

class _CardListSchadulesState extends State<CardListSchadules> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed("/informacao/agendamento", arguments: {"usoMedId": widget.usoMed.id}),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 59, 59, 59)),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 15, right: 5),
                child: SizedBox(
                  width: 55,
                  child: Image.asset("assets/img/agendamento.png"),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.usoMed.medicacao.nome,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          widget.usoMed.medicacao.modoAdm,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 146, 146, 146)),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
