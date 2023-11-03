import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/login_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String loginPage = '/login';

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
