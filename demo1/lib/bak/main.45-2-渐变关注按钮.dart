import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Follow'),
        ),
        body: FollowWidget(),
      ),
    );
  }
}

class FollowWidget extends StatefulWidget {
  FollowWidget({Key key}) : super(key: key);

  _FollowWidgetState createState() => _FollowWidgetState();
}

class _FollowWidgetState extends State<FollowWidget> {
  bool _followStatus = false;

  void _followClickHandle() {
    setState(() {
      this._followStatus = !this._followStatus;
    });
  }

  List<Color> _getGradient() {
    if (this._followStatus) {
      return <Color>[Colors.grey, Colors.grey];
    } else {
      return <Color>[const Color(0xFFFF5000), const Color(0xFFFF9000)];
    }
  }

  List<Widget> _getContent() {
    List<Widget> defaultContent = <Widget>[
      Text(
        this._followStatus ? '已关注' : '关注',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      )
    ];
    List<Widget> prefixContent = <Widget>[
      Image.network(
        'https://gw.alicdn.com/tfs/TB1OC0TXMMPMeJjy1XcXXXpppXa-108-84.png',
        height: 16,
      ),
      SizedBox(width: 3)
    ];
    if (!this._followStatus) {
      defaultContent.insertAll(0, prefixContent);
    }
    return defaultContent;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedContainer(
        width: 90,
        height: 40,
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment(-1, 0),
            end: Alignment(1.0, 0),
            colors: this._getGradient(),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: this._getContent(),
        ),
      ),
      onTap: this._followClickHandle,
    );
  }
}
