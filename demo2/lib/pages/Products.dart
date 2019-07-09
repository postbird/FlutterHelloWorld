import 'package:flutter/material.dart';
import '../mock/products.dart' as goods;

class ProducsList extends StatelessWidget {
  const ProducsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
      ),
      padding: EdgeInsets.all(12),
      itemCount: goods.list.length,
      itemBuilder: (context, index) {
        final Map item = goods.list[index]['goods'];
        return Card(
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(4.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        item['imageUrlFor220'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item['title'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '￥${item['actualCurrentPriceForApp']}',
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.pink),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item['introduce'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
