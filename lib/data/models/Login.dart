import '../../utils/formatDate.dart';

class Login {
  late String iduser;
  late String token;

  Login(
      {required this.iduser,
      required this.token});

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      iduser: map["data"]["idUsuario"],
      token: map["data"]["access_token"],
    );
  }
}
