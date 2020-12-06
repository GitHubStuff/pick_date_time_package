import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../pickers/calendar/month_picker.dart' as Month;
import '../pickers/calendar/year_picker.dart' as Year;
import '../pickers/calendar/day_picker.dart' as Day;

/// Holds [Day.DayPicker] [Month.MonthPicker] [Year.YearPicker] in a [Container]
class CalendarPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Constants.dateColor.of(brightness: Brightness.dark);
    return Container(
      color: color,
      height: Constants.clockContainer.height,
      width: Constants.clockContainer.width,
      child: Row(
        children: [Day.DayPicker(), Month.MonthPicker(), Year.YearPicker()],
      ),
    );
  }
}
