import 'dart:io';
export 'package:weather/src/globals/enums.dart';
export 'package:weather/src/globals/widgets.dart';
const String ENGLISH = 'en';

class Globals {
  static String _language;
  static String title;
  static bool isIOS = Platform.isIOS;

  static Map<String, dynamic> localization;

  static Future<void> initGlobal() async {
    // set core lang to ENGLISH
    title = 'Weather App';
    _language = ENGLISH;
//    localization = await getLangData();
  }

// LOCALIZATION
// static Future<Map<String, dynamic>> getLangData() async {
//   String data = await rootBundle.loadString('assets/json/$_language/core.json');
//   return json.decode(data);
// }
}
