import 'package:flutter/material.dart';

class EchoWidegt extends StatelessWidget {
  const EchoWidegt({
    @required this.text,
    this.backgroundColor,
  });

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: this.backgroundColor,
      child: Text(this.text),
    ));
  }
}
