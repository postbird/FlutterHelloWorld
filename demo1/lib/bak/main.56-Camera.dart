import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

const IMAGE_SRC =
    'http://imglf3.nosdn.127.net/img/Mm9KQTVTN2NLSmxOdXp0Q3pRMTYycm1IakVPcERLOTNPVjRTcEJrZ2M5ZUpuMk1WMXJGNEhBPT0.jpg';

Future<void> main() async {
  final cameras = await availableCameras();
  Widget _body;
  if (cameras.length > 0) {
    _body = HomeContent(camera: cameras[0]);
  } else {
    _body = Center(child: Text('No Cameras'));
  }
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Camera Demo'),
      ),
      body: _body,
    ),
  ));
}

class HomeContent extends StatefulWidget {
  final CameraDescription camera;
  HomeContent({Key key, @required this.camera}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return Container(
                child: CameraPreview(_cameraController),
                width: 400,
                height: 300,
              );
            } else {
              // Otherwise, display a loading indicator.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        SizedBox(height: 30),
        RaisedButton(
          child: Icon(Icons.camera),
          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final path = join((await getTemporaryDirectory()).path,
                  '${DateTime.now()}.png');
              await _cameraController.takePicture(path);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ));
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(path)));
            } catch (err, stack) {
              print(err);
            }
          },
        ),
      ],
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picture'),
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
