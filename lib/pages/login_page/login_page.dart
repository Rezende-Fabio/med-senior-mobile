import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/IdosoProvider.dart';
import 'package:med_senior_mobile/data/repositories/implementations/http_api_repo_login.dart';
import 'package:med_senior_mobile/utils/flushBar.dart';
import 'package:provider/provider.dart';
import 'package:med_senior_mobile/components/buttons/button_loding.dart';
import 'package:med_senior_mobile/components/forms/form_login.dart';
import 'package:med_senior_mobile/components/buttons/button_footer.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';
import 'package:med_senior_mobile/pages/login_page/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController _loginController;
  final _controllerEmail = TextEditingController();
  final _controllerSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginController = LoginController(HttpApiReposirotyLogin(dio: Dio()));
  }

  void limparForm() {
    _formKey.currentState!.reset();
    _controllerEmail.clear();
    _controllerSenha.clear();
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      LoginProvider? login = await _loginController.login(
          _controllerEmail.text, _controllerSenha.text);

      if (_loginController.isLoading == false &&
          _loginController.errorApi.isEmpty) {
        limparForm();
        // ignore: use_build_context_synchronously
        LoginProvider loginProvider =
            // ignore: use_build_context_synchronously
            Provider.of<LoginProvider>(context, listen: false);
        loginProvider.login(login!.iduser, login.token);

        IdosoProvider? user =
            await _loginController.getUser(login.iduser, login.token);
        // ignore: unused_local_variable
        IdosoProvider userProvider =
            // ignore: use_build_context_synchronously
            Provider.of<IdosoProvider>(context, listen: false);
        userProvider.nome = user!.nome;
        userProvider.email = user.email;
        userProvider.codigo = user.codigo;
        userProvider.telefone = user.telefone;

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed("/home", arguments: {"paginaAtual": 0});
      } else {
        // ignore: use_build_context_synchronously
        Alert.showToast(context, _loginController.errorApi,
            const Color.fromARGB(255, 133, 0, 0));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LoginController>(
        create: (context) => _loginController,
        child: Builder(builder: (context) {
          // ignore: unused_local_variable
          final local = context.watch<LoginController>();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: SizedBox(
                  width: 150,
                  child: Image.asset("assets/img/icone_MedSenior_1.png"),
                ),
              ),
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
                            "Entrar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          Text(
                            "Entre com o seu E-mail e senha",
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
                child: FormLogin(_controllerEmail, _controllerSenha, _formKey),
              ),
              Center(
                child: Column(
                  children: [
                    _loginController.isLoading
                        ? const ButtonLoading()
                        : ButtonFooter("Entrar", "", const {},
                            functionButton: _login),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Não tem conta?  "),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed("/cadastro");
                            },
                            child: const Text(
                              "Cadastre-se",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
