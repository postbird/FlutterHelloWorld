import 'package:flutter/material.dart';
// import 'mock/list.dart' as newsList;

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'http://imgcdn.ph.126.net/UQhSl0NAkp9wsn0keF-rLA==/3084402794814350820.jpg';
const IMAGE_SRC_2 =
    'http://imglf.nosdn.127.net/img/NVc1cHVseFhyWFcwdHhpdjJydFRvcWJSa0NNbGlRbGN2TXNOS3NwQVdET042YmpmemdjUm5RPT0.jpg';

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
          title: Text('Button'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.pink,
                textColor: Colors.white,
                child: Text('扁平按钮'),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                child: Text('边框按钮'),
                onPressed: () {},
              ),
              OutlineButton(
                borderSide: BorderSide(color: Colors.pink),
                child: Text('边框按钮'),
                onPressed: () {},
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
              splashColor: Colors.pink,
              color: Colors.pink,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              splashColor: Colors.pink,
              color: Colors.pink,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    child: Text('按钮组'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    child: Text('按钮组'),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              PrimayButton(
                text: '自定义按钮',
                onPressed: () {
                  print('自定义按钮自定义按钮');
                },
              ),
              PrimayButton(
                text: '自定义按钮',
              )
            ],
          )
        ],
      ),
    );
  }
}

class PrimayButton extends StatelessWidget {
  final String text;
  final onPressed;
  PrimayButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.blue[100],
        disabledTextColor: Colors.white54,
        child: Text(this.text),
        onPressed: this.onPressed,
      ),
    );
  }
}
