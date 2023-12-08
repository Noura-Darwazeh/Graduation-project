import 'package:get/get_navigation/get_navigation.dart';

class mylocale implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {"1": "انكليزي", "3": "عربي", "2": "مدن"},
        "en": {"1": "English", "3": "Arabic", "2": "Cities"},
      };
}
