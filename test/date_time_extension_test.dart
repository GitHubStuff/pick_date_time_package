import 'package:flutter_test/flutter_test.dart';
import 'package:pick_date_time_package/date_time_extension/date_time_extension.dart';


void main() {
  group('Time Tests', () {
    test('Change from midnight to noon', () {
      DateTime source = DateTime(2020, DateTime.december, 31, 0, 11, 12);
      DateTime result = source.setMeridian(Meridian.PM);
      expect(result.hour, 12);
    });
    test('Change from noon to midnight', () {
      DateTime source = DateTime(2020, DateTime.december, 31, 12, 11, 12);
      DateTime result = source.setMeridian(Meridian.AM);
      expect(result.hour, 0);
    });

    test('Change from 1:00am to 1:00pm(13:00)', () {
      DateTime source = DateTime(2020, DateTime.december, 31, 1, 11, 12);
      DateTime result = source.setMeridian(Meridian.PM);
      expect(result.hour, 13);
    });
    test('Change from 1:00pm(13:00) to 1:00am(01:00)', () {
      DateTime source = DateTime(2020, DateTime.december, 31, 13, 11, 12);
      DateTime result = source.setMeridian(Meridian.AM);
      expect(result.hour, 1);
    });
  });
  test('Long month to short month', () {
    DateTime source = DateTime(2020, DateTime.december, 31, 10, 11, 12);
    DateTime result = source.setMonth(DateTime.november);
    expect(result.day, 30);
  });

  group('Leap year tests', () {
    test('Move from leap year to non-leap year', () {
      DateTime source = DateTime(2020, DateTime.february, 29, 10, 11, 12);
      DateTime result = source.setYear(2021);
      expect(result.day, 28);
    });

    test('Long month to febuary in a leap year', () {
      DateTime source = DateTime(2020, DateTime.december, 31, 10, 11, 12);
      DateTime result = source.setMonth(DateTime.february);
      expect(result.day, 29);
    });

    test('Long month to febuary in a non-leap year', () {
      DateTime source = DateTime(2021, DateTime.december, 31, 10, 11, 12);
      DateTime result = source.setMonth(DateTime.february);
      expect(result.day, 28);
    });
  });
}
