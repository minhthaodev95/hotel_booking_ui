import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_huweii/src/widgets/custom_clippath.dart';

class HotelSearching extends StatefulWidget {
  const HotelSearching({Key? key}) : super(key: key);
  @override
  _HotelSearchingState createState() => _HotelSearchingState();
}

class _HotelSearchingState extends State<HotelSearching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff323643).withOpacity(0.05),
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 15.0),
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/filter_icon.svg',
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 15.0),
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/searching.svg',
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff323643).withOpacity(0.05),
                ),
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: ContentHotelSearching(),
              ))
        ],
      ),
    );
  }
}

class ContentHotelSearching extends StatefulWidget {
  @override
  State<ContentHotelSearching> createState() => _ContentHotelSearchingState();
}

class _ContentHotelSearchingState extends State<ContentHotelSearching> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
