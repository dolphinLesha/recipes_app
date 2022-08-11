import '../classes/date_time_converter.dart';

extension DateTimeX on DateTime {
  String toStringX({String delimiter = '.', bool shortYear = true}) {
    return DateTimeConverter.convertDate2String(this,
        delimiter: delimiter, shortYear: shortYear);
  }

  bool equalWithNoTime(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool lWithNoTime(DateTime other, [bool eq = false]) {
    if (year < other.year) {
      return true;
    } else if (year == other.year) {
      if (month < other.month) {
        return true;
      } else if (month == other.month) {
        if (day < other.day) {
          return true;
        } else if (day == other.day && eq) {
          return true;
        }
        return false;
      }
      return false;
    }
    return false;
  }

  bool bWithNoTime(DateTime other, [bool eq = false]) {
    if (year > other.year) {
      return true;
    } else if (year == other.year) {
      if (month > other.month) {
        return true;
      } else if (month == other.month) {
        if (day > other.day) {
          return true;
        } else if (day == other.day && eq) {
          return true;
        }
        return false;
      }
      return false;
    }
    return false;
  }
}
