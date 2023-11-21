import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_idoso.dart';
import 'package:med_senior_mobile/pages/register_page/register_controller.dart';
import 'package:another_flushbar/flushbar.dart';
import '../../components/button_loding.dart';
import '../../components/form_register.dart';
import '../../components/button_footer.dart';
import '../../utils/formatDate.dart';

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
  final String _selectedItem = 'Idoso';

  @override
  void initState() {
    super.initState();
    _registerController =
        RegisterController(HttpApiReposirotyIdoso(dio: Dio()), _updateScreen);
  }

  void _updateScreen(bool isloading, String error) {
    setState(() {
      _registerController.isLoading = isloading;
      _registerController.errorApi = error;
    });
  }

  void showToast(String message, Color cor) => Flushbar(
        duration: const Duration(seconds: 5),
        title: "Aviso",
        titleSize: 25,
        message: message,
        messageSize: 15,
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.only(top: 35, left: 10, right: 10),
        borderRadius: BorderRadius.circular(25),
        backgroundColor: cor,
      )..show(context);

  Future<void> _registerIdoso() async {
    Map idoso = {
      "nome": _controllerNome.text,
      "telefone": _controllerTelefone.text,
      "dataNasc": dateStringToDateTimeString(_controllerData.text),
      "email": _controllerEmail.text,
      "senha": _controllerSenha.text,
      "doencas": []
    };
    await _registerController.registerIdoso(idoso);
    if (_registerController.isLoading == false && _registerController.errorApi.isEmpty) {
      showToast(
          "Cadastrado com sucesso!", const Color.fromARGB(255, 22, 133, 0));
    } else {
      showToast(
          _registerController.errorApi, const Color.fromARGB(255, 133, 0, 0));
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
                      _selectedItem),
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
