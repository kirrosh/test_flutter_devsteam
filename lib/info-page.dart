import 'dart:ui';

import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Container(
        child: Stack(children: <Widget>[
          Image.network(
            'https://images.unsplash.com/photo-1562887189-7c2ae6ace6dc?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMyNDU2fQ',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
                height: double.infinity,
//                width: double.infinity,
              ),
            ),
          ),
          Center(
            child: Image.network(
              'https://images.unsplash.com/photo-1562887189-7c2ae6ace6dc?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMyNDU2fQ',
              fit: BoxFit.fill,
//              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ]),
      ),
    );
  }
}
