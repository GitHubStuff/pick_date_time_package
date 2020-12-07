part of 'active_segment_bloc.dart';

class ActiveSegmentInitial extends ActiveSegmentState {
  const ActiveSegmentInitial() : super(ActiveSegmentBuilderState.ActiveSegmentInitial);
}

class ActiveSegmentSelection extends ActiveSegmentState {
  final PickerSegment pickerSegment;
  const ActiveSegmentSelection(this.pickerSegment) : super(ActiveSegmentBuilderState.ActiveSegmentSelection);
  @override
  List<Object> get props => [pickerSegment, activeSegmentBuilderState];
}
