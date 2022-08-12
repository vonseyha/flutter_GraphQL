import 'package:intl/intl.dart';

class DateConvert{
  static String convertTimeStamp({int? dateTime}){
    var date = DateTime.fromMillisecondsSinceEpoch(dateTime!);
    var formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }
}