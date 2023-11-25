import 'package:flutter/material.dart';
import 'pages/start_page/start_page.dart';
import 'pages/login_page/login_page.dart';
import 'pages/register_page/register_page.dart';
import './pages/home_page.dart';
import './pages/register_medication_page.dart';
import 'pages/more_information_med_page/more_information_med_page.dart';
import './pages/register_schelude_page.dart';
import './pages/more_information_sche_page.dart';
import 'pages/locations_page/location_page.dart';

class RouteGenerator {
  static const String startPage = '/';
  static const String loginPage = '/login';
  static const String registerPage = '/cadastro';
  static const String homePage = '/home';
  static const String registerMedPage = "/cadastro/medicacao";
  static const String moreInformationMedPage = "/informacao/medicacao";
  static const String registerSchePage = "/cadastro/agendamento";
  static const String moreInformationSchePage = "/informacao/agendamento";
  static const String locationPage = "/localizacao";

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startPage:
        return MaterialPageRoute(
          builder: (_) => const Start(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
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
        final Map arguments = settings.arguments as Map;

        if (arguments != null && arguments.containsKey("medId")) {
          String medId = arguments["medId"];

          return MaterialPageRoute(
            builder: (_) => MoreInformationMed(medId),
          );
        } else {
          throw const FormatException("Rota não encontrada");
        }
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
      case moreInformationSchePage:
        return MaterialPageRoute(
          builder: (_) => const MoreInformationSche(),
        );
      case locationPage:
        return MaterialPageRoute(
          builder: (_) => const Location(),
        );
      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
