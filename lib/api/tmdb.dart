import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> makeRequest({required String url}) async {
  try {
    // Make the GET request
    final res = await http.get(Uri.parse(url));
    final jsonRes = json.decode(res.body);
    return jsonRes['results'];
  } catch (e) {
    return [];
  }
}

Future<List<dynamic>> getTrendingMovies() async {
  return makeRequest(
      url:
          'https://api.themoviedb.org/3/trending/all/week?api_key=40d0d5cd9342dfe3e629ea9a7daa4f23');
}

Future<List<dynamic>> getTrendingSeries() async {
  return makeRequest(
      url:
          'https://api.themoviedb.org/3/trending/tv/week?api_key=40d0d5cd9342dfe3e629ea9a7daa4f23');
}

Future<List<dynamic>> getTrendingAll() async {
  return makeRequest(
      url:
          'https://api.themoviedb.org/3/trending/all/week?api_key=40d0d5cd9342dfe3e629ea9a7daa4f23');
}
