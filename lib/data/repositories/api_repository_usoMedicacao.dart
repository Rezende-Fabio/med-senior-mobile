
abstract class ApiRepositoryUsoMedicacao {
  Future get(String usoMedicacaoId, String token);
  Future getAll(String idosoId, String token);
  Future post(Map usoMedicacao, String token);
  Future put(Map usoMedicacao, String usoMedicacaoId, String token);
  Future delete(String usoMedicacaoId, String token);
}
