import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

const IMAGE_SRC =
    'http://imglf3.nosdn.127.net/img/Mm9KQTVTN2NLSmxOdXp0Q3pRMTYycm1IakVPcERLOTNPVjRTcEJrZ2M5ZUpuMk1WMXJGNEhBPT0.jpg';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('文件读写 Demo'),
          ),
          body: FileIODemo()),
    );
  }
}

class FileIODemo extends StatefulWidget {
  FileIODemo({Key key}) : super(key: key);

  _FileIODemoState createState() => _FileIODemoState();
}

class _FileIODemoState extends State<FileIODemo> {
  int _counter = 0;
  File _file;

  _FileIODemoState() {
    _initFile();
  }
  @override
  void initState() {
    super.initState();
    _initCounter();
  }

  _initCounter() async {
    final File file = await _localFile;
    final String res = await file.readAsString();
    setState(() {
      _counter = int.parse(res ?? 0);
    });
  }

  _initFile() async {
    _file = await _localFile;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    if (_file is File) {
      return _file;
    } else {
      final String path = await _localPath;
      _file = File('$path/counter.txt');
      return _file;
    }
  }

  _saveCounter() async {
    final File file = await _localFile;
    file.writeAsString(_counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_counter.toString()),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text('-'),
              onPressed: () {
                setState(() {
                  _counter -= 1;
                  _saveCounter();
                });
              },
            ),
            RaisedButton(
              child: Text('+'),
              onPressed: () {
                setState(() {
                  _counter += 1;
                  _saveCounter();
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
