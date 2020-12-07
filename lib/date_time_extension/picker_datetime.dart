import 'date_time_extension.dart';

class PickerDateTime {
  DateTime _dateTime;
  DateTime get dateTime => _dateTime;
  PickerDateTime([DateTime initialDateTime]) {
    _dateTime = (initialDateTime?.toUtc() ?? DateTime.now().toUtc()).trimmedUTCTime;
  }
}
