import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:med_senior_mobile/data/models/UsoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/api_repository_usoMedicacao.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';

class HttpApiReposirotyUsoMedicacao implements ApiRepositoryUsoMedicacao {
  final Dio _dio;

  HttpApiReposirotyUsoMedicacao({required Dio dio}) : _dio = dio;
  
  @override
  Future delete(String usoMedicacaoId, String token) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future get(String usoMedicacaoId, String token) async {
    try {
      final url = '${FlutterConfig.get('URL_API')}/medicacao/uso/$usoMedicacaoId';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get(url).timeout(const Duration(seconds: 20));

      return UsoMedicacao.fromMap(response.data);
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
      final url = '${FlutterConfig.get('URL_API')}/medicacao/uso/todos/$idosoId';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get(url).timeout(const Duration(seconds: 20));

      return response.data;
    } on DioException catch (dioError) {
      throw ApiException(
          message: dioError.message ?? "Erro ao tentar consultar as medicões");
    } on TimeoutException {
      throw ApiException(
          message: "Servidor fora do ar, tente novamente mais tarde");
    } catch (error, stacktrace) {
      log("Erro ao tentar consultar as medicões",
          error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao tentar consultar as medicões");
    }
  }
  
  @override
  Future post(Map usoMedicacao, String token) async {
    try {
      final url = '${FlutterConfig.get('URL_API')}/medicacao/uso';
      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio
          .post(url, data: usoMedicacao)
          .timeout(const Duration(seconds: 20));

      return response.data;
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
  Future put(Map usoMedicacao, String usoMedicacaoId, String token) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
