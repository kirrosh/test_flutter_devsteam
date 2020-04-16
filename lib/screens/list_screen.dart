import 'package:devsteam1/components/carousel.dart';
import 'package:devsteam1/components/styled_card.dart';
import 'package:devsteam1/services/Album.dart';
import 'package:devsteam1/services/unsplash_api.dart';
import 'package:flutter/material.dart';

class ImageListScreen extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageListScreen> {
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
              return CarouselWithState(
                images: snapshot.data
                    .map((item) => ImageData(
                        imageUrl: item.urls.small,
                        name: item.user.name,
                        full: item.urls.full))
                    .toList(),
              );
            } else if (snapshot.hasError) {
//              print(snapshot);
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
