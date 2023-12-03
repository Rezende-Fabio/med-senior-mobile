import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:med_senior_mobile/data/models/IdosoProvider.dart';
import 'package:med_senior_mobile/data/models/MensagemProvider.dart';
import 'package:provider/provider.dart';
import 'package:med_senior_mobile/routes.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginProvider>(
        create: (_) => LoginProvider(iduser: "", token: ""),
      ),
      ChangeNotifierProvider<IdosoProvider>(
        create: (_) => IdosoProvider(nome: "", telefone: "", codigo: "", email: ""),
      ),
      ChangeNotifierProvider<MensagemProvider>(
        create: (_) => MensagemProvider(),
      )
    ],
    child: const MedSenior(),
  ));
}

class MedSenior extends StatelessWidget {
  const MedSenior({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "Med Senior",
      initialRoute: RouteGenerator.startPage,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
