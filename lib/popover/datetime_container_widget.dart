import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_date_time_package/bloc/active_segment/active_segment_bloc.dart';

import '../component_pickers/calendar_picker.dart';
import '../component_pickers/clock_picker.dart';
import '../component_pickers/header_widget.dart';
import '../component_pickers/segment_widget.dart';
import '../constants/constants.dart';

/// Holds
class DateTimeContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: Column(children: [
          HeaderWidget(),
          SegmentWidget(),
          _container(),
        ]));
  }

  Widget _container() {
    return BlocBuilder<ActiveSegmentBloc, ActiveSegmentState>(builder: (context, state) {
      Widget picker = CalendarPicker();
      if (!(state is ActiveSegmentInitial)) {
        final pickerChoice = (state as ActiveSegmentSelection).pickerSegment;
        picker = (pickerChoice == PickerSegment.date) ? CalendarPicker() : ClockPicker();
      }
      return Container(
        width: Constants.containerWidth,
        height: Constants.containerHeight,
        child: picker,
      );
    });
  }
}
