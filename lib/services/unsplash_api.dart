import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Album.dart';

const String CLIENT_ID =
    '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';
Future<List<Album>> fetchAlbum() async {
  List<Album> listModel = [];
  final response =
      await http.get('https://api.unsplash.com/photos/?client_id=$CLIENT_ID');

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
