import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theme_package/theme_package.dart';
import '../../constants/constants.dart';

class DayPicker extends StatefulWidget {
  @override
  _DayPicker createState() => _DayPicker();
}

class _DayPicker extends ObservingStatefulWidget<DayPicker> {
  int _dayCount = 31;
  FixedExtentScrollController _scrollController;
  // ignore: unused_field
  int _pickedValue;

  @override
  void afterFirstLayoutComplete(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _listener(),
      height: Constants.dayContainer.height,
      width: Constants.dayContainer.width,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: 0);
  }

  List<Widget> _days() {
    List<Widget> result = List();
    final numberFormat = NumberFormat('0');
    for (int i = 1; i <= _dayCount; i++) {
      final text = numberFormat.format(i);
      result.add(Constants.text(text));
    }
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
      offAxisFraction: -0.2,
      scrollController: _scrollController,
      itemExtent: Constants.itemExtent,
      itemBuilder: (context, index) {
        int offset;
        if (index < 0) {
          offset = (_dayCount - (index.abs() % _dayCount) % _dayCount);
          if (offset == _dayCount) offset = 0;
        } else {
          offset = index % _dayCount;
        }
        return _days()[offset];
      },
      onSelectedItemChanged: (index) {
        int offset;
        if (index < 0) {
          offset = (_dayCount - (index.abs() % _dayCount) % _dayCount);
          if (offset == _dayCount) offset = 0;
        } else {
          offset = index % _dayCount;
        }
        _pickedValue = index;
      },
    );
  }
}
