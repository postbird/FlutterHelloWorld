import 'package:flutter/material.dart';

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'http://cms-bucket.ws.126.net/2019/06/20/68fa7f186ffe4479ab27efabd4d94246.png';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row Widget'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RowDemo();
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: <Widget>[
            IconContainer(color: Colors.white, icon: Icons.home),
            IconContainer(color: Colors.blue, icon: Icons.search),
            IconContainer(color: Colors.yellow, icon: Icons.settings),
            IconContainer(color: Colors.white, icon: Icons.track_changes),
          ],
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        width: 600,
        height: 800,
        color: Colors.grey);
  }
}

class IconContainer extends StatelessWidget {
  IconContainer({
    @required this.icon,
    this.color = Colors.white,
    this.size = 32,
  });

  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(this.icon, size: this.size, color: this.color),
      ),
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}
