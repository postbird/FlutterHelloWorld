import 'package:flutter/material.dart';
// import 'mock/list.dart' as newsList;

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'http://cms-bucket.ws.126.net/2019/06/20/68fa7f186ffe4479ab27efabd4d94246.png';

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
          title: Text('自定义 AppBar'),
          centerTitle: true,
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              print('home app bar');
            },
          ),
          actions: <Widget>[
            Center(
              child: Text('所有订单'),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
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
    return Center(
      child: Column(
        children: <Widget>[
          FlatButton(
            color: Theme.of(context).buttonColor,
            child: Text('login'),
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
          FlatButton(
            color: Theme.of(context).buttonColor,
            child: Text('sign'),
            onPressed: () {
              Navigator.of(context).pushNamed('/sign');
            },
          )
        ],
      ),
    );
  }
}
