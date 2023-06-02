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

  static String toUnixDateTime(String dateString) {
    List<String> dateTimeParts = dateString.split(' ');

    List<String> dateParts = dateTimeParts[0].split('/');
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    List<String> timeParts = dateTimeParts[1].split(':');
    int hour = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);

    DateTime date = DateTime(year, month, day, hour, minutes);

    print(date);

    int unixTimestamp = date.millisecondsSinceEpoch ~/ 1000;
    
    print(unixTimestamp);

    return unixTimestamp.toString();
  }

  static String fromUnix(String dateString) {
  DateFormat inputDateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  DateTime dateTime = inputDateFormat.parse(dateString);
  Duration offset = const Duration(hours: 7); // GMT+7 offset
  DateTime adjustedDateTime = dateTime.add(offset);
  DateFormat outputDateFormat = DateFormat('dd/MM/yyyy HH:mm');
  String dateTimeString = outputDateFormat.format(adjustedDateTime);
  return dateTimeString;
  }
}
