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
          title: Text('Row Widget'),
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
    return Column(
      children: <Widget>[ColumnDemo()],
    );
  }
}

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[350],
          height: 150,
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ImageContainer(imgSrc: IMAGE_SRC, height: 150),
            ),
            SizedBox(width: 5),
            Expanded(
                child: Column(
                  children: <Widget>[
                    ImageContainer(imgSrc: IMAGE_SRC, height: 72.5),
                    SizedBox(height: 5),
                    ImageContainer(imgSrc: IMAGE_SRC, height: 72.5)
                  ],
                )),
          ],
        )
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  final double height;
  final String imgSrc;
  ImageContainer({@required this.imgSrc, this.height = 100});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(this.imgSrc, fit: BoxFit.cover),
      height: this.height,
      color: Colors.grey[350],
    );
  }
}
