import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeContent(),
      // theme: ThemeData.dark(),
      theme: ThemeData(primaryColor: Colors.yellow),
      routes: {
        'newRoute': (context) => NewRouteWidget(), // 路由表
      },
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('命名路由')),
        body: Center(
            child: Column(
          children: <Widget>[
            Text('Home'),
            FlatButton(
              child: Text('pushNamed 方法'),
              color: Colors.yellow,
              onPressed: () {
                Navigator.pushNamed(context, 'newRoute',
                    arguments: {'name': 'postbird'});
              },
            )
          ],
        )));
  }
}

// 新路由页面
class NewRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(title: Text('获取路由参数')),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(args.toString()),
            FlatButton(
              color: Colors.yellow,
              child: Text('pop'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )));
  }
}
