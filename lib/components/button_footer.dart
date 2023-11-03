import 'package:flutter/material.dart';
import '../routes.dart';

class ButtonFooter extends StatelessWidget {
  final String texto;
  final String page;
  const ButtonFooter(this.texto, this.page);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 8),
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: () => {
          Navigator.of(context).pushNamed(page)
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(85, 101, 238, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
