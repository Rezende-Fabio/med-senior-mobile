import 'package:flutter/material.dart';
import 'package:med_senior_mobile/components/bottom_navigator.dart';
import 'package:med_senior_mobile/pages/medications_page/medications_page.dart';
import 'package:med_senior_mobile/pages/schedules_page/schedules_page.dart';
import 'package:med_senior_mobile/pages/profile_page.dart';

class Home extends StatefulWidget {
  final Map? alertMedication;
  final int paginaAtual;
  const Home(this.alertMedication, this.paginaAtual, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.paginaAtual);
  }

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
          Medications(widget.alertMedication),
          Schedules(widget.alertMedication),
          const Profile(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageController,
          builder: (context, snapshot) {
            return BottomNavgator(pageController, widget.paginaAtual);
          }),
    );
  }
}
