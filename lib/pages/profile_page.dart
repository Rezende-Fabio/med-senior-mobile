import 'dart:io';
import 'package:flutter/material.dart';
import '../components/card_profile.dart';
import 'package:camera_camera/camera_camera.dart';
import './preview_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File file = File('');

  showPreview(foto) async {
    foto = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Preview(file: foto)),
    );

    if (foto != null) {
      setState(() {
        file = foto;
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    child: file.path == ""
                        ? Image.asset(
                            "assets/img/Avatar.png",
                            width: 100,
                          )
                        : CircleAvatar(
                          radius: 55,
                          child: ClipOval(
                            child: Image.file(
                                file,
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
          const CardProfile("NOME:", "Jose ALfonso"),
          const CardProfile("CODIGO:", "S4T6Y7"),
          const CardProfile("TELEFONE:", "1194135-8569"),
          const CardProfile("E-MAIL:", "teste@gmail.com"),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: ElevatedButton(
                    onPressed: () =>
                        {Navigator.of(context).pushNamed("/localizacao")},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 8, 88, 209),
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
                onPressed: () => {Navigator.of(context).pushNamed("/login")},
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
  }
}
