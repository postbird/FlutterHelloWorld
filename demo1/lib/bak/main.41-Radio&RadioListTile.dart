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
          title: Text('Radio 组件'),
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
  int _sex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                activeColor: Colors.pink,
                groupValue: this._sex,
                onChanged: (value) {
                  setState(() {
                    this._sex = value;
                  });
                },
              ),
              Text('男'),
              Radio(
                value: 2,
                activeColor: Colors.pink,
                groupValue: this._sex,
                onChanged: (value) {
                  setState(() {
                    this._sex = value;
                  });
                },
              ),
              Text('女'),
            ],
          ),
          Row(
            children: <Widget>[
              Text('选择的值是：${this._sex} : ${this._sex == 1 ? '男' : '女'}'),
            ],
          ),
          Divider(height: 1),
          RadioListTile(
            activeColor: Colors.pink,
            title: Text('标题'),
            subtitle: Text('二级标题'),
            secondary: Icon(Icons.person),
            selected: this._sex == 1,
            value: 1,
            groupValue: this._sex,
            onChanged: (value) {
              setState(() {
                this._sex = value;
              });
            },
          ),
          Divider(height: 1),
          RadioListTile(
            activeColor: Colors.pink,
            title: Text('标题'),
            subtitle: Text('二级标题'),
            secondary: Image.network(IMAGE_SRC, fit: BoxFit.cover),
            selected: this._sex == 2,
            value: 2,
            groupValue: this._sex,
            onChanged: (value) {
              setState(() {
                this._sex = value;
              });
            },
          ),
          Divider(height: 1),
        ],
      ),
    );
  }
}
