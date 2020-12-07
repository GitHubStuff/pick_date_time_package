import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theme_package/theme_package.dart';
import '../../constants/constants.dart';


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
    for (int month = DateTime.january; month <= DateTime.december; month++) {
      final dateTime = DateTime(2000, month);
      final monthName = DateFormat('MMM').format(dateTime);
      result.add(Constants.text('$monthName'));
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
