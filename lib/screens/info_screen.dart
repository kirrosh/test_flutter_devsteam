import 'dart:ui';

import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final String fullImageUrl;
  final String authorName;

  const InfoScreen({Key key, this.fullImageUrl, this.authorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('by ${this.authorName}'),
      ),
      body: Container(
          child: Stack(
        children: <Widget>[
          Image.network(
            this.fullImageUrl,
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
              ),
            ),
          ),
          Center(
            child: Image.network(
              this.fullImageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
