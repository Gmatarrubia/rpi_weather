import 'package:ntp/ntp.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TimeService {
  final pool = 'time.google.com';

  Future<DateTime> _getCurrentTime() async {
    return await NTP.now(lookUpAddress: pool);
  }

  Future<String> getCurrentDate() async {
    DateTime now = await _getCurrentTime();
    return await initializeDateFormatting('es-ES', '')
        .then((_) => DateFormat.yMMMMEEEEd('es-ES').format(now));
  }

  Future<String> getCurrentHour() async {
    DateTime now = await _getCurrentTime();
    return await initializeDateFormatting('es-ES', '')
        .then((_) => DateFormat.Hm('es-ES').format(now));
  }
}
