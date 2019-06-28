import 'package:flutter/material.dart';

const IMAGE_SRC = 'https://picsum.photos/id/142/600/400';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  HomeContent({Key key}) : super(key: key);

  List _list = List.generate(20, (index) => 'Item - $index');

  Widget _builder(context, index) {
    return ListTile(title: Text(_list[index]));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        title: Text('CustomScrollView'),
        backgroundColor: Colors.pink,
        // https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned.mp4
        floating: true,
        snap: false,
        pinned: true,
        expandedHeight: 200,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Icon(Icons.list),
          ),
        ],
        leading: Icon(Icons.home),
        flexibleSpace: Row(
          children: <Widget>[
            Expanded(
              child: Image.network(IMAGE_SRC, fit: BoxFit.cover),
            )
          ],
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          _builder,
          childCount: _list.length,
        ),
      ),
    ]);
  }
}
