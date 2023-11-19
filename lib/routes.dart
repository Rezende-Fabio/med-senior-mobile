import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'pages/start_page.dart';
import './pages/login_page.dart';
import './pages/register_page.dart';
import './pages/home_page.dart';
import './pages/register_medication_page.dart';
import './pages/more_information_med_page.dart';
import './pages/register_schelude_page.dart';

class RouteGenerator {
  static const String startPage = '/';
  static const String loginPage = '/login';
  static const String registerPage = '/cadastro';
  static const String homePage = '/home';
  static const String registerMedPage = "/cadastro/medicacao";
  static const String moreInformationMedPage = "/informacao/medicacao";
  static const String registerSchePage = "/cadastro/agendamento";

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
      case registerMedPage:
        final Map arguments = settings.arguments as Map;

        if (arguments != null &&
            arguments.containsKey("title") &&
            arguments.containsKey("text")) {
          String titlePage = arguments["title"];
          String textButton = arguments["text"];

          return MaterialPageRoute(
            builder: (_) => RegisterMedication(titlePage, textButton),
          );
        } else {
          throw const FormatException("Rota não encontrada");
        }
      case moreInformationMedPage:
        return MaterialPageRoute(
          builder: (_) => const MoreInformationMed(),
        );
      case registerSchePage:
        final Map arguments = settings.arguments as Map;

        if (arguments != null &&
            arguments.containsKey("title") &&
            arguments.containsKey("text")) {
          String titlePage = arguments["title"];
          String textButton = arguments["text"];

          return MaterialPageRoute(
            builder: (_) => RegisterSchedule(titlePage, textButton),
          );
        } else {
          throw const FormatException("Rota não encontrada");
        }
      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
