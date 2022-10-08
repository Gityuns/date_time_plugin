import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'date_time_plugin_platform_interface.dart';

/// An implementation of [DateTimePluginPlatform] that uses method channels.
class MethodChannelDateTimePlugin extends DateTimePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('date_time_plugin');

  Future<String?> stringFromDateTime(String formatter,DateTime dateTime) async{
    String time = dateTime.toIso8601String();
    time = time.substring(0,19);
    time = time.replaceRange(10, 11, " ");
    final stringValue = await methodChannel.invokeMethod('stringFromDateTime',{
      "formatter":formatter,
      "dateTime":time
    });
    return stringValue;
  }

  Future<String?> stringFromNow(String formatter) async{
    final stringValue = await methodChannel.invokeMethod('stringFromNow',formatter);
    return stringValue;
  }

}
