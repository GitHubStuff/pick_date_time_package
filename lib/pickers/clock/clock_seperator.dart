import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_package/theme_package.dart';
import '../../constants/constants.dart';

class ClockSeperator extends StatefulWidget {
  @override
  _ClockSeperator createState() => _ClockSeperator();
}

class _ClockSeperator extends ObservingStatefulWidget<ClockSeperator> {
  FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController();
  }

  @override
  void afterFirstLayoutComplete(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _picker(),
      height: Constants.seperatorContainer.height,
      width: Constants.seperatorContainer.width,
    );
  }

  Widget _picker() {
    return CupertinoPicker(
      children: [
        Align(
          child: Constants.text(':'),
          alignment: Alignment.topLeft,
        )
      ],
      scrollController: _scrollController,
      itemExtent: Constants.itemExtent,
      onSelectedItemChanged: (index) {},
    );
  }
}
