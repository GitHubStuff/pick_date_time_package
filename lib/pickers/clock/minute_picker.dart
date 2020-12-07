import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pick_date_time_package/bloc/header/header_bloc.dart';
import 'package:theme_package/theme_package.dart';
import '../../constants/constants.dart';

class MinutePicker extends StatefulWidget {
  @override
  _MinutePicker createState() => _MinutePicker();
}

class _MinutePicker extends ObservingStatefulWidget<MinutePicker> {
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
    int startingMinute = 0;
    return BlocBuilder<HeaderBloc, HeaderState>(builder: (context, state) {
      switch (state.headerBuildState) {
        case HeaderBuildState.AdjustedDateTime:
          startingMinute = (state as AdjustedDateTime).adjustedDateTime.minute;
          break;
        case HeaderBuildState.HeaderInitial:
          startingMinute = (state as HeaderInitial).initialDateTime.minute;
          break;
      }
      return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification) {
              //Will only update when user has stopped scrolling in picker.
              context.read<HeaderBloc>().add(SetMinuteEvent(_pickedValue));
              return true;
            } else {
              return false;
            }
          },
          child: _thePicker(startingMinute));
    });
  }

  Widget _thePicker(int startingMinute) {
    return CupertinoPicker.builder(
      offAxisFraction: -0.25,
      scrollController: FixedExtentScrollController(initialItem: startingMinute),
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
        _pickedValue = offset;
      },
    );
  }
}
