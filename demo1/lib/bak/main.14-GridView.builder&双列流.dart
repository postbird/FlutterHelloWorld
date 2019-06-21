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

  // builder
  Widget _itemBuilderFunc(BuildContext context, int index) {
    final Map news = newsList.news[index];
    return GridViewItem(
      cover: news['imgurl'],
      title: news['title'],
      time: news['time'].toString(),
    );
  }

  // GridView.builder
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: newsList.news.length,
      itemBuilder: this._itemBuilderFunc,
      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GridView.count(
  //     children: _getGridList(),
  //     crossAxisCount: 3,
  //     padding: EdgeInsets.all(10),
  //     crossAxisSpacing: 10, // 水平距离
  //     mainAxisSpacing: 20, // 垂直距离
  //     childAspectRatio: 0.74, // 宽高比例
  //   );
  // }
}

class GridViewItem extends StatelessWidget {
  GridViewItem({this.cover, this.title, this.time});
  String cover;
  String title;
  String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GridViewTitleCover(this.cover),
          SizedBox(height: 10),
          GridViewItemTitle(title: this.title),
          GridViewItemTime(time: this.time)
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Colors.grey[200]),
    );
  }
}

class GridViewTitleCover extends StatelessWidget {
  GridViewTitleCover(this.cover);

  final String cover;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
          image: DecorationImage(
              image: NetworkImage(this.cover), fit: BoxFit.cover),
        ));
  }
}

class GridViewItemTitle extends StatelessWidget {
  GridViewItemTitle({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12),
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    );
  }
}

class GridViewItemTime extends StatelessWidget {
  GridViewItemTime({this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.time,
        maxLines: 1,
        style: TextStyle(fontSize: 10, color: Colors.black38),
      ),
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
    );
  }
}
