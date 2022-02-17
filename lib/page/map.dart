import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapFunction extends StatelessWidget {
  const MapFunction({Key? key}) : super(key: key);

  Widget build_back_button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Go back!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map function'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(13.757429, 100.502465),
          zoom: 15,
        ),
      ),
    );
  }
}
