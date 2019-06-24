import 'package:flutter/material.dart';
// import 'mock/list.dart' as newsList;

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'http://imgcdn.ph.126.net/UQhSl0NAkp9wsn0keF-rLA==/3084402794814350820.jpg';
const IMAGE_SRC_2 =
    'http://imglf.nosdn.127.net/img/NVc1cHVseFhyWFcwdHhpdjJydFRvcWJSa0NNbGlRbGN2TXNOS3NwQVdET042YmpmemdjUm5RPT0.jpg';

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
          title: Text('Drawer'),
          backgroundColor: Colors.pink,
        ),
        body: Center(child: Text('Drawer')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              DrawerHeaderDemo(),
              ListItem(),
              Divider(),
              ListItem(),
              Divider(),
              ListItem(),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerHeaderDemo extends StatelessWidget {
  const DrawerHeaderDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text('postbird'),
      accountEmail: Text('没有任何描述~'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(IMAGE_SRC),
        backgroundColor: Colors.grey[350],
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(IMAGE_SRC),
          backgroundColor: Colors.grey[350],
        ),
      ],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(IMAGE_SRC_2),
          fit: BoxFit.cover,
        ),
        color: Colors.grey[350],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink,
            child: Icon(Icons.home),
          ),
          title: Text('首页'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserPage()));
          }),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户中心'),
      ),
    );
  }
}
