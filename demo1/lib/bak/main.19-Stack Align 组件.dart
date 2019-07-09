import 'package:flutter/material.dart';

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'http://cms-bucket.ws.126.net/2019/06/20/68fa7f186ffe4479ab27efabd4d94246.png';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack Align Widget'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: <Widget>[
            Align(
                child: Icon(Icons.home, size: 40, color: Colors.white),
                alignment: Alignment.topCenter),
            Align(
                child: Icon(Icons.search, size: 40, color: Colors.pink),
                alignment: Alignment.bottomLeft),
            Icon(Icons.settings, size: 40, color: Colors.blue),
          ],
          alignment: Alignment.center,
        ),
        height: 400,
        width: 300,
        color: Colors.yellow,
      ),
    );
  }
}
