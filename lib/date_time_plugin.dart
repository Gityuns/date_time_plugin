
import 'date_time_plugin_platform_interface.dart';

class DateTimePlugin {

  Future<String?> stringFromDateTime(String formatter,DateTime dateTime){
    return DateTimePluginPlatform.instance.stringFromDateTime(formatter,dateTime);
  }

  Future<String?> stringFromNow(String formatter){
    return DateTimePluginPlatform.instance.stringFromNow(formatter);
  }
}
