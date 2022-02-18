import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:hotel_booking/src/models/info_hotel_searching.dart';
import 'package:hotel_booking/src/sample_data/list_hotels.dart';
import 'package:hotel_booking/src/widgets/custom_clippath.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking/src/widgets/modal_bottom_sheet.dart';

import 'hotel_details.dart';
import 'hotel_searching.dart';

class HotelsListing extends StatefulWidget {
  const HotelsListing({Key? key}) : super(key: key);
  @override
  _HotelsListingState createState() => _HotelsListingState();
}

class _HotelsListingState extends State<HotelsListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff323643).withOpacity(0.05),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HotelSearching(),
                ),
              );
            },
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
                child: ListHotels(),
              ))
        ],
      ),
    );
  }
}

class ListHotels extends StatefulWidget {
  const ListHotels({Key? key}) : super(key: key);

  @override
  State<ListHotels> createState() => _ListHotelsState();
}

class _ListHotelsState extends State<ListHotels> {
  final box = Hive.box('infoBox');
  InfoHotelSearching infoSearching = InfoHotelSearching();
  int totalGuests = 0;

  @override
  void initState() {
    if (box.isNotEmpty) {
      infoSearching = box.getAt(0);
      totalGuests = infoSearching.guests![0] + infoSearching.guests![1];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          infoSearching.location!,
          style: const TextStyle(
            fontFamily: 'Metro',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 26.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff323643),
              ),
              child: Row(children: [
                SvgPicture.asset(
                  'assets/icons/calendar_icon.svg',
                ),
                const SizedBox(width: 5),
                Text(
                  DateFormat.MMMd().format(infoSearching.arrivalDate!),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Metro'),
                ),
                const Text(
                  ' - ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Metro'),
                ),
                Text(
                  DateFormat.MMMd().format(infoSearching.departureDate!),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Metro'),
                ),
              ]),
            ),
            const SizedBox(width: 10.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 26.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff323643),
              ),
              child: Row(children: [
                SvgPicture.asset(
                  'assets/icons/person.svg',
                ),
                const SizedBox(width: 5),
                Text(
                  '$totalGuests Guests',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Metro'),
                ),
              ]),
            ),
            const SizedBox(width: 10.0),
            GestureDetector(
              onTap: _showModalBottomSheet,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 26.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff3FB6F7),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/dropdown_filter.svg',
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'More Filters',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Metro'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),

        // list hotel
        Expanded(
          child: ListView.builder(
            itemCount: listHotels.length,
            itemBuilder: (context, index) {
              return Column(children: <Widget>[
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage(listHotels[index].featureImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => HotelDetails()));
                        },
                        child: Text(
                          listHotels[index].name,
                          style: const TextStyle(
                            color: Color(0xff323643),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Metro',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            listHotels[index].isFavorite =
                                !listHotels[index].isFavorite;
                          });
                        },
                        child: Icon(Icons.favorite_border,
                            size: 14.0,
                            color: listHotels[index].isFavorite
                                ? const Color(0xff3FB6F7)
                                : const Color(0xff323643).withOpacity(0.25)),
                      ),
                    ]),
                const SizedBox(height: 3.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              listHotels[index].location,
                              style: TextStyle(
                                color: const Color(0xff323643).withOpacity(0.5),
                                fontSize: 11.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Metro',
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            Row(children: <Widget>[
                              RatingBar.builder(
                                itemSize: 12,
                                initialRating:
                                    listHotels[index].starRate.toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Color(0xff3FB6F7),
                                ),
                                onRatingUpdate: (double value) {},
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                '${listHotels[index].numberReviewers} reviews',
                                style: TextStyle(
                                  color:
                                      const Color(0xff323643).withOpacity(0.25),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Metro',
                                ),
                              )
                            ]),
                          ]),
                      RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                              text: '\$ ${listHotels[index].pricePerNight}',
                              style: const TextStyle(
                                  color: Color(0xff323643),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Metro'),
                              children: [
                                TextSpan(
                                  text: '\n per night',
                                  style: TextStyle(
                                      color: const Color(0xff323643)
                                          .withOpacity(0.25),
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Metro'),
                                )
                              ]))
                      // Text(
                      //   '\$324\n per night ',
                      //   textAlign: TextAlign.end,
                      // ),
                    ]),
                const SizedBox(height: 15.0),
              ]);
            },
          ),
        )
      ],
    );
  }

  void _showModalBottomSheet() {
    double _startValue = 50;
    double _endValue = 100;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return BottomModalSheet();
        });
  }
}
