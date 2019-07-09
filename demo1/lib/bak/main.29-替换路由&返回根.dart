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

  final Map<String, WidgetBuilder> _routes = {
    '/login': (context) => LoginPage(),
    '/sign': (context) => SignPage(),
    '/sign2': (context) => SignPage2(),
    '/sign3': (context) => SignPage3(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由替换 根路由'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
      routes: this._routes,
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

// 登录  routes 的形式
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('login'),
            SizedBox(height: 40),
            FlatButton(
              child: Text('back'),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                Navigator.of(context).pop(SizeTransition);
              },
            ),
            SizedBox(height: 40),
            FlatButton(
              child: Text('SignPage Replacement'),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/sign');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignPage-1')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('SignPage-1'),
            SizedBox(height: 40),
            FlatButton(
              child: Text('Next SignPage-2'),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                Navigator.of(context).pushNamed('/sign2');
              },
            )
          ],
        ),
      ),
    );
  }
}

class SignPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignPage-2')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('SignPage-2'),
            SizedBox(height: 40),
            FlatButton(
              child: Text('Next SignPage-3'),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                Navigator.of(context).pushNamed('/sign3');
              },
            )
          ],
        ),
      ),
    );
  }
}

class SignPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignPage-3')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('SignPage-3'),
            SizedBox(height: 40),
            FlatButton(
              child: Text('Return '),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                // 根
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => route == null);
              },
            )
          ],
        ),
      ),
    );
  }
}
