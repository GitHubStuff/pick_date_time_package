import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/active_segment/active_segment_bloc.dart';
import '../constants/constants.dart';

class SegmentWidget extends StatelessWidget {
  const SegmentWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int segmentControl = 0;
    Color selectedColor = Constants.dateColor.of(brightness: Brightness.dark);
    Color unSelectedColor = Constants.timeColor.of(brightness: Brightness.dark);
    return BlocBuilder<ActiveSegmentBloc, ActiveSegmentState>(builder: (context, state) {
      switch (state.activeSegmentBuilderState) {
        case ActiveSegmentBuilderState.ActiveSegmentInitial:
          break;
        case ActiveSegmentBuilderState.ActiveSegmentSelection:
          final selection = (state as ActiveSegmentSelection).pickerSegment;
          switch (selection) {
            case PickerSegment.date:
              segmentControl = 0;
              selectedColor = Constants.dateColor.of(brightness: Brightness.dark);
              unSelectedColor = Constants.timeColor.of(brightness: Brightness.dark);
              break;
            case PickerSegment.time:
              segmentControl = 1;
              selectedColor = Constants.timeColor.of(brightness: Brightness.dark);
              unSelectedColor = Constants.dateColor.of(brightness: Brightness.dark);
          }
      }
      return Container(
          width: Constants.containerWidth,
          child: CupertinoSegmentedControl<int>(
            selectedColor: selectedColor,
            unselectedColor: unSelectedColor,
            borderColor: selectedColor,
            padding: EdgeInsets.zero,
            children: {
              0: Container(
                height: 25,
                child: Constants.text('Date'),
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              1: Container(
                height: 25,
                child: Constants.text('Time'),
                margin: const EdgeInsets.symmetric(vertical: 10),
              )
            },
            onValueChanged: (int val) {
              context.read<ActiveSegmentBloc>().add(SelectPicker(val == 0 ? PickerSegment.date : PickerSegment.time));
            },
            groupValue: segmentControl,
          ));
    });
  }
}
