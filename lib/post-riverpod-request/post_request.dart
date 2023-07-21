import 'dart:convert';

import 'package:http/http.dart';

import 'album.dart';

class ApiService {
  // final String title;
  // ApiService({required this.title});
  String endpoint = 'https://jsonplaceholder.typicode.com/albums';

  Future<Album> createAlbum(String title) async {
    Response response = await post(Uri.parse(endpoint), body: {
      'title': title,
    }).timeout(const Duration(seconds: 5));

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
