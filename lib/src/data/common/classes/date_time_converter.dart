import 'pair.dart';

class DateTimeConverter {
  static Pair<DateTime?, String?> convertString2Date(String? date,
      {DateTime? minDate, DateTime? maxDate, String delimiter = '.'}) {
    // date = date.toLocal();
    date = date ?? '';
    String? dateError;
    if (date == '') return Pair(null, dateError);
    List<String> pieces = date.split(delimiter);
    if (pieces.length < 3) return Pair(null, dateError);
    int? year = int.tryParse(pieces[2]);
    int? month = int.tryParse(pieces[1]);
    int? day = int.tryParse(pieces[0]);
    if (minDate != null && maxDate != null) {
      if (year == null || year < minDate.year || year > maxDate.year) {
        dateError = 'Неверная дата';
        return Pair(null, dateError);
      }
    }

    if (month == null || month < 0 || month > 12) {
      dateError = 'Неверная дата';
      return Pair(null, dateError);
    }
    if (day == null || day < 0 || day > 31) {
      dateError = 'Неверная дата';
      return Pair(null, dateError);
    }
    dateError = null;
    DateTime dateTime = DateTime(
        int.tryParse(pieces[2]) ?? DateTime.now().year,
        int.tryParse(pieces[1]) ?? DateTime.now().month,
        int.tryParse(pieces[0]) ?? DateTime.now().day);
    return Pair(dateTime, dateError);
  }

  static String convertDate2String(DateTime? date,
      {String delimiter = '.', bool shortYear = true, bool withYear = true}) {
    // date = date.toLocal();
    if (date == null) {
      return '';
    }
    return '${((int day) {
      if (day < 10) {
        return '0$day';
      } else {
        return day;
      }
    })(date.day)}$delimiter${((int month) {
      if (month < 10) {
        return '0$month';
      } else {
        return month;
      }
    })(date.month)}${withYear ? '$delimiter${((int year) {
        String yearStr = year.toString();
        if (yearStr.length > 2 && shortYear) {
          yearStr = yearStr.substring(
            2,
          );
        }
        return yearStr;
      })(date.year)}' : ''}';
  }

  static String convertDate2StringWithTime(DateTime? date,
      {String dateDelimiter = '.', String timeDelimiter = ':'}) {
    // date = date.toLocal();
    if (date == null) {
      return '';
    }
    return '${((int hours) {
      if (hours < 10) {
        return '0$hours';
      } else {
        return hours;
      }
    })(date.hour)}$timeDelimiter${((int minutes) {
      if (minutes < 10) {
        return '0$minutes';
      } else {
        return minutes;
      }
    })(date.minute)} ${((int day) {
      if (day < 10) {
        return '0$day';
      } else {
        return day;
      }
    })(date.day)}$dateDelimiter${((int month) {
      if (month < 10) {
        return '0$month';
      } else {
        return month;
      }
    })(date.month)}$dateDelimiter${((int year) {
      return year;
    })(date.year)}';
  }
}
