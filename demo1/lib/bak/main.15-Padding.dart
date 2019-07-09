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
          title: Text('Padding Widget'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  // 生成一个列表
  List<Widget> _getGridList() {
    return newsList.news.map((item) {
      return GridViewItem();
    }).toList();
  }

  // builder
  Widget _itemBuilderFunc(BuildContext context, int index) {
    final Map news = newsList.news[index];
    return GridViewItem();
  }

  // GridView.builder
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: newsList.news.length,
      itemBuilder: this._itemBuilderFunc,
      // padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
          childAspectRatio: 1.4),
    );
  }
}

class GridViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Image.network(
          IMAGE_SRC,
          fit: BoxFit.cover,
        ),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 0));
  }
}
