import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

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
      home: Scaffold(
          appBar: AppBar(
            title: Text('WebSocketDemo'),
          ),
          body: WebSocketDemo()),
    );
  }
}

class WebSocketDemo extends StatefulWidget {
  WebSocketDemo({Key key}) : super(key: key);

  _WebSocketDemoState createState() => _WebSocketDemoState();
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  List _list = new List();
  String _message;
  IOWebSocketChannel _channel =
      IOWebSocketChannel.connect("ws://echo.websocket.org");

  void _onChangedHandle(value) {
    setState(() {
      _message = value.toString();
    });
  }

  _WebSocketDemoState() {
    print(_channel);
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      _list.add('[Info] Connected Successed!');
    });

    // 监听消息
    _channel.stream.listen((message) {
      print(message);
      setState(() {
        _list.add('[Received] ${message.toString()}');
      });
    });
  }

  void _sendHandle() {
    if (_message.isNotEmpty) {
      _list.add('[Sended] $_message');
      _channel.sink.add(_message);
    }
  }

  Widget _generatorForm() {
    return Column(
      children: <Widget>[
        TextField(onChanged: _onChangedHandle),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text('Send'),
              onPressed: _sendHandle,
            )
          ],
        )
      ],
    );
  }

  List<Widget> _generatorList() {
    List<Widget> tmpList = _list.map((item) => ListItem(msg: item)).toList();
    List<Widget> prefix = [_generatorForm()];
    prefix.addAll(tmpList);
    return prefix;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: _generatorList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _channel.sink.close();
  }
}

class ListItem extends StatelessWidget {
  final String msg;
  ListItem({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(msg);
  }
}
