import 'package:flutter/material.dart';
import 'package:med_senior_mobile/data/models/Medicacao.dart';
import 'package:med_senior_mobile/pages/start_page/start_page.dart';
import 'package:med_senior_mobile/pages/login_page/login_page.dart';
import 'package:med_senior_mobile/pages/register_page/register_page.dart';
import 'package:med_senior_mobile/pages/home_page.dart';
import 'package:med_senior_mobile/pages/resgister_medication/register_medication_page.dart';
import 'package:med_senior_mobile/pages/more_information_med_page/more_information_med_page.dart';
import 'package:med_senior_mobile/pages/register_schelude_page.dart';
import 'package:med_senior_mobile/pages/more_information_sche_page.dart';
import 'package:med_senior_mobile/pages/locations_page/location_page.dart';

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

  RouteGenerator._();

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
        final Map arguments = settings.arguments as Map;
        if (arguments.containsKey("alert")) {
          Map alert = arguments["alert"];
          int paginaAtual = arguments["paginaAtual"];

          return MaterialPageRoute(
            builder: (_) => Home(alert, paginaAtual),
          );
        } else {
          int paginaAtual = arguments["paginaAtual"];
          return MaterialPageRoute(
            builder: (_) => Home({}, paginaAtual),
          );;
        }
      case registerMedPage:
        final Map arguments = settings.arguments as Map;

        if (arguments != null &&
            arguments.containsKey("title") &&
            arguments.containsKey("text") &&
            arguments.containsKey("medicacao")) {
          String titlePage = arguments["title"];
          String textButton = arguments["text"];
          Medicacao? medicacao = arguments["medicacao"];

          return MaterialPageRoute(
            builder: (_) =>
                RegisterMedication(titlePage, textButton, medicacao),
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
