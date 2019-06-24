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
              RaisedButton(
                child: Text('普通按钮'),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.pink,
                textColor: Colors.white,
                child: Text('颜色按钮'),
                onPressed: () {},
              ),
              RaisedButton(
                elevation: 20,
                focusElevation: 40,
                child: Text('阴影按钮'),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 300,
            height: 50,
            child: RaisedButton(
              child: Text('宽度高度按钮'),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    child: Text('自适应宽度按钮'),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton.icon(
                color: Colors.pink,
                textColor: Colors.white,
                icon: Icon(Icons.search),
                label: Text('图标按钮'),
                onPressed: () {},
              ),
              RaisedButton.icon(
                color: Colors.pink,
                textColor: Colors.white,
                icon: Icon(Icons.search),
                label: Text('不可点击'),
                onPressed: null,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('圆角按钮'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {},
              ),
              Container(
                height: 80,
                child: RaisedButton(
                  child: Text('圆形按钮'),
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.pink),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                splashColor: Colors.pink,
                child: Text('波纹'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
