part of 'header_bloc.dart';

enum HeaderBuildState {
  AdjustedDateTime,
  HeaderInitial,
}

abstract class HeaderState extends Equatable {
  final HeaderBuildState headerBuildState;
  const HeaderState(this.headerBuildState);

  @override
  List<Object> get props => [headerBuildState];
}
