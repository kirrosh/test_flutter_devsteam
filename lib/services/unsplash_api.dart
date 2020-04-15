import 'dart:convert';

import 'package:http/http.dart' as http;

class AlbumUrls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  AlbumUrls({this.raw, this.full, this.regular, this.small, this.thumb});

  factory AlbumUrls.fromJson(Map<String, dynamic> json) {
    return AlbumUrls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
    );
  }
}

class AlbumLinks {
  final String self;
  final String html;
  final String download;
  final String download_location;

  AlbumLinks({
    this.self,
    this.html,
    this.download,
    this.download_location,
  });

  factory AlbumLinks.fromJson(Map<String, dynamic> json) {
    return AlbumLinks(
      self: json['self'],
      html: json['html'],
      download: json['download'],
      download_location: json['download_location'],
    );
  }
}

class Album {
  final String id;
  final String created_at;
  final String updated_at;
  final String promoted_at;
  final int width;
  final int height;
  final String color;
  final String description;
  final String alt_description;
  final urls;
  final links;
  final int likes;
  final bool liked_by_user;
  // unused
//  final List<String> categories;
//  final List<String> current_user_collections;
  final user;
  final sponsorship;

//  "id": "9yx3FyexTOU",
//  "created_at": "2019-05-27T14:23:58-04:00",
//  "updated_at": "2020-04-14T01:06:13-04:00",
//  "promoted_at": null,
//  "width": 4002,
//  "height": 6000,
//  "color": "#F59C3C",
//  "description": null,
//  "alt_description": "orange and black Harley-Davidson motorcycle",
//  "urls": {5 items},
//  "links": {4 items},
//  "categories": [],
//  "likes": 1025,
//  "liked_by_user": false,
//  "current_user_collections": [],
//  "user": {17 items},
//  "sponsorship": {3 items}

  Album({
    this.id,
    this.created_at,
    this.updated_at,
    this.promoted_at,
    this.width,
    this.height,
    this.color,
    this.description,
    this.alt_description,
    this.urls,
    this.links,
    this.likes,
    this.liked_by_user,
//    this.categories,
//    this.current_user_collections,
    this.user,
    this.sponsorship,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      promoted_at: json['promoted_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      description: json['description'],
      alt_description: json['alt_description'],
      urls: json['urls'],
      links: json['links'],
      likes: json['likes'],
      liked_by_user: json['liked_by_user'],
//      categories: json['categories'],
//      current_user_collections: json['current_user_collections'],
      user: json['user'],
      sponsorship: json['sponsorship'],
    );
  }
}

Future<List<Album>> fetchAlbum() async {
  List<Album> listModel = [];
  final response = await http.get(
      'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    for (Map i in data) {
      listModel.add(Album.fromJson(i));
    }
    return listModel;
  } else {
    throw Exception('Failed to load album');
  }
}
