import 'package:flutter/material.dart';
// import 'mock/list.dart' as newsList;

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'https://cdn.pixabay.com/photo/2019/06/17/07/47/madeira-4279303__240.jpg';
const IMAGE_SRC_2 =
    'https://cdn.pixabay.com/photo/2019/06/20/05/51/squirrel-4286247__480.jpg';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('个人信息编辑Demo'),
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
  String _username;
  int _sex = 1;
  String _desc;

  List<Map> _favorites = [
    {'title': '篮球', 'checked': true},
    {'title': '足球', 'checked': false},
    {'title': '英式橄榄球', 'checked': false},
  ];

  void _userNameChangedHandle(value) {
    setState(() {
      this._username = value;
    });
  }

  void _sexChangedHandle(value) {
    setState(() {
      this._sex = value;
    });
  }

  Function _favoritesChangedHandle(index) {
    return (value) {
      setState(() {
        this._favorites[index]['checked'] = value;
      });
    };
  }

  _descChangedHandle(value) {
    setState(() {
      this._desc = value;
    });
  }

  _submitHandle() {
    print(this._username);
    print(this._sex);
    print(this._favorites);
    print(this._desc);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        TextContainer(
          hintText: '用户名',
          onChanged: this._userNameChangedHandle,
        ),
        SizedBox(height: 10),
        SexContainer(
          groupValue: this._sex,
          onChanged: this._sexChangedHandle,
        ),
        SizedBox(height: 10),
        Favorites(
          list: this._favorites,
          onChanged: _favoritesChangedHandle,
        ),
        SizedBox(height: 10),
        TextContainer(
          maxLines: 3,
          hintText: '描述信息...',
          onChanged: this._descChangedHandle,
        ),
        SizedBox(height: 40),
        FlatButton(
          color: Colors.pink,
          textColor: Colors.white,
          child: Text('提交'),
          onPressed: this._submitHandle,
        )
      ],
    );
  }
}

class TextContainer extends StatelessWidget {
  final Function onChanged;
  final String hintText;
  final int maxLines;
  TextContainer({
    Key key,
    this.onChanged,
    this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.pink,
      maxLines: maxLines,
      onChanged: this.onChanged,
      decoration: InputDecoration(
        hintText: this.hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}

// 性别
class SexContainer extends StatelessWidget {
  final Function onChanged;
  final int groupValue;
  // final

  SexContainer({Key key, this.onChanged, this.groupValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('男'),
        Radio(
          activeColor: Colors.pink,
          value: 1,
          groupValue: this.groupValue,
          onChanged: this.onChanged,
        ),
        Text('女'),
        Radio(
          activeColor: Colors.pink,
          value: 2,
          groupValue: this.groupValue,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}

class Favorites extends StatelessWidget {
  final List<Map> list;
  final Function onChanged;
  List<Widget> _children = new List<Widget>();
  Favorites({Key key, this.list, this.onChanged}) : super(key: key) {
    this._initCheckboxList();
  }

  void _initCheckboxList() {
    for (int i = 0; i < this.list.length; i++) {
      Map item = this.list[i];
      this._children.add(Row(
            children: <Widget>[
              Text(item['title']),
              Checkbox(
                activeColor: Colors.pink,
                value: item['checked'],
                onChanged: this.onChanged(i),
              )
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this._children,
    );
  }
}
