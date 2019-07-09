import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Postbird Flutter')
        ),
        body: HomeContent(),
      ),
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.yellow
      )
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Postbird 自定义 Widget!',
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 40, color: Colors.blue),
    ));
  }
}