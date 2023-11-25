import 'dart:async';
import 'dart:developer';
import 'package:med_senior_mobile/data/models/Medicacao.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_medicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import 'package:flutter_config/flutter_config.dart';
import "package:dio/dio.dart";

class HttpApiReposirotyMedicacao implements ApiRepositoryMedicacao {
  final Dio _dio;

  HttpApiReposirotyMedicacao({required Dio dio}) : _dio = dio;

  @override
  Future delete(String medicacaoId, String token) async {
    try {
      final url = '${FlutterConfig.get('URL_API')}/medicacao/$medicacaoId';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.delete(url).timeout(const Duration(seconds: 20));

      return response.data;
    } on DioException catch (dioError) {
      throw ApiException(
          message: dioError.message ?? "Erro ao tentar excluir medicação");
    } on TimeoutException {
      throw ApiException(
          message: "Servidor fora do ar, tente novamente mais tarde");
    } catch (error, stacktrace) {
      log("Erro ao tentar excluir medicação",
          error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao tentar excluir medicação");
    }
  }

  @override
  Future get(String medicacaoId, String token) async {
    try {
      final url = '${FlutterConfig.get('URL_API')}/medicacao/$medicacaoId';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get(url).timeout(const Duration(seconds: 20));

      return Medicacao.fromMap(response.data);
    } on DioException catch (dioError) {
      throw ApiException(
          message: dioError.message ?? "Erro ao tentar consultar a medicação");
    } on TimeoutException {
      throw ApiException(
          message: "Servidor fora do ar, tente novamente mais tarde");
    } catch (error, stacktrace) {
      log("Erro ao tentar consultar a medicação",
          error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao tentar consultar a medicação");
    }
  }

  @override
  Future getAll(String idosoId, String token) async {
    try {
      final url = '${FlutterConfig.get('URL_API')}/medicacao/todos/$idosoId';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get(url).timeout(const Duration(seconds: 20));

      return response.data;
    } on DioException catch (dioError) {
      throw ApiException(
          message: dioError.message ?? "Erro ao tentar consultar as medicaões");
    } on TimeoutException {
      throw ApiException(
          message: "Servidor fora do ar, tente novamente mais tarde");
    } catch (error, stacktrace) {
      log("Erro ao tentar consultar as medicaões",
          error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao tentar consultar as medicaões");
    }
  }

  @override
  Future post(Map medicacao, String token) async {
    try {
      final url = '${FlutterConfig.get('URL_API')}/medicacao';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio
          .post(url, data: medicacao)
          .timeout(const Duration(seconds: 20));

      return Medicacao.fromMap(response.data);
    } on DioException catch (dioError) {
      throw ApiException(message: dioError.message ?? "Erro ao inserir");
    } on TimeoutException {
      throw ApiException(
          message: "Servidor fora do ar, tente novamente mais tarde");
    } catch (error, stacktrace) {
      log("Erro ao inserir",
          error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao inserir");
    }
  }

  @override
  Future put(Map medicacao, String medicacaoId, String token) async{
     try {
      final url = '${FlutterConfig.get('URL_API')}/medicacao/$medicacaoId';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio
          .put(url, data: medicacao)
          .timeout(const Duration(seconds: 20));

      return Medicacao.fromMap(response.data);
    } on DioException catch (dioError) {
      throw ApiException(message: dioError.message ?? "Erro ao editar");
    } on TimeoutException {
      throw ApiException(
          message: "Servidor fora do ar, tente novamente mais tarde");
    } catch (error, stacktrace) {
      log("Erro ao editar",
          error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao editar");
    }
  }
}
