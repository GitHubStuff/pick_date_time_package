import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_date_time_package/date_time_extension/picker_datetime.dart';
import 'package:theme_package/theme_package.dart';

import '../bloc/active_segment/active_segment_bloc.dart';
import '../bloc/header/header_bloc.dart';
import '../popover/datetime_container_widget.dart';

class DateTimePopoverWidget extends StatelessWidget {
  final DateTime initialDateTime;
  const DateTimePopoverWidget({Key key, this.initialDateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Log.setTrace(baseLevel: LogLevel.All);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ActiveSegmentBloc>(create: (_) => ActiveSegmentBloc()),
        BlocProvider<HeaderBloc>(create: (_) => HeaderBloc(PickerDateTime(initialDateTime).dateTime)),
      ],
      child: DateTimeContainerWidget(),
    );
  }
}
