import 'package:flutter/material.dart';
import 'mock/list.dart' as newsList;

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'http://cms-bucket.ws.126.net/2019/06/20/68fa7f186ffe4479ab27efabd4d94246.png';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget'),
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
    return NumberCounter();
  }
}

class NumberCounter extends StatefulWidget {
  @override
  _NumberCounterState createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
  int num = 0;


  initState() {
    num = 2;
  }



  // num set state
  numSetState([bool flag = true]) {
    return () => setState(() {
      flag ? num++ : num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            num.toString(),
            style: TextStyle(
              color: Colors.pink,
              fontSize: 40,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('+'),
                onPressed: numSetState(true),
                color: Theme.of(context).buttonColor,
              ),
              SizedBox(width: 10),
              FlatButton(
                child: Text('-'),
                onPressed: numSetState(false),
                color: Theme.of(context).buttonColor,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }
}
