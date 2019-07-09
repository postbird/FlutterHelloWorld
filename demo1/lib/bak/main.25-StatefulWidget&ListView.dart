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
          title: Text('StatefulWidget'),
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
    return NewsList();
  }
}

class NewsList extends StatefulWidget {
  NewsList({Key key}) : super(key: key);

  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<Map> _newsList = [
    {
      'title': TITLE,
      'subTitle': SUB_TITLE,
      'cover': IMAGE_SRC,
    }
  ];

  List<Widget> _buildNewsList() {
    return this._newsList.map((item) {
      return NewsItem(
        title: item['title'],
        subTitle: item['subTitle'],
        cover: item['cover'],
      );
    }).toList();
  }

  _onPressedHandle() {
    setState(() {
      this._newsList.add({
        'title': TITLE,
        'subTitle': SUB_TITLE,
        'cover': IMAGE_SRC,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FlatButton(
          child: Text('add'),
          color: Theme.of(context).buttonColor,
          onPressed: this._onPressedHandle,
        ),
        SizedBox(height: 30),
        Column(
          children: this._buildNewsList(),
        )
      ],
    );
  }
}

class NewsItem extends StatelessWidget {
  NewsItem({Key key, this.title, this.subTitle, this.cover}) : super(key: key);

  final String title;
  final String subTitle;
  final String cover;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        this.cover,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
      title: Text(this.title),
      subtitle: Text(this.subTitle),
    );
  }
}
