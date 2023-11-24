import 'dart:developer';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import 'package:flutter_config/flutter_config.dart';
import '../api_repository_login.dart';
import "package:dio/dio.dart";
import '../../models/Login.dart';

class HttpApiReposirotyLogin implements ApiRepositoryLogin {
  final Dio _dio;

  HttpApiReposirotyLogin({required Dio dio}) : _dio = dio;

  @override
  Future getLogin(String email, String senha) async {
    try {
      final url =
          '${FlutterConfig.get('URL_API_LOGIN')}/authentication/login/$email/$senha';

      final response = await _dio.get(url);

      return Login.fromMap(response.data);
    } on DioException catch (dioError) {
      throw ApiException(message: dioError.response!.data['errorMessage']['message'] ?? "Erro ao fazer login");
    } catch (error, stacktrace) {
      log("Erro ao fazer login", error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao fazer login");
    }
  }
}
