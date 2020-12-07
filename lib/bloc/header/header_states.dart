part of 'header_bloc.dart';

class HeaderInitial extends HeaderState {
  final DateTime initialDateTime;
  const HeaderInitial(this.initialDateTime) : super(HeaderBuildState.HeaderInitial);
  @override
  List<Object> get props => [headerBuildState, initialDateTime];
}

class AdjustedDateTime extends HeaderState {
  final DateTime adjustedDateTime;
  const AdjustedDateTime(this.adjustedDateTime) : super(HeaderBuildState.AdjustedDateTime);
  @override
  List<Object> get props => [headerBuildState, adjustedDateTime];
}

