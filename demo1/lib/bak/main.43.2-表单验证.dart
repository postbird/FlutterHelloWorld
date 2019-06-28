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
          title: Text('表单验证'),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '电话号码',
                  ),
                  validator: (value) {
                    RegExp reg = new RegExp(r'^\d{11}$');
                    if (!reg.hasMatch(value)) {
                      return '请输入11位手机号码';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '用户名',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '请输入用户名';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('提交'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('提交成功...'),
                      ));
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
