import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hotel_booking/src/models/info_hotel_searching.dart';

import 'custom_clippath.dart';
import 'package:numberpicker/numberpicker.dart';

class NumbersGuestSelected extends StatefulWidget {
  const NumbersGuestSelected({Key? key}) : super(key: key);
  @override
  _NumbersGuestSelectedState createState() => _NumbersGuestSelectedState();
}

class _NumbersGuestSelectedState extends State<NumbersGuestSelected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff323643).withOpacity(0.05),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Stack(
        children: [
          ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff323643).withOpacity(0.05),
                ),
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: ContentColumnGuestSelected(),
              ))
        ],
      ),
    );
  }
}

class ContentColumnGuestSelected extends StatefulWidget {
  @override
  State<ContentColumnGuestSelected> createState() =>
      _ContentColumnGuestSelectedState();
}

class _ContentColumnGuestSelectedState
    extends State<ContentColumnGuestSelected> {
  int _adultsNumber = 1;
  int _childrens = 0;

  final box = Hive.box('infoBox');
  InfoHotelSearching infoSearching = InfoHotelSearching();

  @override
  void initState() {
    if (box.isNotEmpty) {
      infoSearching = box.getAt(0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 100),
      const Text('Adults',
          style: TextStyle(
            fontFamily: 'Metro',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          )),
      const SizedBox(height: 10),
      NumberPicker(
        axis: Axis.horizontal,
        minValue: 0,
        maxValue: 10,
        haptics: true,
        value: _adultsNumber,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black26),
        ),
        onChanged: (value) => setState(() => _adultsNumber = value),
      ),
      const SizedBox(height: 40),
      const Text('Children',
          style: TextStyle(
            fontFamily: 'Metro',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          )),
      const SizedBox(height: 10),
      NumberPicker(
        axis: Axis.horizontal,
        minValue: 0,
        maxValue: 10,
        haptics: true,
        value: _childrens,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black26),
        ),
        onChanged: (value) => setState(() => _childrens = value),
      ),
      Expanded(child: Container()),
      Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            primary: const Color(0xff3FB6F7),
            minimumSize: const Size(double.infinity,
                46), // double.infinity is the width and 30 is the height
          ),
          onPressed: () {
            infoSearching.guests = [_adultsNumber, _childrens];
            box.put(0, infoSearching);
            Navigator.pushNamed(context, '/home');
          },
          child: const Text('Apply'),
        ),
      ),
    ]);
  }
}
