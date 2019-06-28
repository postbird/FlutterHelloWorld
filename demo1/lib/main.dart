import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(CupertinoAppDemo());

Future fetchGoodsList() async {
  const String url =
      'https://activity.kaola.com/activity/newArrival/goodsList.html?acId=440&limit=48&offset=0';
  http.Response response = await http.get(url);
  return json.decode(response.body).data.goodsList;
}

class CupertinoAppDemo extends StatelessWidget {
  const CupertinoAppDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('CupertinoApp'),
        ),
        child: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Cart'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SearchTab(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CartTab(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ProductListTab(),
              );
            });
        }
      },
    );
  }
}

class ProductListTab extends StatelessWidget {
  const ProductListTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Cupertino Store'),
        ),
      ],
    );
  }
}

class SearchTab extends StatelessWidget {
  const SearchTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Search'),
        ),
      ],
    );
  }
}

class CartTab extends StatelessWidget {
  const CartTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Cart'),
        ),
      ],
    );
  }
}
