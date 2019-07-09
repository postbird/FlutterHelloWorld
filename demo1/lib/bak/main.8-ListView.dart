import 'package:flutter/material.dart';

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'https://cdn.pixabay.com/photo/2019/05/20/13/22/portugal-4216645_1280.jpg';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Widget'),
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
      child: ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListItemImage(),
        ListItemImage(),
        ListItemImage2(),
        ListItemImage2(),
        ListItemIcon(),
        ListItemIcon(),
        ListItemOnlyImage(),
        ListItemOnlyImage(),
      ],
      padding: EdgeInsets.all(12),
    );
  }
}

class ListItemIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.settings, color: Colors.pink, size: 50),
      trailing: Icon(Icons.chevron_right, color: Colors.pink),
      title: Text(TITLE),
      subtitle: Text(
        SUB_TITLE,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ListItemImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          child: Image.network(
            IMAGE_SRC,
            fit: BoxFit.cover,
          ),
          color: Colors.grey,
          width: 60,
          height: 60),
      trailing: Icon(Icons.chevron_right, color: Colors.pink),
      title: Text(TITLE),
      subtitle: Text(
        SUB_TITLE,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ListItemImage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
          child: Image.network(
            IMAGE_SRC,
            fit: BoxFit.cover,
          ),
          color: Colors.grey,
          width: 60,
          height: 60),
      title: Text(TITLE),
      subtitle: Text(
        SUB_TITLE,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ListItemOnlyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(IMAGE_SRC, fit: BoxFit.cover),
      color: Colors.grey,
      width: 600,
      height: 400,
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
