import 'package:flutter/material.dart';

class ImageData {
  final String imageUrl;
  final String name;
  final String full;

  ImageData({this.imageUrl, this.name, this.full});
}

class StyledCard extends StatelessWidget {
  final ImageData imageData;

  const StyledCard({Key key, this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.cyan),
                child: Image(
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                  image: NetworkImage(this.imageData.imageUrl),
                ),
              ),
            ),
            alignment: Alignment.center,
          ),
          Container(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.zero, bottom: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  this.imageData.name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
