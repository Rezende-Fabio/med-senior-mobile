import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/cards/card_profile.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:med_senior_mobile/data/models/IdosoProvider.dart';
import 'package:med_senior_mobile/data/models/LoginProvider.dart';
import 'package:med_senior_mobile/pages/preview_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? file = File('');

  @override
  void initState() {
    super.initState();
    _carregarFoto();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoginProvider loginProvider =
          // ignore: use_build_context_synchronously
          Provider.of<LoginProvider>(context, listen: false);
      if (!loginProvider.checkLogin()) {
        Navigator.of(context).pushReplacementNamed("/login");
      }
    });
  }

  Future<void> _carregarFoto() async {
    final foto = await _lerFoto();
    setState(() {
      file = foto;
    });
  }

  Future<File?> _lerFoto() async {
    LoginProvider loginProvider =
        // ignore: use_build_context_synchronously
        Provider.of<LoginProvider>(context, listen: false);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? filePath = prefs.getString(loginProvider.iduser);

    if (filePath != null && filePath.isNotEmpty) {
      return File(filePath);
    }

    return null;
  }

  void _salvarFoto(File foto) async {
    LoginProvider loginProvider =
        // ignore: use_build_context_synchronously
        Provider.of<LoginProvider>(context, listen: false);

    final prefs = await SharedPreferences.getInstance();
    Uint8List byteImage = await foto.readAsBytes();
    ImageGallerySaver.saveImage(byteImage);
    prefs.setString(loginProvider.iduser, foto.path);
  }

  showPreview(foto) async {
    foto = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Preview(file: foto)),
    );

    if (foto != null) {
      setState(() {
        file = foto;
        _salvarFoto(file!);
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IdosoProvider>(
      builder: (context, cache, _) {
        return SafeArea(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 218, 218, 218),
                    child: const Text(""),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 125, bottom: 15),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraCamera(
                                  onFile: (file) => showPreview(file))),
                        ),
                        child: file == null || file!.path == ""
                            ? Image.asset(
                                "assets/img/Avatar.png",
                                width: 100,
                              )
                            : CircleAvatar(
                                radius: 55,
                                child: ClipOval(
                                  child: Image.file(
                                    file!,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              CardProfile("NOME:", cache.nome),
              CardProfile("CODIGO:", cache.codigo),
              CardProfile("TELEFONE:", cache.telefone),
              CardProfile("E-MAIL:", cache.email),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 8),
                      child: ElevatedButton(
                        onPressed: () =>
                            {Navigator.of(context).pushNamed("/localizacao")},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 8, 88, 209),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Icon(Icons.location_on_sharp),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Container(
                  padding: const EdgeInsets.only(left: 105, right: 105, top: 8),
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/login");
                      LoginProvider loginProvider =
                          // ignore: use_build_context_synchronously
                          Provider.of<LoginProvider>(context, listen: false);
                      loginProvider.logout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 209, 8, 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.exit_to_app),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Sair",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
