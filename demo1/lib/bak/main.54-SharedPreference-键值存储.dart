import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            title: Text('Preferences Demo'),
          ),
          body: PreferencesDemo()),
    );
  }
}

class PreferencesDemo extends StatefulWidget {
  PreferencesDemo({Key key}) : super(key: key);
  _PreferencesDemoState createState() => _PreferencesDemoState();
}

class _PreferencesDemoState extends State<PreferencesDemo> {
  String _key;
  String _value;
  SharedPreferences _prefs;

  _PreferencesDemoState() {
    _key = 'name';
    _value = 'postbird-value';
    _getInstance();
  }

  void _getInstance() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _savePressedHandle() {
    _value = DateTime.now().toString();
    _prefs.setString(_key, _value);
    print(_prefs);
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('set succssed')));
  }

  void _getPressedHandle() {
    final name = _prefs.getString(_key);
    print(name);
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('get $name')));
  }

  void _removePressedHandle() {
    final res = _prefs.remove(_key);
    print(res);
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('remove $_key')));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('setString'),
              onPressed: _savePressedHandle,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('getString'),
              onPressed: _getPressedHandle,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('remove'),
              onPressed: _removePressedHandle,
            )
          ],
        )
      ],
    );
  }
}
