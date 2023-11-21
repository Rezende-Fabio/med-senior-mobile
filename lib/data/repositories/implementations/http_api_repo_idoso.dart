import 'dart:developer';
import 'package:med_senior_mobile/data/repositories/api_repository_idoso.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';
import "package:dio/dio.dart";
import '../../models/Idoso.dart';

class HttpApiReposirotyIdoso implements ApiRepositoryIdoso {
  final Dio _dio;

  HttpApiReposirotyIdoso({required Dio dio}) : _dio = dio;

  @override
  Future postIdoso(Map idoso) async {
    try {
      final url = '$API_URL/idoso';

      final response = await _dio.post(url, data: idoso);
      
      return Idoso.fromMap(response.data);
    } on DioException catch (dioError) {
      throw ApiException(message: dioError.message ?? "Erro ao inserir");
    } catch (error, stacktrace) {
      log("Erro ao tentar inserir idoso: ",
          error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao inserir");
    }
  }
}
