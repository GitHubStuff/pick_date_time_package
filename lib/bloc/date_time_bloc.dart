import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'date_time_event.dart';
part 'date_time_state.dart';

class DateTimeBloc extends Bloc<DateTimeEvent, DateTimeState> {
  DateTimeBloc() : super(DateTimeInitial());

  @override
  Stream<DateTimeState> mapEventToState(
    DateTimeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
