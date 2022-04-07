import 'package:ntp/ntp.dart';

class TimeService {
  final pool = 'time.google.com';

  Future<DateTime> getCurrentTime() async {
    return NTP.now(lookUpAddress: pool);
  }

}
