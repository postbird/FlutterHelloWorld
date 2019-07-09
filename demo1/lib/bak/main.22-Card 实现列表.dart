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
          title: Text('Card Widget'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  Widget buildItem(BuildContext context, int index) {
    Map news = newsList.news[index];
    return CardItem2(
      title: news['title'],
      subTitle: news['docurl'],
      cover: news['imgurl'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.news.length,
      itemBuilder: buildItem,
    );
    // return ListView(
    //   children: <Widget>[
    //     CardItem(),
    //     CardItem2(),
    //     CardItem2(),
    //   ],
    //   padding: EdgeInsets.only(top: 20),
    // );
  }
}

class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(TITLE),
            subtitle: Text(SUB_TITLE),
          ),
          ListTile(
            title: Text('地址：上海市'),
          ),
          ListTile(
            title: Text('电话：12345678901'),
          )
        ],
      ),
    );
  }
}

class CardItem2 extends StatelessWidget {
  CardItem2({
    this.title,
    this.subTitle,
    this.cover,
  });
  final String title;
  final String subTitle;
  final String cover;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          AspectRatio(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(this.cover),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ),
            aspectRatio: 16 / 9,
          ),
          ListTile(
            title:
                Text(this.title, maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text(this.subTitle,
                maxLines: 1, overflow: TextOverflow.ellipsis),
            leading: ClipOval(
              child: CircleAvatar(backgroundImage: NetworkImage(this.cover)),
            ),
          )
        ],
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
