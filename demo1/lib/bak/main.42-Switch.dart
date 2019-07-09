import 'package:flutter/material.dart';
// import 'mock/list.dart' as newsList;

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'https://cdn.pixabay.com/photo/2019/06/17/07/47/madeira-4279303__240.jpg';
const IMAGE_SRC_2 =
    'https://cdn.pixabay.com/photo/2019/06/20/05/51/squirrel-4286247__480.jpg';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Switch 组件'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckBoxDemo();
  }
}

class CheckBoxDemo extends StatefulWidget {
  CheckBoxDemo({Key key}) : super(key: key);

  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Switch(
            activeColor: Colors.pink,
            value: this._flag,
            onChanged: (value) {
              setState(() {
                this._flag = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
