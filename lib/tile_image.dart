import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TileImage extends StatelessWidget {
  const TileImage({Key key, this.fileUrl}) : super(key: key);
  final String fileUrl;

  @override
  Widget build(BuildContext context) {
    const String viewType = 'SubSampleImage';
    final Map<String, dynamic> creationParams = <String, dynamic>{'image': fileUrl};
    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
