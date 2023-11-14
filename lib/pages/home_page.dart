import 'package:flutter/material.dart';
import '../components/bottom_navigator.dart';
import '../pages/medications_page.dart';
import 'register_medication_page.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Medications(),
          Container(
            child: Text("Tela 3"),
          ),
          Container(
            child: Text("Tela 3"),
          )
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageController,
          builder: (context, snapshot) {
            return BottomNavgator(pageController);
          }),
    );
  }
}