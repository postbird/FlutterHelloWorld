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
          title: Text('TabController'),
          backgroundColor: Colors.pink,
        ),
        body: TabControllerDemo(),
      ),
    );
  }
}

class TabControllerDemo extends StatefulWidget {
  TabControllerDemo({Key key}) : super(key: key);

  _TabControllerDemoState createState() => _TabControllerDemoState();
}

class _TabControllerDemoState extends State<TabControllerDemo>  with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    this._tabController = new TabController(vsync: this, length: 5);
    this._tabController.addListener(() {
      print(this._tabController.toString());
      print(this._tabController.index);
      print(this._tabController.length);
      print(this._tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TabBar(
            controller: this._tabController,
            tabs: <Widget>[
              Tab(text: '女装'),
              Tab(text: '男装'),
              Tab(text: '童装'),
              Tab(text: '夏装'),
              Tab(text: '冬装'),
            ],
          ),
        ),
        body: TabBarView(
          controller: this._tabController,
          children: <Widget>[
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
            ListViewContnet(),
          ],
        ));
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
