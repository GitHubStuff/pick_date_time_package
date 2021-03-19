import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_date_time_package/bloc/header/header_bloc.dart';
import 'package:theme_package/theme_package.dart';
import '../../constants/constants.dart';
import '../../date_time_extension/date_time_extension.dart';

class MeridianPicker extends StatefulWidget {
  @override
  _MeridianPicker createState() => _MeridianPicker();
}

class _MeridianPicker extends ObservingStatefulWidget<MeridianPicker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void afterFirstLayoutComplete(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _picker(),
      height: Constants.meridianContainer.height,
      width: Constants.meridianContainer.width,
    );
  }

  Widget _picker() {
    return BlocBuilder<HeaderBloc, HeaderState>(
      builder: (context, state) {
        int initialRow;
        switch (state.headerBuildState) {
          case HeaderBuildState.AdjustedDateTime:
            final meridian = (state as AdjustedDateTime).adjustedDateTime.meridian;
            initialRow = (meridian == Meridian.AM ? 0 : 1);
            break;
          case HeaderBuildState.HeaderInitial:
            final meridian = (state as HeaderInitial).initialDateTime.meridian;
            initialRow = (meridian == Meridian.AM ? 0 : 1);
            break;
        }
        return CupertinoPicker(
          offAxisFraction: 1.3,
          children: [Constants.text('AM'), Constants.text('PM')],
          scrollController: FixedExtentScrollController(initialItem: initialRow),
          itemExtent: Constants.itemExtent,
          onSelectedItemChanged: (index) {
            context.read<HeaderBloc>().add(SetMeridianEvent(index == 0 ? Meridian.AM : Meridian.PM));
          },
        );
      },
    );
  }
}
