import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

const String VIDEO_URL = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('video_player'),
          ),
          body: HomeContent()),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(VIDEO_URL);
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                // aspectRatio: 16 / 9,
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        SizedBox(height: 30),
        RaisedButton(
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
        )
      ],
    );
  }
}
