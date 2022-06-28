import 'package:flutter_test/flutter_test.dart';
import 'package:image_tile/image_tile.dart';
import 'package:image_tile/image_tile_platform_interface.dart';
import 'package:image_tile/image_tile_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockImageTilePlatform 
    with MockPlatformInterfaceMixin
    implements ImageTilePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ImageTilePlatform initialPlatform = ImageTilePlatform.instance;

  test('$MethodChannelImageTile is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelImageTile>());
  });

  test('getPlatformVersion', () async {
    ImageTile imageTilePlugin = ImageTile();
    MockImageTilePlatform fakePlatform = MockImageTilePlatform();
    ImageTilePlatform.instance = fakePlatform;
  
    expect(await imageTilePlugin.getPlatformVersion(), '42');
  });
}
