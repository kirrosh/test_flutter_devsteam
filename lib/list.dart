import 'package:devsteam1/services/unsplash_api.dart';
import 'package:flutter/material.dart';

import 'info-page.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;
  final String fullImageUrl;
  final String authorName;
  ImageItem({this.imageUrl, this.authorName, this.fullImageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InfoPage(
                    fullImageUrl: this.fullImageUrl,
                    authorName: this.authorName,
                  )),
        );
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.network(
                this.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              widthFactor: double.infinity,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                ),
                child: Text(
                  'by ${this.authorName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  Future<List<Album>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Container(
        child: FutureBuilder<List<Album>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView(
                children: snapshot.data
                    .map((item) => ImageItem(
                        imageUrl: item.urls['small'],
                        authorName: item.user['name'],
                        fullImageUrl: item.urls['full']))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              print(snapshot);
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
