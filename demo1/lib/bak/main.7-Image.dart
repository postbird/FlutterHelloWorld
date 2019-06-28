import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

const IMAGE_SRC = 'https://picsum.photos/id/142/600/400';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Widget'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ImageDemo1(),
              ImageDemo2(),
              ImageDemo3(),
            ],
          ),
          ImageDemo4(),
          Row(
            children: <Widget>[
              ImageDemo5(),
              FadeInImageDemo(),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        IMAGE_SRC,
        alignment: Alignment.bottomRight,
        color: Colors.blue,
        colorBlendMode: BlendMode.colorBurn,
        fit: BoxFit.cover, // 填充拉伸裁剪
        // repeat: ImageRepeat.repeatX, // 重复
      ),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius:
              BorderRadius.all(Radius.circular(20))), // 通过 container 实现圆角有问题
    );
  }
}

// 圆形图片-1
class ImageDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        IMAGE_SRC,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
        // color: Colors.black
      ),
    );
  }
}

// 圆形图片-2 - 通过 container
class ImageDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          image: DecorationImage(
              image: NetworkImage(IMAGE_SRC),
              fit: BoxFit.cover)), // 通过 container 实现圆角
    );
  }
}

// 本地图片
// yaml 需要配置
class ImageDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/demo.png', fit: BoxFit.contain),
      width: 100,
      height: 100,
    );
  }
}

// 网络缓存图片
class ImageDemo5 extends StatelessWidget {
  const ImageDemo5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        width: 100,
        height: 50,
        fit: BoxFit.cover,
        imageUrl: IMAGE_SRC,
        placeholder: (context, url) => CircularProgressIndicator(
            // backgroundColor: Colors.pink,
            ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

// FadeInImage
class FadeInImageDemo extends StatelessWidget {
  const FadeInImageDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'images/loading.gif',
      image: IMAGE_SRC,
      width: 100,
      height: 50,
    );
  }
}
