import 'package:flutter/material.dart';

class ButtonFooter extends StatelessWidget {
  final String text;
  final String page;
  final Map arguments;
  final Function? functionButton;
  const ButtonFooter(this.text, this.page, this.arguments,
      {this.functionButton, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 8),
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: () => {
          if (functionButton != null)
            {functionButton!()}
          else
            {
              if (arguments.isEmpty)
                {Navigator.of(context).pushNamed(page)}
              else
                {Navigator.of(context).pushNamed(page, arguments: arguments)}
            }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(85, 101, 238, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
