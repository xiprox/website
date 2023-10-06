import 'package:api_call/api_call.dart';
import 'package:dio/dio.dart';
import 'package:website/data/models/track.dart';

class Api {
  final _client = Dio(BaseOptions(baseUrl: 'https://api.ihsan.dev'));

  Future<Resource<List<Track>>> getTracks() async {
    final response = await _client.get<List<dynamic>>('/music');
    if (response.statusCode == 200) {
      final tracks = response.data?.map((it) => Track.fromJson(it)).toList();
      return Resource.success(tracks ?? []);
    } else {
      return Resource<List<Track>>.error(
        response.statusMessage ??
            response.statusCode?.toString() ??
            response.data?.toString() ??
            '?',
      );
    }
  }
}
