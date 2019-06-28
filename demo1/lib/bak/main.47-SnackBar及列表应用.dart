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
          title: Text('SnackBar Widget'),
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
  List<Map> _list = [
    {'title': '标题1', 'subTitle': '二级标题1'},
    {'title': '标题2', 'subTitle': '二级标题2'},
    {'title': '标题3', 'subTitle': '二级标题3'},
  ];

  Map _deleteCache;

  Function _onDeleteHandle(i) {
    return () {
      _deleteCache = {'index': i, 'data': _list[i]};
      setState(() {
        _list.removeAt(i);
      });
      // show snackBar
      SnackBar snackBar = SnackBar(
        content: Text('已经删除'),
        action: SnackBarAction(
            label: '撤销',
            onPressed: () {
              if (_deleteCache != null) {
                setState(() {
                  _list.insert(_deleteCache['index'], _deleteCache['data']);
                });
                
                _deleteCache = null;
              }
            }),
      );
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(snackBar);
    };
  }

  List<Widget> _getList() {
    List<Widget> list = [];
    for (int i = 0; i < _list.length; i++) {
      list.add(ListItem(
        title: _list[i]['title'],
        subTtitle: _list[i]['subTitle'],
        onDelete: _onDeleteHandle(i),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getList(),
    );
  }
}

class ListItem extends StatelessWidget {
  final Function onDelete;
  final String title;
  final String subTtitle;
  const ListItem({Key key, this.onDelete, this.title, this.subTtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        subtitle: Text(subTtitle),
        trailing: InkWell(
          child: Icon(Icons.delete),
          onTap: this.onDelete,
        ));
  }
}
