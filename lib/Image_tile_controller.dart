import 'package:flutter/services.dart';

typedef ImageTileCreatedCallback = void Function(ImageTileController imageTileController);

class ImageTileController {
  MethodChannel channel;

  ImageTileController(this.channel);

  Future<void> loadImage(String imageUrl) async {
    return channel.invokeMethod('loadUrl', imageUrl);
  }
}
