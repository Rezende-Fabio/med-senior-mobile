
abstract class ApiRepositoryLogin {
  Future getLogin(String email, String senha);
  Future getUser(String id, String token);
}
