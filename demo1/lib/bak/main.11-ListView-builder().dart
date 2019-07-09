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
          title: Text('ListView Widget'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  
  // item build 方法
  Widget _buildListItem(BuildContext context, int index) {
    Map newsItem = newsList.news[index];
    return ListItem(
      title: newsItem['title'],
      subTitle: newsItem['time'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newsList.news.length,
        itemBuilder: this._buildListItem); // 接收的两个参数
  }
}

class ListItem extends StatelessWidget {
  ListItem({this.title, this.subTitle, this.cover});

  final String title;
  final String subTitle;
  final String cover;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(Icons.chevron_right),
      title: Text(this.title),
      subtitle: Text(this.subTitle),
    );
  }
}
