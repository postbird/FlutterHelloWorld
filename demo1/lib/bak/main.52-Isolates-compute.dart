import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
            title: Text('Isolates'),
          ),
          body: HttpRequestDemo()),
    );
  }
}

class Photo {
  final String thumbnailUrl;

  Photo({this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> data) {
    return Photo(
      thumbnailUrl: data['tcover'] as String,
    );
  }
}

List<Photo> generatorPhoto(String body) {
  List list = json.decode(body);
  return list.map<Photo>((item) => Photo.fromJson(item)).toList();
}

Future<List<Photo>> _fetchPhotos(http.Client client) async {
  http.Response response = await client.get(
      'https://3g.163.com/photocenter/api/list/0001/00AP0001,3R710001,4T8E0001/30/100.json');
  return compute(generatorPhoto, response.body);
}

class HttpRequestDemo extends StatelessWidget {
  const HttpRequestDemo({Key key}) : super(key: key);

  // Future<List<Photo>> _fetchPhotos(http.Client client) async {
  //   http.Response res =
  //       await client.get('https://3g.163.com/photocenter/api/list/0001/00AP0001,3R710001,4T8E0001/30/100.json');
  //   List list = json.decode(res.body);
  //   return list.map((item) {
  //     return Photo.fromJson(item);
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: _fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          return PhotoListView(list: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class PhotoListView extends StatelessWidget {
  final List<Photo> list;

  PhotoListView({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) {
        return Image.network(list[i].thumbnailUrl);
      },
    );
  }
}
