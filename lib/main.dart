import 'package:flutter/material.dart';
import './routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MedSenior());
}

class MedSenior extends StatelessWidget {
  const MedSenior();

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
