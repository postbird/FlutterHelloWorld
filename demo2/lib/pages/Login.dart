import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(24.0),
        children: <Widget>[
          SizedBox(height: 160.0),
          Column(
            children: <Widget>[
              Image.network(
                'https://haitao.nos.netease.com/70dee793-133d-4628-b374-b99e29aad157.png',
                height: 50,
              ),
            ],
          ),
          SizedBox(height: 60.0),
          Column(
            children: <Widget>[
              PrimaryColorOverride(
                child: TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                color: Theme.of(context).accentColor,
              ),
              SizedBox(height: 20),
              PrimaryColorOverride(
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                color: Theme.of(context).accentColor,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    textColor: Colors.black54,
                    child: Text('CENCEL'),
                    onPressed: () {
                      _userNameController.clear();
                      _passwordController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: 15.0),
                  RaisedButton(
                    color: Theme.of(context).buttonColor,
                    child: Text('LOGIN'),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
