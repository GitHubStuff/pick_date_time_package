import 'package:flutter/material.dart';
import 'package:pick_date_time_package/constants/constants.dart';
import '../pickers/month_picker.dart' as Month;
import '../pickers/year_picker.dart' as Year;
import '../pickers/day_picker.dart' as Day;

class CalendarPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: Constants.clockContainer.height,
      width: Constants.clockContainer.width,
      child: Row(
        children: [Day.DayPicker(), Month.MonthPicker(), Year.YearPicker()],
      ),
    );
  }
}
