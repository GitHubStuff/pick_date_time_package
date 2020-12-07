import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'header_event.dart';
part 'header_state.dart';
part 'header_states.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  DateTime _dateTime;
  HeaderBloc(DateTime dateTime)
      : _dateTime = dateTime,
        super(HeaderInitial(dateTime));

  @override
  Stream<HeaderState> mapEventToState(
    HeaderEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
