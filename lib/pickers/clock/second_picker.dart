import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/observing_stateful_widget.dart';
import '../../constants/constants.dart';

class SecondPicker extends StatefulWidget {
  @override
  _SecondPicker createState() => _SecondPicker();
}

class _SecondPicker extends ObservingStatefulWidget<SecondPicker> {
  FixedExtentScrollController _scrollController;
  // ignore: unused_field
  int _pickedValue;

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _listener(),
      height: Constants.secondContainer.height,
      width: Constants.secondContainer.width,
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
      offAxisFraction: 0.4,
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
