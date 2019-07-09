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
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由'),
          backgroundColor: Colors.pink,
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
            child: Row(
              children: <Widget>[Icon(Icons.search), Text('搜索')],
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            color: Theme.of(context).buttonColor,
          ),
          FlatButton(
            child: Row(
              children: <Widget>[Icon(Icons.person), Text('登录 传值')],
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginPage(
                    title: 'NewName',
                    id: 2,
                  ),
                ),
              );
            },
            color: Theme.of(context).buttonColor,
          )
        ],
      ),
    );
  }
}

// 搜索页面
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
    );
  }
}

// 登录
class LoginPage extends StatelessWidget {
  final String title;
  final int id;
  const LoginPage({Key key, this.title = '表单', this.id}) : super(key: key);

  Text _getTitle() {
    return Text(id != null ? '${this.title} - ID:${this.id}' : this.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this._getTitle(),
      ),
    );
  }
}
