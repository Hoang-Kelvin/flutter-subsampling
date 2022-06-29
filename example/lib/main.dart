import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_tile/image_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo ImageTile'),
        ),
        body: url.isNotEmpty
            ? ImageTile(fileUrl: url, callback: (_) {})
            : Container(
                color: Colors.blue,
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
              setState(() {
                url = value?.path ?? '';
              });
            });
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
