import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

const IMAGE_SRC = 'https://picsum.photos/id/142/600/400';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static String _dsn =
      'https://89822c1cf16f4dfa9871720840ed20a6:ab5ab20e43af4f66a8d0ab05600f23ad@sentry.io/1490965';
  final SentryClient _sentry = SentryClient(dsn: _dsn);

  // _MyAppState() {
  //   try {
  //     double name = 1 / 0;
  //   } catch (err, stack) {
  //     _sentry.captureException(
  //       exception: err,
  //       stackTrace: stack,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sentry'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Report Error'),
            onPressed: () {
              _sentry.captureException(
                exception: Error(),
              );
            },
          ),
        ),
      ),
    );
  }
}
