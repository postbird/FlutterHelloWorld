import 'package:flutter/material.dart';

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'https://cdn.pixabay.com/photo/2019/05/20/13/22/portugal-4216645_1280.jpg';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Widget'),
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
        child: ListViewDemo(),
        height: 500,
      ),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        ListItem(),
        ListItem(),
        ListViewVertival(),
        ListItem(),
        ListItem(),
        ListItem(),
        ListItem(),
      ],
      padding: EdgeInsets.all(12),
    );
  }
}

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      margin: EdgeInsets.all(10),
      height: 100,
      width: 100,
    );
  }
}

class ListViewVertival extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
        ],
      ),
      width: 100,
      height: 500,
    );
  }
}
