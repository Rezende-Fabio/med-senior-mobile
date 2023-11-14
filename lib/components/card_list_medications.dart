import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../pages/register_medication_page.dart';

class CardListMedications extends StatefulWidget {
  final String fv;
  CardListMedications(this.fv);

  @override
  State<CardListMedications> createState() => _CardListMedicationsState();
}

class _CardListMedicationsState extends State<CardListMedications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed("/cadastro/medicacao",
            arguments: {
              "title": "Editar Medicamento",
              "text": "Editar Medicamento"
            }),
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
                  child: Image.asset("assets/img/icone_MedSenior_1.png"),
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
                          widget.fv,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "${widget.fv}, Preço",
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
