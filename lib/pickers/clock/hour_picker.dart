import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_date_time_package/bloc/header/header_bloc.dart';
import 'package:theme_package/theme_package.dart';
import '../../constants/constants.dart';

class HourPicker extends StatefulWidget {
  @override
  _HourPicker createState() => _HourPicker();
}

class _HourPicker extends ObservingStatefulWidget<HourPicker> {
  int _pickedValue;

  @override
  void afterFirstLayoutComplete(BuildContext context) {}

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
    int startingHour = 0;
    return BlocBuilder<HeaderBloc, HeaderState>(
      builder: (context, state) {
        switch (state.headerBuildState) {
          case HeaderBuildState.AdjustedDateTime:
            startingHour = (state as AdjustedDateTime).adjustedDateTime.hour;
            //TODO:.... normalize hour
            break;
          case HeaderBuildState.HeaderInitial:
            startingHour = (state as HeaderInitial).initialDateTime.hour;
            break;
        }
        return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollEndNotification) {
                //Will only update when user has stopped scrolling in picker.
                context.read<HeaderBloc>().add(SetHourEvent(_pickedValue));
                return true;
              } else {
                return false;
              }
            },
            child: _thePicker(startingHour));
      },
    );
  }

  Widget _thePicker(int startingHour) {
    startingHour = (startingHour == 0) ? 11 : (startingHour % 12);
    return CupertinoPicker.builder(
      offAxisFraction: -0.4,
      scrollController: FixedExtentScrollController(initialItem: startingHour),
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
        _pickedValue = offset;
      },
    );
  }
}
