part of 'active_segment_bloc.dart';

enum ActiveSegmentEventType {
  SelectPicker,
}

abstract class ActiveSegmentEvent extends Equatable {
  final ActiveSegmentEventType eventType;
  const ActiveSegmentEvent(this.eventType);

  @override
  List<Object> get props => [eventType];
}

class SelectPicker extends ActiveSegmentEvent {
  final PickerSegment pickerSegment;
  const SelectPicker(this.pickerSegment) : super(ActiveSegmentEventType.SelectPicker);
  @override
  List<Object> get props => [pickerSegment, eventType];
}
