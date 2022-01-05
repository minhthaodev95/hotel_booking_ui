import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';
import 'package:online_learning_huweii/src/models/info_hotel_searching.dart';

class LocationSelected extends StatefulWidget {
  LocationSelected({required this.locationFunc, Key? key}) : super(key: key);

  final Function locationFunc;
  @override
  _LocationSelectedState createState() => _LocationSelectedState();
}

class _LocationSelectedState extends State<LocationSelected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'LocationSelected',
        style: TextStyle(color: Colors.white),
      )),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            widget.locationFunc('Madrid, Spain');
            Navigator.pushNamed(context, '/home');
          },
          child: Text('Apply'),
        ),
      ),
    );
  }
}
