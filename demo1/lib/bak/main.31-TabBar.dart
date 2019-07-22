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
        body: DefaultTabController(
          length: 9,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.pink,
                child: TabBar(
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.white,
                  indicatorWeight: 1,
                  isScrollable: true,
                  // labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  labelStyle: TextStyle(fontSize: 14),
                  tabs: <Widget>[
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab1'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: <Widget>[
                    ListViewContnet(),
                    ListViewContnet(),
                    ListViewContnet(),
                    ListViewContnet(),
                    ListViewContnet(),
                    ListViewContnet(),
                    ListViewContnet(),
                    ListViewContnet(),
                    ListViewContnet(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewContnet extends StatelessWidget {
  const ListViewContnet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
        ListTile(title: Text(TITLE)),
      ],
    );
  }
}
