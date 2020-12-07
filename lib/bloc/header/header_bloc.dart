import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pick_date_time_package/date_time_extension/date_time_extension.dart';
import 'package:theme_package/theme_package.dart';

part 'header_event.dart';
part 'header_events.dart';
part 'header_state.dart';
part 'header_states.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  DateTime _dateTimeUTC;
  HeaderBloc(DateTime dateTime)
      : _dateTimeUTC = dateTime,
        super(HeaderInitial(dateTime.toLocal()));

  @override
  Stream<HeaderState> mapEventToState(HeaderEvent event) async* {
    Log.T('before: $_dateTimeUTC');
    switch (event.headerEventType) {
      case HeaderEventType.SetMeridianEvent:
        final meridian = (event as SetMeridianEvent).meridian;
        _dateTimeUTC = _dateTimeUTC.setMeridian(meridian);
        break;
      case HeaderEventType.SetMinuteEvent:
        final minute = (event as SetMinuteEvent).minute;
        _dateTimeUTC = _dateTimeUTC.setMinute(minute);
        break;
        case HeaderEventType.SetSecondEvent:
        final second = (event as SetSecondEvent).second;
        _dateTimeUTC = _dateTimeUTC.setSecond(second);
        break;
    }
    Log.T('after:  $_dateTimeUTC');
    yield AdjustedDateTime(_dateTimeUTC.toLocal());
  }
}
