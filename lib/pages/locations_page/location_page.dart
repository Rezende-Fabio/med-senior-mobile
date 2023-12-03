import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:med_senior_mobile/pages/locations_page/location_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Local"),
      ),
      body: ChangeNotifierProvider<LocationController>(
        create: (context) => LocationController(),
        child: Builder(
          builder: (context) {
            final local = context.watch<LocationController>();
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(local.lat, local.long),
                zoom: 15
              ),
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              myLocationEnabled: true,
              onMapCreated: local.onMapCreated,
            );
          },
        ),
      ),
    );
  }
}