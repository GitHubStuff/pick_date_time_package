import 'package:theme_package/theme_package.dart';

import 'date_time_extension.dart';

class PickerDateTime {
  DateTime _dateTime;
  DateTime get dateTime => _dateTime;
  PickerDateTime([DateTime initialDateTime]) {
    final y = DateTime.now();
    final z = y.toUtc();
    final g = z.trimmedTime;
    _dateTime = (initialDateTime?.toUtc() ?? DateTime.now().toUtc()).trimmedTime;
    Log.D('$_dateTime');
  }
}
