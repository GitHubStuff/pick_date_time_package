import 'package:flutter/material.dart';
import 'package:pick_date_time_package/constants/constants.dart';
import 'package:pick_date_time_package/pick_date_time_package.dart';
import 'package:pick_date_time_package/wrapper_widgets/header_control.dart';

import 'calendar_picker.dart';
import 'clock_picker.dart';

class OverlayPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HeaderControl(),
      SegmentControl(segmentedControlValue: 1),
      _container(),
    ]);
  }

  Widget _container() {
    return Container(
      width: Constants.containerWidth,
      height: Constants.containerHeight,
      child: Stack(
        children: [CalendarPicker(), ClockPicker()],
      ),
    );
  }
}
