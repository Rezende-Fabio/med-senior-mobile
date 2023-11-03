import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/login_page.dart';
import './pages/register_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String loginPage = '/login';
  static const String registerPage = '/cadastro';

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => const Register(),
        );
      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
