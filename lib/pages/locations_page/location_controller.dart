import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  late GoogleMapController _mapController;

  get mapsController => _mapController;

  onMapCreated(GoogleMapController gmc) async {
    _mapController = gmc;
    getPosition();
  }

  getPosition() async {
    try {
      Position posicao = await _curentPosition();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _curentPosition() async {
    return await Geolocator.getCurrentPosition();
  }
}
