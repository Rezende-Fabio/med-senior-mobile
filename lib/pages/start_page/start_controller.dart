import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class StartController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';

  StartController() {
    getPosition();
  }

  getPosition() async {
    try {
      Position posicao = await _curentPosition();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _curentPosition() async {
    LocationPermission permission;
    bool active = await Geolocator.isLocationServiceEnabled();

    if (!active) {
      return Future.error("Por favor, habilite a localização no smartphone");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Você precisa autorizar o acesso a localização");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Você precisa autorizar o acesso a localização");
    }

    return await Geolocator.getCurrentPosition();
  }
}
