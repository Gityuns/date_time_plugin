import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:date_time_plugin/date_time_plugin_method_channel.dart';

void main() {
  MethodChannelDateTimePlugin platform = MethodChannelDateTimePlugin();
  const MethodChannel channel = MethodChannel('date_time_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
