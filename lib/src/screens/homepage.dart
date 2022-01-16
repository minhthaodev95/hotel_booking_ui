import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:online_learning_huweii/src/models/info_hotel_searching.dart';
import 'package:online_learning_huweii/src/widgets/custom_clippath.dart';
import 'package:online_learning_huweii/src/widgets/date_selected.dart';
import 'package:online_learning_huweii/src/widgets/location_selected.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_learning_huweii/src/widgets/numbers_guest_selected.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage(
      {this.location,
      this.arrivalDate,
      this.departureDate,
      this.guests,
      Key? key})
      : super(key: key);

  final String? location;
  final DateTime? arrivalDate;
  final DateTime? departureDate;
  final List<int>? guests;
  InfoHotelSearching infoSearching = InfoHotelSearching();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // input decoration

  // final box = Hive.box('infoBox');
  // final infoSearching2 = InfoHotelSearching(
  //   location: 'Barcelona/Spain',
  //   arrivalDate: DateTime.now(),
  //   departureDate: DateTime.now().add(const Duration(hours: 1)),
  // );
  // InfoHotelSearching infoSearching = InfoHotelSearching();

  @override
  void initState() {
    // box.add(infoSearching);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('info:  ${box.getAt(0).location}');

    return Scaffold(
        body: Stack(
      children: [
        ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background01.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 2 - 58,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: const FormHome(),
            ))
      ],
    ));
  }
}

class FormHome extends StatefulWidget {
  const FormHome({
    Key? key,
  }) : super(key: key);

  @override
  State<FormHome> createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  TextStyle style1 = const TextStyle(
    color: Color(0xff777777),
    fontSize: 11,
    fontFamily: 'Metro',
    fontWeight: FontWeight.w500,
  );

  TextStyle style2 = const TextStyle(
    color: Color(0xff323643),
    fontSize: 12,
    fontFamily: 'Metro',
    fontWeight: FontWeight.w600,
  );

  final InputDecoration _inputDecoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: const Color(0xff323643).withOpacity(0.1)),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff3FB6F7)),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.only(top: 9, bottom: 9, left: 6, right: 6),
  );

  //controller
  final _locationController = TextEditingController();

  final _arrivalDateController = TextEditingController();

  final _departureDateController = TextEditingController();

  final _numOfGuestController = TextEditingController();

  // get box in hive db
  final box = Hive.box('infoBox');

  @override
  void initState() {
    //if value in hivedb != null >> change values in form

    if (box.getAt(0).location != null) {
      _locationController.text = box.getAt(0).location;
    }
    if (box.getAt(0).arrivalDate != null) {
      _arrivalDateController.text =
          DateFormat('MMM dd,yyyy').format(box.getAt(0).arrivalDate);
    }
    if (box.getAt(0).departureDate != null) {
      _departureDateController.text =
          DateFormat('MMM dd,yyyy').format(box.getAt(0).departureDate);
    }
    if (box.getAt(0).guests != null) {
      _numOfGuestController.text =
          '${box.getAt(0).guests[0]} Adults, ${box.getAt(0).guests[1]} Childrens';
    }
    // if (box.getAt(0).location != null) {
    //   _locationController.text = box.getAt(0).location;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(box.getAt(0).arrivalDate.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/icons/splash.svg'),
        const SizedBox(height: 71),
        const Text(
          'Find your hotel',
          style: TextStyle(
            color: Color(0xff323643),
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Metro',
          ),
        ),
        const SizedBox(height: 23),
        Text('Location', style: style1),
        TextFormField(
          readOnly: true,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LocationSelected()));
          },
          style: style2,
          controller: _locationController,
          decoration: _inputDecoration,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Arrival Date', style: style1),
                  TextFormField(
                    readOnly: true,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DateSelected()));
                    },
                    decoration: _inputDecoration,
                    controller: _arrivalDateController,
                    style: style2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Departure Date', style: style1),
                  TextFormField(
                    readOnly: true,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DateSelected()));
                    },
                    decoration: _inputDecoration,
                    controller: _departureDateController,
                    style: style2,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('Number of Guests', style: style1),
        TextFormField(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => NumbersGuestSelected()));
          },
          readOnly: true,
          style: style2,
          controller: _numOfGuestController,
          decoration: _inputDecoration,
        ),
        const SizedBox(height: 29),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            primary: const Color(0xff3FB6F7),
            minimumSize: const Size(double.infinity,
                46), // double.infinity is the width and 30 is the height
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/hotel_listing');
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}
