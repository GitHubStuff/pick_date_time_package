import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';

import '../widgets/observing_stateful_widget.dart';

class MinutePicker extends StatefulWidget {
  @override
  _MinutePicker createState() => _MinutePicker();
}

class _MinutePicker extends ObservingStatefulWidget<MinutePicker> {
  FixedExtentScrollController _scrollController;
  // ignore: unused_field
  int _pickedValue;

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _listener(),
      height: Constants.minuteContainer.height,
      width: Constants.minuteContainer.width,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: 0);
  }

  List<Widget> _hours() {
    List<Widget> result = List();
    final numberFormat = NumberFormat('00');
    for (int i = 0; i < 60; i++) {
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
      offAxisFraction: -0.25,
      scrollController: _scrollController,
      itemExtent: Constants.itemExtent,
      itemBuilder: (context, index) {
        int offset;
        if (index < 0) {
          offset = (60 - (index.abs() % 60) % 60);
          if (offset == 60) offset = 0;
        } else {
          offset = index % 60;
        }
        return _hours()[offset];
      },
      onSelectedItemChanged: (index) {
        int offset;
        if (index < 0) {
          offset = (60 - (index.abs() % 60) % 60);
          if (offset == 60) offset = 0;
        } else {
          offset = index % 60;
        }
        _pickedValue = index;
      },
    );
  }
}
