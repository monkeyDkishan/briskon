part of utils;

extension DateExtForDate on DateTime {

  String get formattedStr => DateUtility.shared.dateToFormattedString(date: this);

}

extension DateExtForString on String {

  String get formattedStr => DateUtility.shared.stringToFormattedString(dateStr: this);

}
