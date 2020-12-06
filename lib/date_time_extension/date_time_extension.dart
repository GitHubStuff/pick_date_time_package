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
  DateTime setMinute(int minute) => this._adjust(minute: minute);
  DateTime setSecond(int second) => this._adjust(second: second);

  // ignore: missing_return
  DateTime setMeridian(Meridian meridian) {
    final hour = this.hour;
    switch (meridian) {
      case Meridian.AM:
        return (hour >= 12) ? this.setHour(hour - 12) : this;
      case Meridian.PM:
        return (hour >= 12) ? this : this.setHour(hour + 12);
    }
  }
}
