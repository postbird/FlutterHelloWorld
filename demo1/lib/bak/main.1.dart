import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//  自定义组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeContent();
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Postbird 自定义 Widget!',
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 40, color: Colors.yellow),
    ));
  }
}
