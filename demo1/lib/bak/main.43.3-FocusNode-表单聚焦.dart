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
          title: Text('表单聚焦'),
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: '电话号码',
                      ),
                    ),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: '用户名',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: InkWell(
              child: Icon(Icons.edit),
              onTap: () => FocusScope.of(context).requestFocus(_focusNode)),
          bottom: 30,
          right: 40,
        ),
      ],
    );
  }
}
