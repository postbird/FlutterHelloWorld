import 'package:flutter/material.dart';

const IMAGE_SRC =
    'http://imglf3.nosdn.127.net/img/Mm9KQTVTN2NLSmxOdXp0Q3pRMTYycm1IakVPcERLOTNPVjRTcEJrZ2M5ZUpuMk1WMXJGNEhBPT0.jpg';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Row(
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: 'imgHero',
                child: Image.network(
                  IMAGE_SRC,
                  fit: BoxFit.cover,
                  width: 300,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewPage(),
                    // settings: RouteSettings(isInitialRoute: true),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('NewPage')),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Hero(
                    tag: 'imgHero',
                    child: Image.network(
                      IMAGE_SRC,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text('阿斯达大所大所多'),
          SizedBox(height: 30),
          Text('阿斯达大所大所多'),
          SizedBox(height: 30),
          Text('阿斯达大所大所多'),
          SizedBox(height: 30),
          Text('阿斯达大所大所多'),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
