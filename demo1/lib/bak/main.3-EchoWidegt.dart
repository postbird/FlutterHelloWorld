import 'package:flutter/material.dart';
import './widegts/EchoWidegt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Postbird Flutter')),
          body: HomeContent(),
        ),
        // theme: ThemeData.dark(),
        theme: ThemeData(primaryColor: Colors.yellow));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: EchoWidegt(
        text: '啊啊啊啊',
        backgroundColor: Colors.pink,
      ),
    );
  }
}
