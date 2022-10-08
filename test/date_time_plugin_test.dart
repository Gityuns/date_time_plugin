import 'package:flutter_test/flutter_test.dart';
import 'package:date_time_plugin/date_time_plugin.dart';
import 'package:date_time_plugin/date_time_plugin_platform_interface.dart';
import 'package:date_time_plugin/date_time_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDateTimePluginPlatform
    with MockPlatformInterfaceMixin
    implements DateTimePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DateTimePluginPlatform initialPlatform = DateTimePluginPlatform.instance;

  test('$MethodChannelDateTimePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDateTimePlugin>());
  });

  test('getPlatformVersion', () async {
    DateTimePlugin dateTimePlugin = DateTimePlugin();
    MockDateTimePluginPlatform fakePlatform = MockDateTimePluginPlatform();
    DateTimePluginPlatform.instance = fakePlatform;

    expect(await dateTimePlugin.getPlatformVersion(), '42');
  });
}
