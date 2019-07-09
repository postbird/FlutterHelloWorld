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
          title: Text('CheckBox 组件'),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                activeColor: Colors.pink,
                checkColor: Colors.blue,
                value: this._flag,
                onChanged: (value) {
                  setState(() {
                    this._flag = value;
                  });
                },
              ),
              Container(
                child: Text(this._flag ? '选中' : '未选中'),
              ),
            ],
          ),
          SizedBox(height: 10),
          CheckboxListTile(
            title: Text('标题'),
            subtitle: Text('二级标题'),
            activeColor: Colors.pink,
            secondary: Image.network(
              IMAGE_SRC,
              fit: BoxFit.cover,
              // color: Colors.grey[200],
              width: 60,
            ),
            value: this._flag,
            onChanged: (value) {
              setState(() {
                this._flag = value;
              });
            },
          ),
          Divider(),
          CheckboxListTile(
            title: Text('标题'),
            subtitle: Text('二级标题'),
            activeColor: Colors.pink,
            secondary: Icon(Icons.panorama),
            selected: this._flag,
            value: this._flag,
            onChanged: (value) {
              setState(() {
                this._flag = value;
              });
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
