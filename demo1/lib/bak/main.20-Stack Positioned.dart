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
          title: Text('Stack Positioned Widget'),
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
            Positioned(
                child: Icon(Icons.home, size: 40, color: Colors.white),
                left: 0,
                top: 0),
            Positioned(
                child: Icon(Icons.search, size: 40, color: Colors.pink),
                left: 0.4),
            Positioned(
                child: Icon(Icons.settings, size: 40, color: Colors.blue),
                bottom: 1),
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
