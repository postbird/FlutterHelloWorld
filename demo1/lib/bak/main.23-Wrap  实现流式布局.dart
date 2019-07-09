import 'package:flutter/material.dart';
import 'mock/list.dart' as newsList;

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
          title: Text('Wrap RaisedButton Widget'),
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
    return Padding(
      child: Wrap(
        children: <Widget>[
          ButtonItem(text: '盗墓笔记'),
          ButtonItem(text: '鬼吹灯'),
          ButtonItem(text: '这个书名是凑的'),
          ButtonItem(text: '藏海花'),
          ButtonItem(text: '沙海'),
          ButtonItem(text: '鬼吹灯'),
          ButtonItem(text: '这个书名是凑的'),
          ButtonItem(text: '沙海'),
          ButtonItem(text: '鬼吹灯'),
          ButtonItem(text: '这个书名是凑的'),
          ButtonItem(text: '藏海花'),
          ButtonItem(text: '沙海'),
          ButtonItem(text: '藏海花'),
          ButtonItem(text: '沙海'),
        ],
        spacing: 12,
        runSpacing: 13,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.end,
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
  }
}

class ButtonItem extends StatelessWidget {
  ButtonItem({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      color: Theme.of(context).buttonColor,
      onPressed: () {},
    );
  }
}
