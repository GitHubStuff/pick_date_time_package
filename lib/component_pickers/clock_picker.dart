import 'package:flutter/material.dart';
import 'package:pick_date_time_package/constants/constants.dart';
import 'package:pick_date_time_package/pickers/clock_seperator.dart';
import '../pickers/meridian_picker.dart';
import '../pickers/hour_picker.dart';
import '../pickers/minute_picker.dart';
import '../pickers/second_picker.dart';

class ClockPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.clockContainer.height,
      width: Constants.clockContainer.width,
      child: Row(
        children: [
          HourPicker(),
          ClockSeperator(),
          MinutePicker(),
          ClockSeperator(),
          SecondPicker(),
          MeridianPicker(),
        ],
      ),
    );
  }
}
