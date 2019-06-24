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
          title: Text('表单取值设置值'),
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
    return TextFieldDemo();
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key key}) : super(key: key);

  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  TextEditingController _name = TextEditingController();
  TextEditingController _pass = TextEditingController();

  @override
  void initState() {
    super.initState();
    this._name.text = 'ptbird'; // 设置初始值
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: '账户',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey[300],
              ),
            ),
            controller: this._name,
            onChanged: (value) {
              this.setState(() {
                this._name.text = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: '密码',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey[300],
              ),
            ),
            controller: this._pass,
            onChanged: (value) {
              this.setState(() {
                this._pass.text = value;
              });
            },
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              child: Text('Login'),
              onPressed: () {
                print(this._name);
                print(this._pass);
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Text('${this._name.text} - ${this._pass.text}'),
          ),
        ],
      ),
    );
  }
}
