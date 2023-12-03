
abstract class ApiRepositoryMedicacao {
  Future get(String medicacaoId, String token);
  Future getAll(String idosoId, String token);
  Future post(Map medicacao, String token);
  Future put(Map medicacao, String medicacaoId, String token);
  Future delete(String medicacaoId, String token);
}
