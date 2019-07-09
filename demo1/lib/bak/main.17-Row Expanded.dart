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
    return Column(
      children: <Widget>[
        RowDemo(),
        RowDemo1(),
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(flex: 1, child: IconContainer(icon: Icons.home)),
        Expanded(
            flex: 2,
            child: IconContainer(icon: Icons.settings, bgColor: Colors.blue)),
        Expanded(flex: 1, child: IconContainer(icon: Icons.search)),
      ],
    );
  }
}

class RowDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconContainer(icon: Icons.home, bgColor: Colors.pink),
        ),
        IconContainer(icon: Icons.settings, bgColor: Colors.blue),
      ],
    );
  }
}

class IconContainer extends StatelessWidget {
  IconContainer(
      {@required this.icon,
      this.color = Colors.white,
      this.size = 32,
      this.bgColor = Colors.yellow});

  final IconData icon;
  final double size;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(this.icon, size: this.size, color: this.color),
      ),
      width: 50,
      height: 50,
      color: this.bgColor,
    );
  }
}
