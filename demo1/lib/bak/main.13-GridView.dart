import 'package:flutter/material.dart';
import 'mock/list.dart' as newsList;

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
          title: Text('GridView Widget'),
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

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      children: _getGridList(),
      crossAxisCount: 3,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20, // 水平距离
      mainAxisSpacing: 20, // 垂直距离
      childAspectRatio: 1.3, // 宽高比例
    );
  }
}

class GridViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('文本'),
      color: Colors.pink[200],
    );
  }
}
