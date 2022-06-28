import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_tile/image_tile_method_channel.dart';

void main() {
  MethodChannelImageTile platform = MethodChannelImageTile();
  const MethodChannel channel = MethodChannel('image_tile');

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
