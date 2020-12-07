import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_segment_event.dart';
part 'active_segment_state.dart';
part 'active_segment_states.dart';

class ActiveSegmentBloc extends Bloc<ActiveSegmentEvent, ActiveSegmentState> {
  ActiveSegmentBloc() : super(ActiveSegmentInitial());

  @override
  Stream<ActiveSegmentState> mapEventToState(ActiveSegmentEvent event) async* {
    switch (event.eventType) {
      case ActiveSegmentEventType.SelectPicker:
        final picker = (event as SelectPicker).pickerSegment;
        yield ActiveSegmentSelection(picker);
    }
  }
}
