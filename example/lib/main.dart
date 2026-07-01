import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:better_open_file/better_open_file.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _openResult = 'Unknown';

  Future<void> openFile() async {
    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/better_open_file_example.txt');
    await tempFile.writeAsString(
      'Hello, this is a test file opened by the better_open_file plugin!',
    );
    final result = await OpenFile.open(tempFile.path);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('open result: $_openResult\n'),
              TextButton(onPressed: openFile, child: Text('Tap to open file')),
            ],
          ),
        ),
      ),
    );
  }
}
