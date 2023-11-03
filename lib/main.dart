import 'package:flutter/material.dart';
import './routes.dart';

void main() {
  runApp(const MedSenior());
}

class MedSenior extends StatelessWidget {
  const MedSenior();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "Med Senior",
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
