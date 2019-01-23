import 'package:intl/intl.dart';

class DateTimeUtils {

  static final formatter = new DateFormat('LLL dd, HH:mm');

  // Example: Mon Jan 21 01:39:34 +0000 2019
  // Weekday Month Day Hour:Minute:Second TimezoneCorrection Year
  static DateTime convertToDateTime(String dateString) {
    var dateArray = dateString.split(" ");

    var day = dateArray[2];
    var month =  dateArray[1];
    var year = dateArray[5];
    var time = dateArray[3];

    return DateTime.parse("$year-${_monthToNumber(month)}-$day $time");
  }

  static String _monthToNumber(String month) {
    switch (month) {
      case "Jan": return "01";
      case "Feb": return "02";
      case "Mar": return "03";
      case "Apr": return "04";
      case "May": return "05";
      case "Jun": return "06";
      case "Jul": return "07";
      case "Aug": return "08";
      case "Sep": return "09";
      case "Oct": return "10";
      case "Nov": return "11";
      case "Dec": return "12";
      default: return "01";
    }
  }

  static String formatDate(DateTime date) {
    return formatter.format(date);
  }

}