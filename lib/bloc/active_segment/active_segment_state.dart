part of 'active_segment_bloc.dart';

enum PickerSegment {
  date,
  time,
}

enum ActiveSegmentBuilderState {
  ActiveSegmentInitial,
  ActiveSegmentSelection,
}

abstract class ActiveSegmentState extends Equatable {
  final ActiveSegmentBuilderState activeSegmentBuilderState;
  const ActiveSegmentState(this.activeSegmentBuilderState);

  @override
  List<Object> get props => [activeSegmentBuilderState];
}
