
import 'app_localizations.dart';

class StringsLocation{

  static  StringsLocation _singleton =  StringsLocation._internal();

  static AppLocalizations _myLocalizations;

  static void configure(AppLocalizations location) {
    _myLocalizations = location;
  }

  factory StringsLocation() {
    return _singleton;
  }

  StringsLocation._internal();

  String getString(String key){
    //return _myLocalizations.trans(key);
    return _myLocalizations.translate(key);
  }

}

String translate(String key){
  String trans = StringsLocation().getString(key);
  if(trans !=null){
    return trans;
  }
  return key;
}