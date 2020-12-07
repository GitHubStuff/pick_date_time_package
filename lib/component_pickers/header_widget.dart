import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/header/header_bloc.dart';
import '../constants/constants.dart';
import '../date_time_extension/date_time_extension.dart';

const fontSize = 20.0;
const textStyle = TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.itemExtent * 1.30,
      width: Constants.containerWidth,
      color: Colors.amber,
      child: _row(),
    );
  }

  Widget _button() {
    return IconButton(
      icon: Icon(Icons.volume_up),
      tooltip: 'Increase volume by 10',
      onPressed: () {},
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
