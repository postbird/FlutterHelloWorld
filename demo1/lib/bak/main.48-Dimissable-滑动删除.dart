import 'dart:math';

import 'package:flutter/gestures.dart';
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
  List<Map> _list = List<Map>.generate(
    20,
    (i) => {'title': '标题$i', 'subTitle': '二级标题$i'},
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _list[index];
        return Dismissible(
          key: Key(item.toString()),
          // crossAxisEndOffset: 1.0,
          // secondaryBackground: Container(color: Colors.pink),
          dragStartBehavior: DragStartBehavior.down,
          direction: DismissDirection.endToStart,
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text(item['title']),
            subtitle: Text(item['subTitle']),
          ),
          onDismissed: (direction) {
            setState(() {
              _list.removeAt(index);
              print(_list.length);
            });
            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('删除成功...'),
            ));
          },
          confirmDismiss: (direction) {

          },
        );
      },
    );
  }
}
