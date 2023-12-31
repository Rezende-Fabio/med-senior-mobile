import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/buttons/button_loding.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';
import 'package:med_senior_mobile/data/models/MensagemProvider.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_medicacao.dart';
import 'package:med_senior_mobile/pages/resgister_medication_page/resgister_med_controller.dart';
import 'package:med_senior_mobile/components/buttons/button_footer.dart';
import 'package:med_senior_mobile/components/forms/form_register_medication.dart';
import 'package:med_senior_mobile/utils/flushBar.dart';
import 'package:provider/provider.dart';

class RegisterMedication extends StatefulWidget {
  final String titlePage;
  final String textButton;
  final Medicacao? medicacao;
  // ignore: use_key_in_widget_constructors
  const RegisterMedication(this.titlePage, this.textButton, [this.medicacao]);

  @override
  State<RegisterMedication> createState() => _RegisterMedicationState();
}

class _RegisterMedicationState extends State<RegisterMedication> {
  late ResgisterMedMedController _registerMedController;
  final _controllerNome = TextEditingController();
  final _controllerDesc = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedItem = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoginProvider loginProvider =
          // ignore: use_build_context_synchronously
          Provider.of<LoginProvider>(context, listen: false);
      if (!loginProvider.checkLogin()) {
        Navigator.of(context).pushReplacementNamed("/login");
      }
    });

    _registerMedController = ResgisterMedMedController(
        HttpApiReposirotyMedicacao(dio: Dio()), _updateScreen);

    if (widget.medicacao != null) {
      _controllerNome.text = widget.medicacao!.nome;
      _controllerDesc.text = widget.medicacao!.descricao;
      _selectedItem = widget.medicacao!.modoAdm;
    }
  }

  void _limparForm() {
    _formKey.currentState!.reset();
    _controllerNome.clear();
    _controllerDesc.clear();
    _selectedItem = "";
  }

  void _updateSelectIem(String value) {
    _selectedItem = value;
  }

  void _updateScreen(bool isloading, String error) {
    setState(() {
      _registerMedController.isLoading = isloading;
      _registerMedController.errorApi = error;
    });
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      String userId = context.read<LoginProvider>().iduser;
      String token = context.read<LoginProvider>().token;
      String message = "";

      MensagemProvider mensagem =
          // ignore: use_build_context_synchronously
          Provider.of<MensagemProvider>(context, listen: false);

      if (widget.medicacao == null) {
        message = "cadastrado";
        Medicacao med = Medicacao(
            id: "",
            nome: _controllerNome.text,
            modoAdm: _selectedItem,
            descricao: _controllerDesc.text,
            estoque: 0,
            falhas: [],
            idosoId: userId);

        await _registerMedController.inserirMedicamento(
            med.fromJsonPost(), token);
      } else {
        message = "alterado";
        Medicacao med = Medicacao(
            id: widget.medicacao!.id,
            nome: _controllerNome.text,
            modoAdm: _selectedItem,
            descricao: _controllerDesc.text,
            estoque: widget.medicacao!.estoque,
            falhas: widget.medicacao!.falhas,
            idosoId: userId);

        await _registerMedController.editarMedicamento(
            med.fromJsonPost(), widget.medicacao!.id, token);
      }

      if (_registerMedController.isLoading == false &&
          _registerMedController.errorApi.isEmpty) {
        mensagem.setAlert("Medicação $message com sucesso!",
            const Color.fromARGB(255, 22, 133, 0));
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/home", arguments: {"paginaAtual": 0});
      } else {
        // ignore: use_build_context_synchronously
        Alert.showToast(context, _registerMedController.errorApi,
            const Color.fromARGB(255, 133, 0, 0));
      }
      _limparForm();
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
                      top: 10, bottom: 25, left: 5, right: 35),
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
                        FormRegisterMedi(_controllerNome, _controllerDesc,
                            _selectedItem, _formKey, _updateSelectIem),
                        _registerMedController.isLoading
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
