import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/buttons/button_footer.dart';
import 'package:med_senior_mobile/components/forms/form_register_schedule.dart';

class RegisterSchedule extends StatefulWidget {
  final String titlePage;
  final String textButton;
  const RegisterSchedule(this.titlePage, this.textButton, {super.key});

  @override
  State<RegisterSchedule> createState() => _RegisterScheduleState();
}

class _RegisterScheduleState extends State<RegisterSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => {Navigator.of(context).pop()},
                        icon: const Icon(Icons.arrow_back_ios_new),
                      ),
                      Text(
                        widget.titlePage,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const Text(
                        "",
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        color: Color.fromARGB(255, 211, 211, 211)),
                    child: Column(
                      children: [
                        FormRegisterSchedule(),
                        ButtonFooter(widget.textButton, "", const {}),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
