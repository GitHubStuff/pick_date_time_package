import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_date_time_package/constants/constants.dart';
import 'package:theme_package/theme_package.dart';


class YearPicker extends StatefulWidget {
  @override
  _YearPicker createState() => _YearPicker();
}

class _YearPicker extends ObservingStatefulWidget<YearPicker> {
  FixedExtentScrollController _scrollController;
  int _pickedValue;

  @override
  void afterFirstLayoutComplete(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return _container();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: 120);
  }

  Widget _container() {
    return Container(
      child: _listener(),
      height: Constants.yearContainer.height,
      width: Constants.yearContainer.width,
    );
  }

  Widget _listener() {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            //Will only update when user has stopped scrolling in picker.
            if (_pickedValue < -200) {
              Future.delayed(Duration(milliseconds: 50), () {
                _scrollController.animateToItem(-200, duration: Duration(milliseconds: 500), curve: Curves.ease);
              });
            } else if (_pickedValue > 300) {
              Future.delayed(Duration(milliseconds: 50), () {
                _scrollController.animateToItem(300, duration: Duration(milliseconds: 500), curve: Curves.ease);
              });
            }
            return true;
          } else {
            return false;
          }
        },
        child: _thePicker());
  }

  Widget _thePicker() {
    return CupertinoPicker.builder(
      offAxisFraction: 0.2,
      scrollController: _scrollController,
      itemExtent: Constants.itemExtent,
      itemBuilder: (context, index) {
        final year = index + 1900;
        return Constants.text('$year');
      },
      onSelectedItemChanged: (index) {
        _pickedValue = _scrollController.selectedItem;
      },
    );
  }
}
