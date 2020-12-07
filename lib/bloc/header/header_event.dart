part of 'header_bloc.dart';

enum HeaderEventType {
  SetMeridianEvent,
  SetMinuteEvent,
  SetSecondEvent,
  SetHourEvent,
}

abstract class HeaderEvent extends Equatable {
  final HeaderEventType headerEventType;
  const HeaderEvent(this.headerEventType);

  @override
  List<Object> get props => [headerEventType];
}
