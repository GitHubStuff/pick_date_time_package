part of 'header_bloc.dart';

class SetMeridianEvent extends HeaderEvent {
  final Meridian meridian;
  const SetMeridianEvent(this.meridian) : super(HeaderEventType.SetMeridianEvent);
  @override
  List<Object> get props => [meridian, headerEventType];
}

class SetMinuteEvent extends HeaderEvent {
  final int minute;
  const SetMinuteEvent(this.minute) : super(HeaderEventType.SetMinuteEvent);
  @override
  List<Object> get props => [minute, headerEventType];
}

class SetSecondEvent extends HeaderEvent {
  final int second;
  const SetSecondEvent(this.second) : super(HeaderEventType.SetSecondEvent);
  @override
  List<Object> get props => [second, headerEventType];
}
