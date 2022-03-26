import 'package:api_call/api_call.dart';
import 'package:dio/dio.dart';
import 'package:website/data/models/track.dart';

class Api {
  final _client = Dio(BaseOptions(baseUrl: 'https://api.ihsan.dev'));

  Future<Resource<List<Track>>> getTracks() {
    return ApiCall<List<Track>>(_client).get('/tracks').parseWith((json) {
      return (json as List).map((it) => Track.fromJson(it)).toList();
    }).execute();
  }
}
