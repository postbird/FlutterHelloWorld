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
        theme: ThemeData(primaryColor: Colors.yellow));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('路由')),
        body: Center(
            child: Column(
          children: <Widget>[
            Text('Home'),
            FlatButton(
              child: Text('open new route'),
              color: Colors.yellow,
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      return NewRouteWidget();
                    },
                    settings:
                        RouteSettings(arguments: {'name': 'postbird'}), // 传参
                    fullscreenDialog: true));
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
        appBar: AppBar(title: Text('获取参数')),
        body: Center(
            child: Column(
          children: <Widget>[
            Text(args.toString()),
            FlatButton(
              child: Text('pop'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )));
  }
}
