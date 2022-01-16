import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomModalSheet extends StatefulWidget {
  const BottomModalSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomModalSheet> createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  TextStyle titleStyle = const TextStyle(
      fontFamily: 'Metro',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(0xff323643));

  double _startValue = 50;
  double _endValue = 200;
  List<String> childLocation = [
    'Born',
    'Location 2',
    'Location 3',
    'Location 5',
    'Location 10'
  ];
  List<String> childLocationChoiced = [];
  List<int> listHotelRating = [1, 2, 3, 4, 5];
  List<int> listHotelRatingChoiced = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        height: 407.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hotel Rating', style: titleStyle),
            const SizedBox(height: 13.0),
            Wrap(
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (listHotelRatingChoiced
                          .contains(listHotelRating[index])) {
                        listHotelRatingChoiced.remove(listHotelRating[index]);
                      } else {
                        listHotelRatingChoiced.add(listHotelRating[index]);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: listHotelRatingChoiced
                                .contains(listHotelRating[index])
                            ? const Color(0xff3FB6F7)
                            : const Color(0xffD8D8D8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        listHotelRating[index],
                        (idx) => Icon(
                          Icons.star,
                          size: 16,
                          color: listHotelRatingChoiced
                                  .contains(listHotelRating[index])
                              ? const Color(0xff3FB6F7)
                              : const Color(0xffD8D8D8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text('Location', style: titleStyle),
            const SizedBox(height: 13.0),
            Wrap(
              children: List.generate(
                childLocation.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (childLocationChoiced.contains(childLocation[index])) {
                        childLocationChoiced.remove(childLocation[index]);
                      } else {
                        childLocationChoiced.add(childLocation[index]);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            childLocationChoiced.contains(childLocation[index])
                                ? const Color(0xff3FB6F7)
                                : const Color(0xffD8D8D8),
                      ),
                    ),
                    child: Text(
                      childLocation[index],
                      style: TextStyle(
                        color:
                            childLocationChoiced.contains(childLocation[index])
                                ? const Color(0xff3FB6F7)
                                : const Color(0xffD8D8D8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text('Price', style: titleStyle),
            const SizedBox(height: 13.0),
            SliderTheme(
              data: const SliderThemeData(
                showValueIndicator: ShowValueIndicator.always,
                trackHeight: 6,
                activeTrackColor: Color(0xff3FB6F7),
                // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              ),
              child: RangeSlider(
                activeColor: const Color(0xff3FB6F7),
                inactiveColor: const Color(0xff323643).withOpacity(0.1),
                values: RangeValues(_startValue, _endValue),
                min: 0.0,
                max: 500.0,
                divisions: 300,
                labels: RangeLabels('$_startValue', '$_endValue'),
                onChanged: (values) {
                  setState(() {
                    _startValue = values.start.roundToDouble();
                    _endValue = values.end.roundToDouble();
                  });
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  primary: const Color(0xff3FB6F7),
                  minimumSize: const Size(double.infinity,
                      46), // double.infinity is the width and 30 is the height
                ),
                onPressed: () {},
                child: const Text('Apply Filter'),
              ),
            ),
          ],
        ));
  }
}
