import 'package:intl/intl.dart';

extension DateParseToGmt on String {
  String toGMT() {
    String formatted = DateFormat('EEE, dd MMM yyyy HH:mm').format(DateTime.parse(this));

    formatted = '$formatted GMT';
    return formatted;
  }
}
