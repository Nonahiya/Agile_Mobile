part of 'shared.dart';

class Helper {
  static String toUnix(String dateString) {
    List<String> dateParts = dateString.split('/');

    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    DateTime date = DateTime(year, month, day);

    int unixTimestamp = date.millisecondsSinceEpoch;

    return unixTimestamp.toString();
  }
}