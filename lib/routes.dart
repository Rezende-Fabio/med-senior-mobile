import 'package:flutter/material.dart';
import 'pages/start_page.dart';
import './pages/login_page.dart';
import './pages/register_page.dart';
import './pages/home_page.dart';

class RouteGenerator {
  static const String startPage = '/';
  static const String loginPage = '/login';
  static const String registerPage = '/cadastro';
  static const String homePage = '/home';

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startPage:
        return MaterialPageRoute(
          builder: (_) => const Start(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => const Register(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      default:
        throw FormatException("Rota não encontrada");
    }
  }
}
