import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/buttons/button_footer.dart';
import 'package:med_senior_mobile/components/buttons/button_loding.dart';
import 'package:med_senior_mobile/components/forms/form_register_schedule.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';
import 'package:med_senior_mobile/data/models/UsoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_medicacao.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_usoMedicacao.dart';
import 'package:med_senior_mobile/pages/medications_page/medications_controller.dart';
import 'package:med_senior_mobile/pages/register_schedule_page/resgiter_sche_controller.dart';
import 'package:med_senior_mobile/utils/flushBar.dart';
import 'package:med_senior_mobile/utils/formatDate.dart';
import 'package:provider/provider.dart';

class RegisterSchedule extends StatefulWidget {
  final String titlePage;
  final String textButton;
  final UsoMedicacao? usoMedicacao;
  const RegisterSchedule(this.titlePage, this.textButton,
      {this.usoMedicacao, super.key});

  @override
  State<RegisterSchedule> createState() => _RegisterScheduleState();
}

class _RegisterScheduleState extends State<RegisterSchedule> {
  late ResgisterScheController _registerScheController;
  late MedicationsController _medicationsController;
  final _controllerDosagem = TextEditingController();
  final _controllerIntervalo = TextEditingController();
  final _controllerHoraInicial = TextEditingController();
  final _controllerDataFinal = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Medicacao? _selectedItem;
  List<Medicacao> listaMed = [];

  @override
  void initState() {
    super.initState();
    _registerScheController = ResgisterScheController(
        HttpApiReposirotyUsoMedicacao(dio: Dio()), _updateScreen);

    if (widget.usoMedicacao != null) {
      _controllerDosagem.text = widget.usoMedicacao!.dosagem.toString();
      _controllerIntervalo.text = widget.usoMedicacao!.intervalo.toString();
      _controllerHoraInicial.text =
          dateTimeToTimeString(widget.usoMedicacao!.horaInicial);
      _controllerDataFinal.text =
          dateTimeToDateString(widget.usoMedicacao!.dataFinal);
      _selectedItem = widget.usoMedicacao!.medicacao;
    }

    _medicationsController =
        MedicationsController(HttpApiReposirotyMedicacao(dio: Dio()));
    _loadMedications();
  }

  Future<void> _loadMedications() async {
    String userId = context.read<LoginProvider>().iduser;
    String token = context.read<LoginProvider>().token;

    List<Medicacao>? result =
        await _medicationsController.consultarMedicamentos(userId, token);

    if (result != null) {
      setState(() {
        listaMed = result;
      });
    } else {
      setState(() {
        listaMed = [];
      });
    }
  }

  void _updateScreen(bool isloading, String error) {
    setState(() {
      _registerScheController.isLoading = isloading;
      _registerScheController.errorApi = error;
    });
  }

  void _updateSelectIem(Medicacao value) {
    _selectedItem = value;
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      String userId = context.read<LoginProvider>().iduser;
      String token = context.read<LoginProvider>().token;
      String message = "";

      if (widget.usoMedicacao == null) {
        message = "Cadastrado";

        UsoMedicacao usoMed = UsoMedicacao(
            id: "",
            dosagem: int.parse(_controllerDosagem.text),
            intervalo: int.parse(_controllerIntervalo.text),
            horaInicial: dateTimeToDateTimeString(
                timeStringToDateTime(_controllerHoraInicial.text)),
            dataFinal: dateTimeToDateTimeString(
                dateStringToDateTime(_controllerDataFinal.text)),
            idosoId: userId);
        usoMed.setMedId(_selectedItem!.id);

        await _registerScheController.inserirUsoMedicamento(
            usoMed.fromJsonPost(), token);
      } else {
        message = "Alterado";

        UsoMedicacao usoMed = UsoMedicacao(
            id: "",
            dosagem: int.parse(_controllerDosagem.text),
            intervalo: int.parse(_controllerIntervalo.text),
            horaInicial: dateTimeToDateTimeString(
                timeStringToDateTime(_controllerHoraInicial.text)),
            dataFinal: dateTimeToDateTimeString(
                dateStringToDateTime(_controllerDataFinal.text)),
            idosoId: userId);
        usoMed.setMedId(_selectedItem!.id);

        await _registerScheController.editarUsoMedicamento(
            usoMed.fromJsonPost(), widget.usoMedicacao!.id, token);
      }

      if (_registerScheController.isLoading == false &&
          _registerScheController.errorApi.isEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/home", arguments: {
          "alert": {
            "message": "$message com sucesso!",
            "cor": const Color.fromARGB(255, 22, 133, 0)
          },
          "paginaAtual": 1
        });
      } else {
        // ignore: use_build_context_synchronously
        Alert.showToast(context, _registerScheController.errorApi,
            const Color.fromARGB(255, 133, 0, 0));
      }
    }
  }

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
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 25, left: 5, right: 75),
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
                        FormRegisterSchedule(
                            _controllerDosagem,
                            _controllerIntervalo,
                            _controllerHoraInicial,
                            _controllerDataFinal,
                            _formKey,
                            listaMed,
                            _selectedItem,
                            _updateSelectIem),
                        _registerScheController.isLoading
                            ? const ButtonLoading()
                            : ButtonFooter(
                                widget.textButton,
                                "",
                                const {},
                                functionButton: _save,
                              ),
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
