import 'dart:math';

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
          title: Text('AnimatedOpacity Widget'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  double _opacity = 1.0;
  Matrix4 _transform = Matrix4.translationValues(0, 0, 0);

  void _onTapHandle() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
      _transform = _opacity == 0.0
          ? Matrix4.translationValues(-300, 0, 0)
          : Matrix4.translationValues(0, 0, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                transform: _transform,
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    color: Colors.pink,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                width: 100,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: InkWell(
            child: Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.pink,
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            onTap: _onTapHandle,
          ),
        )
      ],
    );
  }
}
