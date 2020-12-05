import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

import '../widgets/observing_stateful_widget.dart';

class HourPicker extends StatefulWidget {
  @override
  _HourPicker createState() => _HourPicker();
}

class _HourPicker extends ObservingStatefulWidget<HourPicker> {
  FixedExtentScrollController _scrollController;
  // ignore: unused_field
  int _pickedValue;

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _listener(),
      height: Constants.hourContainer.height,
      width: Constants.hourContainer.width,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: 0);
  }

  List<Widget> _hours() {
    List<Widget> result = List();
    result.add(Constants.text(' 1'));
    result.add(Constants.text(' 2'));
    result.add(Constants.text(' 3'));
    result.add(Constants.text(' 4'));
    result.add(Constants.text(' 5'));
    result.add(Constants.text(' 6'));
    result.add(Constants.text(' 7'));
    result.add(Constants.text(' 8'));
    result.add(Constants.text(' 9'));
    result.add(Constants.text('10'));
    result.add(Constants.text('11'));
    result.add(Constants.text('12'));
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
      offAxisFraction: -0.4,
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
        return _hours()[offset];
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
