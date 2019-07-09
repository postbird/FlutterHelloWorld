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
    '/search': (context) => SearchPage(),
    '/login': (context) => LoginPage(),
    '/sign': (context, {arguments}) => SignPage(arguments: arguments),
  };

  Route _routeGenerator(RouteSettings settings) {
    final String name = settings.name;
    final Function pageBuilder = this._routes[name];
    if (pageBuilder != null) {
      if (settings.arguments != null) {
        // 如果透传了参数
        return MaterialPageRoute(
            builder: (context) =>
                pageBuilder(context, arguments: settings.arguments));
      } else {
        // 没有透传参数
        return MaterialPageRoute(builder: (context) => pageBuilder(context));
      }
    }
    return MaterialPageRoute(builder: (context) => HomeContent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('命名路由'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
      onGenerateRoute: this._routeGenerator,
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
            child: Row(
              children: <Widget>[Icon(Icons.search), Text('搜索')],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
            color: Theme.of(context).buttonColor,
          ),
          FlatButton(
            child: Row(
              children: <Widget>[Icon(Icons.person), Text('登录 传值(routes 表)')],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/login', arguments: {
                "title": "透传title",
                "name": 'postbird',
                'passw': '123456'
              });
            },
            color: Theme.of(context).buttonColor,
          ),
          FlatButton(
            child: Row(
              children: <Widget>[Icon(Icons.person_add), Text('注册 传值(onGenerateRoute 形式)')],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/sign', arguments: {
                "title": "透传title",
                "name": 'postbird',
                'passw': '123456'
              });
            },
            color: Theme.of(context).buttonColor,
          ),
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

// 登录  routes 的形式
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title']),
      ),
      body: Center(
        child: Text(arguments.toString()),
      ),
    );
  }
}

//  onGeneator 的形式
class SignPage extends StatelessWidget {
  final Map arguments;
  SignPage({Key key, this.arguments}) : super(key: key) {
    // print(this.arguments);
  }

  @override
  Widget build(BuildContext context) {
    String tmp = ModalRoute.of(context).settings.arguments.toString();
    String tmp2 = this.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(tmp),
      ),
      body: Center(child: Text(tmp2)),
    );
  }
}
