import 'package:flutter/material.dart';

import 'info-page.dart';

class ImageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  '123',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1562887189-7c2ae6ace6dc?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMyNDU2fQ',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ImageItem(),
            ImageItem(),
            ImageItem(),
            ImageItem(),
            ImageItem(),
            ImageItem(),
            ImageItem(),
            ImageItem(),
          ],
        ),
      ),
    );
  }
}
