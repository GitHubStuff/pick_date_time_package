import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/header/header_bloc.dart';
import '../constants/constants.dart';
import '../date_time_extension/date_time_extension.dart';

const fontSize = 20.0;
const textStyle = TextStyle(
  fontSize: fontSize,
  fontWeight: FontWeight.bold,
  color: Colors.tealAccent,
);

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.itemExtent * 1.30,
      width: Constants.containerWidth,
      color: Constants.headerColor.of(brightness: Brightness.dark),
      child: _row(),
    );
  }

  Widget _button() {
    return IconButton(
      icon: _icon(),
      tooltip: 'Accept Date/Time',
      onPressed: () {},
    );
  }

  Widget _icon() {
    return Container(
      height: 36,
      width: 36,
      child: AspectRatio(
        aspectRatio: 1,
        child: Constants.setterImage,
      ),
    );
  }

  Widget _caption(String string) {
    return Text(
      string,
      style: textStyle,
    );
  }

  Widget _headerWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 4.0),
      child: _provider(),
    );
  }

  Widget _provider() {
    return BlocBuilder<HeaderBloc, HeaderState>(builder: (headerContext, state) {
      DateTime dateTime;
      switch (state.headerBuildState) {
        case HeaderBuildState.AdjustedDateTime:
          dateTime = (state as AdjustedDateTime).adjustedDateTime;
          break;
        case HeaderBuildState.HeaderInitial:
          dateTime = (state as HeaderInitial).initialDateTime;
          break;
      }
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _caption(dateTime.calendarText),
        _caption(dateTime.clockText),
      ]);
    });
  }

  Widget _row() {
    return Row(
      children: [
        _headerWidget(),
        Expanded(child: Container()),
        _button(),
      ],
    );
  }
}
