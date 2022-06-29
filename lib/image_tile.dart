import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_tile/Image_tile_controller.dart';

class ImageTile extends StatelessWidget {
  final ImageTileCreatedCallback callback;

  const ImageTile({Key? key, required this.callback, required this.fileUrl}) : super(key: key);
  final String fileUrl;

  @override
  Widget build(BuildContext context) {
    const String viewType = 'ImageTileView';
    final Map<String, dynamic> creationParams = <String, dynamic>{'image': fileUrl};
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: viewType,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return Container();
    }
  }

  Future<void> onPlatformViewCreated(id) async {
    callback(ImageTileController(MethodChannel('imageTile_id$id')));
  }
}
