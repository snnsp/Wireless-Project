import 'package:flutter/material.dart';
import 'package:project/data/student.dart';
import 'package:project/model/user.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  Widget build_heading(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ));
  }

  Widget build_mahidol_logo(BuildContext context) {
    final logoImage = Image.asset(
      'images/mahidol.png',
      height: 150,
      width: 150,
    );
    return logoImage;
  }

  Widget build_detail(BuildContext context) {
    const titleText = Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'WHERE Application',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    const subTitle = Text(
      'WHERE is a location awareness application that created by Detbodi Wetsirikun and Chaiyasit Apirakkitikul'
      ' from the Faculty of ICT Mahidol University. This application aim for find the user’s current location detail'
      'such as street, district, etc and also show the google map for more detail.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25,
      ),
    );
    final leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          titleText,
          subTitle,
        ],
      ),
    );
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: leftColumn,
        ),
      ],
    );
  }

  Widget build_back_button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        'Go back!',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget build_student_info(StudentInfo data, BuildContext context) {
    return Column(
      children: [
        ClipOval(
            child: Image.network(
          data.image,
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        )),
        Text(
          data.firstname + ' ' + data.lastname,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Student ID: ' + data.student_id,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget build_student(BuildContext context) {
    final ohm = StudentData.ohm;
    final boom = StudentData.boom;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.75,
          child: build_student_info(ohm, context),
        ),
        Flexible(child: build_student_info(boom, context))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About us'),
      ),
      body: ListView(physics: const BouncingScrollPhysics(), children: <Widget>[
        build_heading(context),
        build_mahidol_logo(context),
        build_detail(context),
        build_student(context),
        const SizedBox(height: 10),
        build_back_button(context),
      ]),
    );
  }
}
