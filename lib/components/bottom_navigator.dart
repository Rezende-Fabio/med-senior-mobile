import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'buttons/button_footer.dart';

class BottomNavgator extends StatelessWidget {
  final PageController pageController;

  BottomNavgator(this.pageController);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 15,
      fixedColor: const Color.fromRGBO(85, 101, 238, 1.0),
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          icon: Icon(Icons.medication),
          label: 'Medicação',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.clock),
          label: 'Agendamento',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Perfil',
        ),
      ],
      currentIndex: pageController?.page?.round() ?? 0,
      onTap: (index) {
        pageController.jumpToPage(index);
      },
    );
  }
}