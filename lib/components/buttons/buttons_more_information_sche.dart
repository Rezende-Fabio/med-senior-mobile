import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:med_senior_mobile/data/models/UsoMedicacao.dart';

class ButtonsMoreInformationSche extends StatefulWidget {
  final String page;
  final String textPage;
  final String titlePage;
  final UsoMedicacao? medicacao;
  final Function exclusionMedication;
  final String textModal;
  final String idExclusion;
  const ButtonsMoreInformationSche(this.page, this.titlePage, this.textPage,
      {super.key, this.medicacao, required this.exclusionMedication, required this.textModal, required this.idExclusion});

  @override
  State<ButtonsMoreInformationSche> createState() => _ButtonsMoreInformationScheState();
}

class _ButtonsMoreInformationScheState extends State<ButtonsMoreInformationSche> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              onPressed: () => {widget.exclusionMedication(widget.textModal, widget.idExclusion)},
              icon: const Icon(
                FontAwesomeIcons.trash,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 130,
            height: 50,
            child: ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(widget.page, arguments: {
                  "title": widget.titlePage,
                  "text": widget.textPage,
                  "usoMedicacao": widget.medicacao
                })
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(85, 101, 238, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Editar",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
