import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hotel_booking/src/models/info_hotel_searching.dart';
import 'package:hotel_booking/src/sample_data/list_city.dart';

import 'custom_clippath.dart';

class LocationSelected extends StatefulWidget {
  const LocationSelected({Key? key}) : super(key: key);

  @override
  _LocationSelectedState createState() => _LocationSelectedState();
}

class _LocationSelectedState extends State<LocationSelected> {
  final box = Hive.box('infoBox');
  InfoHotelSearching infoSearching = InfoHotelSearching();
  @override
  initState() {
    if (box.isNotEmpty) {
      infoSearching = box.getAt(0);
    }
    super.initState();
  }

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
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
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
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // const SizedBox(height: 5),
                    const Text('Select Location',
                        style: TextStyle(
                          fontFamily: 'Metro',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 40.0,
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Metro",
                            color: Color(0xff323643)),
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
                                color:
                                    const Color(0xff323643).withOpacity(0.5)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: listCity(infoSearching),
                    ),
                  ],
                ),
              ))
        ],
      ),
      // body:
    );
  }

  Widget listCity(InfoHotelSearching infoSearching) {
    return ListView.builder(
      itemCount: bigCitys.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            infoSearching.location = bigCitys[index].name;
            box.put(0, infoSearching);
            Navigator.pushNamed(context, '/home');
          },
          child: (infoSearching.location == bigCitys[index].name)
              ? Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 36,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          bigCitys[index].name,
                          style: const TextStyle(
                              color: Color(0xff3FB6F7),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Metro'),
                        ),
                        const Icon(Icons.check,
                            size: 16, color: Color(0xff3FB6F7)),
                      ]),
                )
              : Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 36,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      bigCitys[index].name,
                      style: const TextStyle(
                          color: Color(0xff323643),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Metro'),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
