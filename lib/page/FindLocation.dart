import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class FindMe extends StatefulWidget {
  const FindMe({Key? key}) : super(key: key);

  @override
  State<FindMe> createState() => FineMeState();
}

class FineMeState extends State<FindMe> {
  String current_location = "";
  String currentAddress = "";
  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      current_location =
          "Latitude: ${position.latitude} Longtitude: ${position.longitude}\nAccuracy: ${position.accuracy}";
    });
    try {} catch (error) {
      print(error);
    }
  }

  Widget build_get_button(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await getLocation();
      },
      child: Text('Get Location'),
    );
  }

  Widget build_back_button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Go back!'),
    );
  }

  Widget build_heading(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          'Find Me',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ));
  }

  Widget get_current_lati_long(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Text(
        current_location,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget get_current_address(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Text(
        currentAddress,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Me'),
      ),
      body: ListView(physics: const BouncingScrollPhysics(), children: <Widget>[
        build_heading(context),
        get_current_lati_long(context),
        build_get_button(context),
        const SizedBox(height: 10),
        build_back_button(context),
      ]),
    );
  }
}
