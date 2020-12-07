import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../pickers/clock/clock_seperator.dart';
import '../pickers/clock/meridian_picker.dart';
import '../pickers/clock/hour_picker.dart';
import '../pickers/clock/minute_picker.dart';
import '../pickers/clock/second_picker.dart';

/// Holds [HourPicker] [ClockSeperator] [MinutePicker] [ClockSeperator] [MeridianPicker] in a container
class ClockPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Constants.timeColor.of(brightness: Brightness.dark);
    return Container(
      color: color,
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
