import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/sample_data/page_content.dart';

import 'configs/theme/app_theme.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({Key? key}) : super(key: key);
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

  TextStyle titleStyle = const TextStyle(
      fontFamily: 'Metro',
      fontSize: 19,
      fontWeight: FontWeight.bold,
      color: Color(0xff323643));
  TextStyle desStyle = TextStyle(
      fontFamily: 'Metro',
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: const Color(0xff323643).withOpacity(0.5));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 65,
        ),
        SizedBox(
          height: 620.0,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (BuildContext ctx, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(walkThroughContent[index].image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (int idx) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: index == idx
                                    ? const Color(0xff3FB6F7)
                                    : Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, right: 30, left: 30),
                    child: Text(walkThroughContent[index].title,
                        style: titleStyle),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 9.0, right: 30, left: 30),
                    child: Text(walkThroughContent[index].description,
                        style: desStyle),
                  ),
                ],
              );
            },
            itemCount: 3,
            controller: _controller,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 11),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(width: 2.0, color: Color(0xff999999)),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const Text(
              'Get Started',
              style: TextStyle(
                color: Color(0xff999999),
                fontFamily: 'Metro',
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          ),
        )
      ],
    ));
  }
}
