import 'package:med_senior_mobile/data/repositories/api_repository_idoso.dart';
import 'package:med_senior_mobile/data/repositories/error/api_exception.dart';

class RegisterController {
  final ApiRepositoryIdoso apiRepositoryIdoso;
  final Function _loadingScreen;

  RegisterController(this.apiRepositoryIdoso, this._loadingScreen);

  // Caso de erro ao tentar inserir o idoso
  String errorApi = "";

  bool isLoading = false;

  Future<void> registerIdoso(Map idoso) async {
    isLoading = true;
    errorApi = "";
    _loadingScreen(isLoading, errorApi);

    try {
      final idosoPost = await apiRepositoryIdoso.postIdoso(idoso);
      isLoading = false;
      errorApi = "";
      _loadingScreen(isLoading, errorApi);
      return idosoPost;
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      _loadingScreen(isLoading, errorApi);
    }
  }

  Future<void> registerCuidador(Map cuidador) async {
    isLoading = true;
    errorApi = "";
    _loadingScreen(isLoading, errorApi);

    try {
      final cuidadorPost = await apiRepositoryIdoso.postCuidador(cuidador);
      isLoading = false;
      errorApi = "";
      _loadingScreen(isLoading, errorApi);
      return cuidadorPost;
    } on ApiException catch (error) {
      errorApi = error.message;
      isLoading = false;
      _loadingScreen(isLoading, errorApi);
    }
  }
}
