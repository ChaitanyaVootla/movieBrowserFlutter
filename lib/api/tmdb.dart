import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> makeRequest(
    {required String url, required bool getResults}) async {
  try {
    // Make the GET request
    final res = await http.get(Uri.parse(url));
    final jsonRes = json.decode(res.body);
    if (getResults) {
      return jsonRes['results'];
    }
    return jsonRes;
  } catch (e) {
    print("************* API error $e");
    return [];
  }
}

Future<dynamic> getTrendingMovies() async {
  return makeRequest(
      url:
          'https://api.themoviedb.org/3/trending/all/week?api_key=40d0d5cd9342dfe3e629ea9a7daa4f23',
      getResults: true);
}

Future<dynamic> getTrendingSeries() async {
  return makeRequest(
      url:
          'https://api.themoviedb.org/3/trending/tv/week?api_key=40d0d5cd9342dfe3e629ea9a7daa4f23',
      getResults: true);
}

Future<dynamic> getTrendingAll() async {
  return makeRequest(
      url:
          'https://api.themoviedb.org/3/trending/all/week?api_key=40d0d5cd9342dfe3e629ea9a7daa4f23',
      getResults: true);
}

Future<dynamic> getMovie(int id) async {
  return makeRequest(
      url:
          'https://api.themoviedb.org/3/movie/$id?&api_key=40d0d5cd9342dfe3e629ea9a7daa4f23&append_to_response=videos,images,credits,similar,recommendations,keywords',
      getResults: false);
}
