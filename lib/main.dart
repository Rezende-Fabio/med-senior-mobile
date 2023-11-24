import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:provider/provider.dart';
import './routes.dart';
import 'data/models/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Login>(
        create: (_) => Login(iduser: '', token: ''),
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
