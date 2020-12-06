import 'package:flutter/material.dart';

import '../component_pickers/calendar_picker.dart';
import '../component_pickers/clock_picker.dart';
import '../component_pickers/header_widget.dart';
import '../component_pickers/segment_widget.dart';
import '../constants/constants.dart';

/// Holds
class DateTimeContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HeaderWidget(),
      SegmentWidget(segmentedControlValue: 1),
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
