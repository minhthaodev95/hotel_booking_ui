import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/src/models/hotel_model.dart';
import 'package:hotel_booking/src/sample_data/list_hotels.dart';
import 'package:hotel_booking/src/widgets/custom_clippath.dart';

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
  const ContentHotelSearching({Key? key}) : super(key: key);

  @override
  State<ContentHotelSearching> createState() => _ContentHotelSearchingState();
}

class _ContentHotelSearchingState extends State<ContentHotelSearching> {
  List<HotelModel> listHotelFilted = [];
  TextEditingController searchingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Search Hotels',
          style: TextStyle(
            fontFamily: 'Metro',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: 40.0,
          child: TextFormField(
            textDirection: TextDirection.ltr,
            onChanged: (str) {
              setState(() {
                listHotelFilted = listHotels
                    .where((element) => element.name.contains(str))
                    .toList();
              });
            },
            controller: searchingController,
            style: const TextStyle(
                fontSize: 16.0, fontFamily: "Metro", color: Color(0xff323643)),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              filled: true,
              fillColor: const Color(0xff323643).withOpacity(0.1),
              hintText: "Search hotel name, location, amenities",
              hintStyle: TextStyle(
                fontSize: 11.0,
                fontFamily: "Metro",
                color: const Color(0xff323643).withOpacity(0.5),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Icon(Icons.search,
                    color: const Color(0xff323643).withOpacity(0.5)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
              itemCount: listHotelFilted.length,
              itemBuilder: (context, index) {
                return Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(
                                listHotelFilted[index].featureImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.only(
                                top: 7.0, bottom: 7.0, left: 10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: 170,
                                            child: Text(
                                              listHotelFilted[index].name,
                                              style: const TextStyle(
                                                color: Color(0xff323643),
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Metro',
                                              ),
                                            )),
                                        const Icon(
                                          Icons.favorite_border,
                                          size: 14.0,
                                        )
                                      ]),
                                  Expanded(child: Container()),
                                  Row(children: [
                                    RatingBar.builder(
                                      itemSize: 12,
                                      initialRating: listHotelFilted[index]
                                          .starRate
                                          .toDouble(),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Color(0xff3FB6F7),
                                      ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      '${listHotelFilted[index].numberReviewers} reviews',
                                      style: TextStyle(
                                        color: const Color(0xff323643)
                                            .withOpacity(0.25),
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Metro',
                                      ),
                                    )
                                  ]),
                                  const SizedBox(height: 5),
                                  RichText(
                                      textAlign: TextAlign.end,
                                      text: TextSpan(
                                        text:
                                            '\$ ${listHotelFilted[index].pricePerNight} / Night',
                                        style: TextStyle(
                                            color: const Color(0xff323643)
                                                .withOpacity(0.5),
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Metro'),
                                      ))
                                ]),
                          ),
                        )
                      ],
                    ));
              }),
        )
      ],
    );
  }
}
