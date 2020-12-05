import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_date_time_package/constants/constants.dart';

class SegmentControl extends StatelessWidget {
  final segmentedControlValue;
  const SegmentControl({Key key, @required this.segmentedControlValue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Constants.containerWidth,
        child: CupertinoSegmentedControl<int>(
          selectedColor: Colors.blue,
          borderColor: Colors.green,
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
            debugPrint('VAL: $val');
            // setState(() {
            //   segmentedControlValue = val;
            // });
          },
          groupValue: segmentedControlValue,
        ));
  }
}
