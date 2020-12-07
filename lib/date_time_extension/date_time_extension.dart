import 'package:intl/intl.dart';

enum Meridian {
  AM,
  PM,
}

extension DateTimeAdjustment on DateTime {
  DateTime _adjust({int year, int month, int day, int hour, int minute, int second}) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      0,
      0,
    );
  }

  String get calendarText => DateFormat('EEE, MMM d, yyyy').format(this.toLocal());

  String get clockText => DateFormat('h:mm:ss a').format(this.toLocal());

  int get dayCount =>
      (month == DateTime.february && isLeapYear) ? 29 : [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];

  bool get isLeapYear => (this.year % 4 == 0) && ((this.year % 100 != 0) || (this.year % 400 == 0));

  Meridian get meridian => (this.hour < 12) ? Meridian.AM : Meridian.PM;

  DateTime setYear(int year) {
    DateTime result = this._adjust(year: year);
    if (result.day != this.day) {
      return this._adjust(year: year, day: 28);
    }
    return result;
  }

  DateTime setMonth(int month) {
    DateTime result = this._adjust(month: month);
    int longMonthTrim = 1;
    while (result.month != month) {
      result = this._adjust(month: month, day: this.day - longMonthTrim++);
    }
    return result;
  }

  DateTime setDay(int day) => this._adjust(day: day);
  DateTime setHour(int hour) => this._adjust(hour: hour);
  DateTime setMinute(int minute) => this._adjust(minute: minute).trimmedUTCTime;
  DateTime setSecond(int second) => this._adjust(second: second).trimmedUTCTime;

  // ignore: missing_return
  DateTime setMeridian(Meridian meridian) {
    final hour = this.hour;
    switch (meridian) {
      case Meridian.AM:
        return (hour >= 12) ? this.setHour(hour - 12).trimmedUTCTime : this;
      case Meridian.PM:
        return (hour >= 12) ? this : this.setHour(hour + 12).trimmedUTCTime;
    }
  }

  DateTime get trimmedUTCTime => DateTime.utc(
        this.year,
        this.month,
        this.day,
        this.hour,
        this.minute,
        this.second,
        0,
        0,
      );
}
