import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale.fromSubtags(languageCode: 'zh'),
        const Locale.fromSubtags(languageCode: 'en'),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text('日期时间选择'),
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
  DateTime _date = new DateTime.now();
  TimeOfDay _time;

  _HomeContentState() {
    print(this._date);
    print('时间戳: ${this._date.millisecondsSinceEpoch}');
    print(
        DateTime.fromMillisecondsSinceEpoch(this._date.millisecondsSinceEpoch));

    this._time = new TimeOfDay.now();
  }

  String _formatDate() {
    return formatDate(this._date, ['yyyy', '-', 'mm', '-', 'dd']);
  }

  String _formatTime() {
    return this._time.format(this.context);
  }

  void _showDatePicker() async {
    DateTime tmpDate = await showDatePicker(
      context: this.context,
      initialDate: this._date,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
      locale: Locale('zh'),
    );
    if (tmpDate != null) {
      setState(() {
        this._date = tmpDate;
      });
    }
  }

  void _showTimePicker() async {
    TimeOfDay tmpTime = await showTimePicker(
      context: this.context,
      initialTime: TimeOfDay.fromDateTime(this._date),
    );
    if (tmpTime != null) {
      setState(() {
        this._time = tmpTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(this._formatDate()),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: this._showDatePicker,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(this._formatTime()),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: this._showTimePicker,
            ),
          ],
        )
      ],
    );
  }
}
