import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/observing_stateful_widget.dart';
import '../../constants/constants.dart';

class MeridianPicker extends StatefulWidget {
  @override
  _MeridianPicker createState() => _MeridianPicker();
}

class _MeridianPicker extends ObservingStatefulWidget<MeridianPicker> {
  FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController();
  }

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _picker(),
      height: Constants.meridianContainer.height,
      width: Constants.meridianContainer.width,
    );
  }

  Widget _picker() {
    return CupertinoPicker(
      offAxisFraction: 1.3,
      children: [Constants.text('AM'), Constants.text('PM')],
      scrollController: _scrollController,
      itemExtent: Constants.itemExtent,
      onSelectedItemChanged: (index) {},
    );
  }
}
