import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';

import '../../constants/observing_stateful_widget.dart';

class MonthPicker extends StatefulWidget {
  @override
  _MonthPicker createState() => _MonthPicker();
}

class _MonthPicker extends ObservingStatefulWidget<MonthPicker> {
  FixedExtentScrollController _scrollController;
  // ignore: unused_field
  int _pickedValue;

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _listener(),
      height: Constants.monthContainer.height,
      width: Constants.monthContainer.width,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: 0);
  }

  List<Widget> _months() {
    List<Widget> result = List();
    result.add(Constants.text('Jan'));
    result.add(Constants.text('Feb'));
    result.add(Constants.text('Mar'));
    result.add(Constants.text('Apr'));
    result.add(Constants.text('May'));
    result.add(Constants.text('Jun'));
    result.add(Constants.text('Jul'));
    result.add(Constants.text('Aug'));
    result.add(Constants.text('Sep'));
    result.add(Constants.text('Oct'));
    result.add(Constants.text('Nov'));
    result.add(Constants.text('Dec'));
    return result;
  }

  Widget _listener() {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            //Will only update when user has stopped scrolling in picker.
            return true;
          } else {
            return false;
          }
        },
        child: _thePicker());
  }

  Widget _thePicker() {
    return CupertinoPicker.builder(
      scrollController: _scrollController,
      itemExtent: Constants.itemExtent,
      itemBuilder: (context, index) {
        int offset;
        if (index < 0) {
          offset = (12 - (index.abs() % 12) % 12);
          if (offset == 12) offset = 0;
        } else {
          offset = index % 12;
        }
        return _months()[offset];
      },
      onSelectedItemChanged: (index) {
        int offset;
        if (index < 0) {
          offset = (12 - (index.abs() % 12) % 12);
          if (offset == 12) offset = 0;
        } else {
          offset = index % 12;
        }
        _pickedValue = index;
      },
    );
  }
}
