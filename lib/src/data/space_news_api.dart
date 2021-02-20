import 'dart:convert';

import 'package:flutter_bloc_example/src/models/space_news_model.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class SpaceNewsAPI {
  const SpaceNewsAPI({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  String _buildURL(int page) {
    final Map<String, String> pathParams = <String, String>{'_limit': '5', '_start': '${page * 5}'};
    return Uri.https('test.spaceflightnewsapi.net', '/api/v2/articles', pathParams).toString();
  }

  Future<List<SpaceNews>> getSpaceNews(int page) async {
    final Response response = await _client.get(_buildURL(page));
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((dynamic json) => SpaceNews.fromJson(json)).toList();
  }
}
