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
          title: Text('Container Widget'),
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
    return Center(
      child: Container(
        child: Text(
          '超长文本截断字体等超长文本截断字体等超长文本截断字体等超长文本截断字体等超长文本截断字体等超长文本截断字体等超长文本截断字体等',
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              letterSpacing: 2,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
              decorationColor: Colors.yellow,
              decorationStyle: TextDecorationStyle.dotted),
        ),
        height: 300.0,
        width: 300,
        // padding: EdgeInsets.all(20),
        padding: EdgeInsets.fromLTRB(20, 10, 40, 20),
        margin: EdgeInsets.only(top: 100),
        transform: Matrix4.translationValues(10, 0, 0),
        // transform: Matrix4.rotationX(5),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          boxShadow: [
            // 阴影
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(10.0, 12.0),
              blurRadius: 4.0,
            ),
          ],
          color: Colors.pink,
          border: Border.all(
            color: Colors.black, 
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
