import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/widgets/custom_clippath.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DateSelected extends StatefulWidget {
  DateSelected();

  @override
  _DateSelectedState createState() => _DateSelectedState();
}

class _DateSelectedState extends State<DateSelected> {
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
                  child: ContentColumn(),
                ))
          ],
        ));
  }
}

class ContentColumn extends StatefulWidget {
  @override
  State<ContentColumn> createState() => _ContentColumnState();
}

class _ContentColumnState extends State<ContentColumn> {
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

  final _arrivalDateController = TextEditingController();

  final _departureDateController = TextEditingController();

  DateTime arrivalDate = DateTime.now().subtract(const Duration(days: 1));
  DateTime departureDate = DateTime.now().add(const Duration(days: 1));

  @override
  void initState() {
    _arrivalDateController.text = DateFormat('MMM dd,yyyy')
        .format(DateTime.now().subtract(const Duration(days: 1)));
    _departureDateController.text = DateFormat('MMM dd,yyyy')
        .format(DateTime.now().add(const Duration(days: 1)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose Dates'),
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
        Container(
          height: 302,
          width: 315,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 1)),
                  DateTime.now().add(const Duration(days: 1))),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
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
              Navigator.pushNamed(context, '/home', arguments: {
                'arrivalDate': arrivalDate,
                'departureDate': departureDate,
              });
            },
            child: const Text('Apply'),
          ),
        ),
      ],
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      // print(args.value.startDate);
      _arrivalDateController.text =
          DateFormat('MMM dd,yyyy').format(args.value.startDate);
      arrivalDate = args.value.startDate;
      if (args.value.endDate != null) {
        // print(args.value.endDate);
        _departureDateController.text =
            DateFormat('MMM dd,yyyy').format(args.value.endDate);
        departureDate = args.value.endDate;
      }
    }
  }
}
