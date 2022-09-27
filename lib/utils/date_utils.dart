import 'package:intl/intl.dart';

class AppDateUtils {


  static String extractDateFromDateTime(DateTime date) => DateFormat('dMy').format(date);

  static String extractTimeFromDateTime(DateTime date) => DateFormat.Hm().format(date);

}
