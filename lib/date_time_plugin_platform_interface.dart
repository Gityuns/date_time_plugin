import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'date_time_plugin_method_channel.dart';

abstract class DateTimePluginPlatform extends PlatformInterface {
  /// Constructs a DateTimePluginPlatform.
  DateTimePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static DateTimePluginPlatform _instance = MethodChannelDateTimePlugin();

  /// The default instance of [DateTimePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelDateTimePlugin].
  static DateTimePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DateTimePluginPlatform] when
  /// they register themselves.
  static set instance(DateTimePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> stringFromDateTime(String formatter,DateTime dateTime){
    throw UnimplementedError('stringFromDateTime(formatter: dateTime:) has not been implemented.');
  }

  Future<String?> stringFromNow(String formatter){
    throw UnimplementedError('stringFromNow() has not been implemented.');
  }
}
