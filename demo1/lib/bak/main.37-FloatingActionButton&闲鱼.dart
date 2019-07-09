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
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('发布')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('设置')),
          ],
        ),
        floatingActionButton: FloatingActionButtonDemo(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(top: 5),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.white,
        // border: Border(
        //   top: BorderSide(
        //     width: 1,
        //     color: Colors.grey,
        //   ),
        // ),
      ),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}
