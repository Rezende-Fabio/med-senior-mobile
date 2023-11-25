import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';

class CardListMedications extends StatefulWidget {
  final Medicacao med;
  const CardListMedications(this.med, {super.key});

  @override
  State<CardListMedications> createState() => _CardListMedicationsState();
}

class _CardListMedicationsState extends State<CardListMedications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed("/informacao/medicacao",
            arguments: {"medId": widget.med.id}),
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
                  child: Image.asset("assets/img/remedio.png"),
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
                          widget.med.nome,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          widget.med.modoAdm,
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
