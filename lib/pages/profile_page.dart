import 'package:flutter/material.dart';
import '../components/card_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                padding: const EdgeInsets.only(top: 125, bottom: 35),
                child: Center(
                  child: Image.asset(
                    "assets/img/Avatar.png",
                    width: 100,
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
            padding: const EdgeInsets.only(top: 85),
            child: Container(
              padding: const EdgeInsets.only(left: 105, right: 105, top: 8),
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).pushNamed("/login")
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
  }
}
