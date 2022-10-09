import 'package:intl/intl.dart';

import '../config.dart';

class DateUtility {

  DateFormat _formatter = DateFormat(kCommonDateTimeFormat);

  static DateUtility shared = DateUtility();

  String dateToFormattedString({required DateTime date, String? format = kCommonDateTimeFormat}) {

    _formatter = DateFormat(format);

    return _formatter.format(date);
  }

  String stringToFormattedString({required String dateStr, String? format = kCommonDateTimeFormat}) {

    final date = DateTime.parse(dateStr);

    _formatter = DateFormat(format);

    return _formatter.format(date);
  }

}