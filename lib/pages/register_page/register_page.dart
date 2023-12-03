import 'package:med_senior_mobile/data/models/Cuidador.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_idoso.dart';
import 'package:med_senior_mobile/pages/register_page/register_controller.dart';
import 'package:med_senior_mobile/components/buttons/button_loding.dart';
import 'package:med_senior_mobile/components/forms/form_register.dart';
import 'package:med_senior_mobile/components/buttons/button_footer.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/Idoso.dart';
import 'package:med_senior_mobile/utils/flushBar.dart';
import 'package:med_senior_mobile/utils/formatDate.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late RegisterController _registerController;
  final _controllerNome = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerTelefone = TextEditingController();
  final _controllerSenha = TextEditingController();
  final _controllerData = TextEditingController();
  final _controllerCodigo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedItem = "Idoso";

  @override
  void initState() {
    super.initState();
    _registerController =
        RegisterController(HttpApiReposirotyIdoso(dio: Dio()), _updateScreen);
  }

  void updateSelectIem(String value) {
    _selectedItem = value;
  }

  void _updateScreen(bool isloading, String error) {
    setState(() {
      _registerController.isLoading = isloading;
      _registerController.errorApi = error;
    });
  }

  void limparForm() {
    _formKey.currentState!.reset();
    _controllerNome.clear();
    _controllerEmail.clear();
    _controllerTelefone.clear();
    _controllerSenha.clear();
    _controllerData.clear();
    _controllerCodigo.clear();
    _selectedItem = "Idoso";
  }

  Future<void> _registerIdoso() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedItem == "Idoso") {
        Idoso idoso = Idoso.insert(
            _controllerNome.text,
            _controllerTelefone.text,
            dateStringToDateTimeString(_controllerData.text),
            [],
            _controllerEmail.text,
            _controllerSenha.text);

        await _registerController.registerIdoso(idoso.fromJsonPost());
      } else {
        Cuidador cuidador = Cuidador.insert(
            _controllerNome.text,
            _controllerTelefone.text,
            dateStringToDateTimeString(_controllerData.text),
            _controllerCodigo.text,
            _controllerEmail.text,
            _controllerSenha.text);

        await _registerController.registerCuidador(cuidador.fromJsonPost());
      }

      if (_registerController.isLoading == false &&
          _registerController.errorApi.isEmpty) {
        // ignore: use_build_context_synchronously
        Alert.showToast(context,
            "Cadastrado com sucesso!", const Color.fromARGB(255, 22, 133, 0));
        limparForm();
      } else {
        // ignore: use_build_context_synchronously
        Alert.showToast(context,
            _registerController.errorApi, const Color.fromARGB(255, 133, 0, 0));
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cadastrar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              "Entre com as suas credenciais e continue",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 109, 109, 109),
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: FormRegister(
                      _controllerNome,
                      _controllerEmail,
                      _controllerTelefone,
                      _controllerSenha,
                      _controllerData,
                      _controllerCodigo,
                      _selectedItem,
                      _formKey,
                      updateSelectIem),
                ),
                Center(
                  child: Column(
                    children: [
                      _registerController.isLoading
                          ? const ButtonLoading()
                          : ButtonFooter(
                              "Cadastrar",
                              "",
                              const {},
                              functionButton: _registerIdoso,
                            ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Já possui conta?  "),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("/login");
                              },
                              child: const Text(
                                "Entar",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
