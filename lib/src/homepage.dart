import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_huweii/src/models/info_hotel_searching.dart';
import 'package:online_learning_huweii/src/widgets/custom_clippath.dart';
import 'package:online_learning_huweii/src/widgets/date_selected.dart';
import 'package:online_learning_huweii/src/widgets/location_selected.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              child: FormHome(),
            ))
      ],
    ));
  }
}

class FormHome extends StatefulWidget {
  FormHome({
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

  void locationFunc(newLocation) {
    _locationController.text = newLocation;
  }

  @override
  Widget build(BuildContext context) {
    print(_locationController.text.toString());
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
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        LocationSelected(locationFunc: locationFunc)));
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
          onTap: () {},
          obscureText: true,
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
          onPressed: () {},
          child: const Text('Search'),
        ),
      ],
    );
  }
}
