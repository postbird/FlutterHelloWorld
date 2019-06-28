import 'package:flutter/material.dart';
import './themes/light.dart';
import './pages/Login.dart';
import './pages/Products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeContent(),
        '/login': (context) => Login(),
      },
      initialRoute: '/login',
      theme: lightTheme,
      // home: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, semanticLabel: 'menu'),
        title: Text('KAOLA'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {},
          ),
        ],
      ),
      body: ProducsList(),
    );
  }
}
