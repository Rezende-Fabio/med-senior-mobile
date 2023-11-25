import 'dart:async';
import 'dart:developer';
import 'package:med_senior_mobile/data/models/IdosoProvider.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_login.dart';
import "package:dio/dio.dart";
import 'package:med_senior_mobile/data/models/LoginProvider.dart';

class HttpApiReposirotyLogin implements ApiRepositoryLogin {
  final Dio _dio;

  HttpApiReposirotyLogin({required Dio dio}) : _dio = dio;

  @override
  Future getLogin(String email, String senha) async {
    try {
      final url =
          '${FlutterConfig.get('URL_API_LOGIN')}/authentication/login/$email/$senha';

      final response = await _dio.get(url).timeout(const Duration(seconds: 20));

      return LoginProvider.fromMap(response.data);
    } on DioException catch (dioError) {
      throw ApiException(
          message: dioError.response!.data['errorMessage']['message'] ??
              "Erro ao fazer login");
    } on TimeoutException {
      throw ApiException(
          message: "Servidor fora do ar, tente novamente mais tarde");
    } catch (error, stacktrace) {
      log("Erro ao fazer login", error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao fazer login");
    }
  }

  @override
  Future getUser(String id, String token) async {
    try {
      final url = '${FlutterConfig.get('URL_API')}/idoso/$id';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get(url).timeout(const Duration(seconds: 20));

      return IdosoProvider.fromMap(response.data);
    } on DioException catch (dioError) {
      throw ApiException(
          message: dioError.message ?? "Erro ao tentar consultar o idoso");
    } on TimeoutException {
      throw ApiException(
          message: "Servidor fora do ar, tente novamente mais tarde");
    } catch (error, stacktrace) {
      log("Erro ao tentar consultar o idoso",
          error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao tentar consultar o idoso");
    }
  }
}
