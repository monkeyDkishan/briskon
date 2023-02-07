part of utils;

extension AppNavigator on Navigator {

  static void popToFirst(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

extension StringValidator on String{

  bool get isTrimEmpty => this.trim().isEmpty;
  bool get isEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  bool get isMobile => RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(this);
  bool get isPassword => this.length < 8;

}

extension StringExtender on String{

  String get moneyFormatter => replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

}

extension DateTimeExt on DateTime {

  DateTime appendTimeForDateReminder(String time) {
    String aDateTimeStr = "${DateFormat("yyyy-MM-dd").format(this)} $time";

    return DateFormat("yyyy-MM-dd hh:mm").parse(aDateTimeStr);

  }

  String get toHealthSpaceDate {

    final f = DateFormat('dd-MM-yyyy');

    return f.format(this);
  }

  String get toHealthSpaceTime {

    final f = DateFormat('HH:mm');

    return f.format(this);
  }

  String get toHomeFormat {

    final f = DateFormat('E, dd MMM.');

    return f.format(this);
  }

  String get toDDMMYYYY {

    final f = DateFormat('dd/MM/yyyy');

    return f.format(this);
  }

  String get toDDMMMYYYY {

    final f = DateFormat('dd MMM, yyyy');

    return f.format(this);
  }

  String get toFileNameWithDateTime {

    final f = DateFormat('ddMMyyyyHHmmss');

    return f.format(this);
  }

  String get toFileNameWithDate {

    final f = DateFormat('ddMMyyyy');

    return f.format(this);
  }

  String get toDDMMYYYYHHmmss {

    final f = DateFormat('dd/MM/yyyy HH:mm:ss');

    return f.format(this);
  }

  int get calculateAge {
    final age = DateTime.now().difference(this);

    final zero = DateTime(0);

    final dateTime = zero.add(age);

    return dateTime.year;
  }

  String get toMMMYYYY {

    final f = DateFormat('MMM yyyy');

    return f.format(this);
  }

  String get toDDMM {

    final f = DateFormat('dd MMM');

    return f.format(this);
  }

  String get toE {

    final f = DateFormat('E');

    return f.format(this);
  }

}